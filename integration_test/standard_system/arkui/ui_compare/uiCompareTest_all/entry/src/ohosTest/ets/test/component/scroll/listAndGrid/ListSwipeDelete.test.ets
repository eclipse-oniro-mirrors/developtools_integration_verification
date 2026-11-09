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

export default function listSwipeDeleteTest() {
  describe('listSwipeDeleteTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0150
     * @tc.name   : list弹簧链式动效中chainAnimationOptions中设置edgeEffect为ChainEdgeEffect.DEFAULT
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0150 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listChain15')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、listltem之间存在间隔
      // 2、设置chainAnimation中属性为true
      // 3、iedgeEffect设置为ChainEdgeEffect.DEFAULT
      // 4、手指进行滑动，过界拖拽（上拉过界/下拉过界）
      let list: Component = await driver.waitForComponent(ON.id('listChain_15'), 1000);
      
      // 下拉过界（滑动到底部）
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      
      // 上拉过界（滑动到顶部）
      await list.scrollToTop(2000);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0150');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0150 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0160
     * @tc.name   : list弹簧链式动效中chainAnimationOptions中设置edgeEffect为ChainEdgeEffect.STRETCH
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0160 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listChain16')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、listltem之间存在间隔
      // 2、设置chainAnimation中属性为true
      // 3、iedgeEffect设置为ChainEdgeEffect.STRETCH
      // 4、手指进行滑动，过界拖拽（上拉过界/下拉过界）
      let list: Component = await driver.waitForComponent(ON.id('listChain_16'), 1000);
      
      // 下拉过界（滑动到底部）
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      
      // 上拉过界（滑动到顶部）
      await list.scrollToTop(2000);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0160');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0160 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0350
     * @tc.name   : list弹簧链式动效中chainAnimation设置为false
     * @tc.desc   : Verify listandgrid list leftseipedelete chain interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0350 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listChain35')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、listltem之间存在间隔
      // 2、设置chainAnimation中属性为false
      // 3、手指进行滑动
      let list: Component = await driver.waitForComponent(ON.id('listChain_35'), 1000);
      
      // 向下滑动
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0350');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSEIPEDELETE_CHAIN_0350 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0110
     * @tc.name   : List_横滑删除_componentContent_edgeEffect
     * @tc.desc   : Verify listandgrid list leftswipedelete buildercomponent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0110 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listSwipeDelete11')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、动态改变edgeEffect
      let button: Component = await driver.waitForComponent(ON.id('changeEdgeEffectButton_11'), 1000);
      await button.click();
      await driver.waitForIdle(1000, 2000);

      // 横滑删除测试
      let listItem: Component = await driver.waitForComponent(ON.id('listItem_11_0'), 1000);
      // let itemRect = await listItem.getBounds();
      // let startX = itemRect.left + 20;
      // let endX = itemRect.right - 20;
      // let centerY = itemRect.top + (itemRect.bottom - itemRect.top) / 2;
      //
      // // 从左向右横滑
      // await driver.swipe(startX, centerY, endX, centerY, 500);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0110');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0110 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0120
     * @tc.name   : List_横滑删除_componentContent_动态改变actionAreaDistance
     * @tc.desc   : Verify listandgrid list leftswipedelete buildercomponent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0120 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listSwipeDelete12')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、动态改变actionAreaDistance
      let button: Component = await driver.waitForComponent(ON.id('changeActionAreaButton_12'), 1000);
      await button.click();
      await driver.waitForIdle(1000, 2000);

      // 2、横滑删除
      let listItem: Component = await driver.waitForComponent(ON.id('listItem_12_0'), 1000);
      let itemRect = await listItem.getBounds();
      let itemCenterX = itemRect.left + (itemRect.right - itemRect.left) / 2;
      let itemCenterY = itemRect.top + (itemRect.bottom - itemRect.top) / 2;
      let itemWidth = itemRect.right - itemRect.left;
      
      // 从左向右横滑
      await driver.swipe(itemCenterX - itemWidth * 0.3, itemCenterY, itemCenterX + itemWidth * 0.3, itemCenterY, 500);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0120');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0120 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0130
     * @tc.name   : List_横滑删除_onOffsetChange
     * @tc.desc   : Verify listandgrid list leftswipedelete buildercomponent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0130 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listSwipeDelete13')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、横滑滑出组件，观察回调
      let listItem: Component = await driver.waitForComponent(ON.id('listItem_13_0'), 1000);
      let itemRect = await listItem.getBounds();
      let itemCenterX = itemRect.left + (itemRect.right - itemRect.left) / 2;
      let itemCenterY = itemRect.top + (itemRect.bottom - itemRect.top) / 2;
      let itemWidth = itemRect.right - itemRect.left;
      
      // 从左向右横滑
      await driver.swipe(itemCenterX - itemWidth * 0.3, itemCenterY, itemCenterX + itemWidth * 0.3, itemCenterY, 500);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0130');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0130 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0140
     * @tc.name   : List_横滑删除_onStateChange
     * @tc.desc   : Verify listandgrid list leftswipedelete buildercomponent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0140 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listSwipeDelete14')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、横滑滑出组件，观察回调
      let listItem: Component = await driver.waitForComponent(ON.id('listItem_14_0'), 1000);
      let itemRect = await listItem.getBounds();
      let itemCenterX = itemRect.left + (itemRect.right - itemRect.left) / 2;
      let itemCenterY = itemRect.top + (itemRect.bottom - itemRect.top) / 2;
      let itemWidth = itemRect.right - itemRect.left;
      
      // 从左向右横滑
      await driver.swipe(itemCenterX - itemWidth * 0.3, itemCenterY, itemCenterX + itemWidth * 0.3, itemCenterY, 500);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0140');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0140 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0150
     * @tc.name   : List_横滑删除_onExitActionArea&onEnterActionArea
     * @tc.desc   : Verify listandgrid list leftswipedelete buildercomponent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0150 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listSwipeDelete15')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、横滑滑出组件，观察回调
      let listItem: Component = await driver.waitForComponent(ON.id('listItem_15_0'), 1000);
      let itemRect = await listItem.getBounds();
      let itemCenterX = itemRect.left + (itemRect.right - itemRect.left) / 2;
      let itemCenterY = itemRect.top + (itemRect.bottom - itemRect.top) / 2;
      let itemWidth = itemRect.right - itemRect.left;
      
      // 从左向右横滑进入删除区域
      await driver.swipe(itemCenterX - itemWidth * 0.3, itemCenterY, itemCenterX + itemWidth * 0.3, itemCenterY, 500);
      await driver.waitForIdle(1000, 2000);
      
      // 从右向左滑出删除区域
      await driver.swipe(itemCenterX + itemWidth * 0.3, itemCenterY, itemCenterX - itemWidth * 0.3, itemCenterY, 500);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0150');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0150 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0160
     * @tc.name   : List_横滑删除_list横向布局
     * @tc.desc   : Verify listandgrid list leftswipedelete buildercomponent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0160 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listSwipeDelete16')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、list横向布局
      // 2、上滑或者下滑listitem滑出组件
      let listItem: Component = await driver.waitForComponent(ON.id('listItem_16_0'), 1000);
      let itemRect = await listItem.getBounds();
      let itemCenterX = itemRect.left + (itemRect.right - itemRect.left) / 2;
      let itemCenterY = itemRect.top + (itemRect.bottom - itemRect.top) / 2;
      let itemHeight = itemRect.bottom - itemRect.top;
      
      // 从上向下滑出组件
      await driver.swipe(itemCenterX, itemCenterY - itemHeight * 0.3, itemCenterX, itemCenterY + itemHeight * 0.3, 500);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0160');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0160 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0170
     * @tc.name   : List_横滑删除_连续横滑多个item
     * @tc.desc   : Verify listandgrid list leftswipedelete buildercomponent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0170 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listSwipeDelete17')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、连续横滑3个listitem
      for (let i = 0; i < 3; i++) {
        let listItem: Component = await driver.waitForComponent(ON.id(`listItem_17_${i}`), 1000);
        let itemRect = await listItem.getBounds();
        let itemCenterX = itemRect.left + (itemRect.right - itemRect.left) / 2;
        let itemCenterY = itemRect.top + (itemRect.bottom - itemRect.top) / 2;
        let itemWidth = itemRect.right - itemRect.left;
        
        // 从左向右横滑
        await driver.swipe(itemCenterX - itemWidth * 0.3, itemCenterY, itemCenterX + itemWidth * 0.3, itemCenterY, 500);
        await driver.waitForIdle(500, 1000);
      }

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0170');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0170 finish.`);
      done();
    });
  });
}
