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

export default function listScrollIndexTest() {
  describe('listScrollIndexTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_0010
     * @tc.name   : 横向时滑动列表将会返回显示界面中第一个ListItem和最后一个ListItem的索引号
     * @tc.desc   : Verify list interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_0010 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listScrollIndex01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、启动应用 - 已完成
      // 2、上下滑动列表
      let list: Component = await driver.waitForComponent(ON.id('scrollIndexList_01'), 1000);
      let rect = await list.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.8;
      let endY = rect.top + height * 0.2;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(1000, 2000);

      // 3、滑动到底部（顶部）以后继续向下（上）滑动
      // 滑动到底部
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(1000, 2000);
      // 继续向下滑动（已到底部）
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(1000, 2000);

      // 向上滑动到顶部
      await driver.swipe(centerX, endY, centerX, startY, 1000);
      await driver.waitForIdle(1000, 2000);
      // 继续向上滑动（已到顶部）
      await driver.swipe(centerX, endY, centerX, startY, 1000);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_0010')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_0020
     * @tc.name   : 纵向时滑动列表将会返回显示界面中第一个ListItem和最后一个ListItem的索引号
     * @tc.desc   : Verify list interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_0020 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listScrollIndex02')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、启动应用 - 已完成
      // 2、左右滑动列表
      let list: Component = await driver.waitForComponent(ON.id('scrollIndexList_02'), 1000);
      let rect = await list.getBounds();
      let width = rect.right - rect.left;
      let centerY = rect.top + (rect.bottom - rect.top) / 2;
      let startX = rect.left + width * 0.8;
      let endX = rect.left + width * 0.2;
      await driver.swipe(startX, centerY, endX, centerY, 1000);
      await driver.waitForIdle(1000, 2000);

      // 3、滑动到底部（顶部）以后继续向右（左）滑动
      // 滑动到最右
      await driver.swipe(startX, centerY, endX, centerY, 1000);
      await driver.waitForIdle(1000, 2000);
      // 继续向右滑动（已到最右）
      await driver.swipe(startX, centerY, endX, centerY, 1000);
      await driver.waitForIdle(1000, 2000);

      // 向左滑动到最左
      await driver.swipe(endX, centerY, startX, centerY, 1000);
      await driver.waitForIdle(1000, 2000);
      // 继续向左滑动（已到最左）
      await driver.swipe(endX, centerY, startX, centerY, 1000);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_0020')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_0050
     * @tc.name   : 横向滑动列表将会返回显示界面中第一个GroupListItem和最后一个GroupListItem的索引号
     * @tc.desc   : Verify list interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_0050 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listScrollIndex03')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、启动应用 - 已完成
      // 2、上下滑动列表
      let list: Component = await driver.waitForComponent(ON.id('scrollIndexList_03'), 1000);
      let rect = await list.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let height = rect.bottom - rect.top;
      let startY = rect.top + height * 0.8;
      let endY = rect.top + height * 0.2;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(1000, 2000);

      // 3、滑动到底部（顶部）以后继续向下（上）滑动
      // 滑动到底部
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(1000, 2000);
      // 继续向下滑动（已到底部）
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(1000, 2000);

      // 向上滑动到顶部
      await driver.swipe(centerX, endY, centerX, startY, 1000);
      await driver.waitForIdle(1000, 2000);
      // 继续向上滑动（已到顶部）
      await driver.swipe(centerX, endY, centerX, startY, 1000);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_0050')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_0170
     * @tc.name   : 滑动到指定位置显示索引号正确
     * @tc.desc   : Verify list interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_0170 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listScrollIndex04')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、启动应用 - 已完成
      // 2、滑动到指定位置
      let scrollToButton: Component = await driver.waitForComponent(ON.id('scrollToButton_04'), 1000);
      await scrollToButton.click();
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_0170')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_0180
     * @tc.name   : 滑动到指定距离显示索引号正确
     * @tc.desc   : Verify list interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_0180 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listScrollIndex05')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、启动应用 - 已完成
      // 2、滑动到指定距离
      let scrollByButton: Component = await driver.waitForComponent(ON.id('scrollByButton_05'), 1000);
      await scrollByButton.click();
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_0180')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_0190
     * @tc.name   : 滑动到指定索引显示索引号正确
     * @tc.desc   : Verify list interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_0190 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listScrollIndex06')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、启动应用 - 已完成
      // 2、滑动到指定索引
      let scrollToIndexButton: Component = await driver.waitForComponent(ON.id('scrollToIndexButton_06'), 1000);
      await scrollToIndexButton.click();
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_0190')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_0200
     * @tc.name   : 跳转滑动显示索引号正确
     * @tc.desc   : Verify list interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_0200 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listScrollIndex07')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、启动应用 - 已完成
      // 2、跳转滑动
      let jumpButton: Component = await driver.waitForComponent(ON.id('jumpButton_07'), 1000);
      await jumpButton.click();
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_0200')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_0210
     * @tc.name   : 翻页滑动显示索引号正确
     * @tc.desc   : Verify list interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_0210 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listScrollIndex08')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、启动应用 - 已完成
      // 2、翻页滑动
      let scrollPageButton: Component = await driver.waitForComponent(ON.id('scrollPageButton_08'), 1000);
      await scrollPageButton.click();
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_0210')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0010
     * @tc.name   : list_getItemIndex_listitem_切换行列数
     * @tc.desc   : Verify list scroller getitemindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0010 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listScrollIndex09')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、切换行列数
      let switchButton: Component = await driver.waitForComponent(ON.id('switchColumnsButton_09'), 1000);
      await switchButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、分别触摸、点击、拖动listitem
      let list: Component = await driver.waitForComponent(ON.id('scrollIndexList_09'), 1000);
      let rect = await list.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let centerY = rect.top + (rect.bottom - rect.top) / 2;

      // 触摸
      await driver.click(centerX, centerY);
      await driver.waitForIdle(500, 2000);

      // 点击
      let listItem: Component = await driver.waitForComponent(ON.id('listItem_09_5'), 1000);
      await listItem.click();
      await driver.waitForIdle(500, 2000);

      // 拖动
      let startY = rect.top + (rect.bottom - rect.top) * 0.5;
      let endY = rect.top + (rect.bottom - rect.top) * 0.3;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0010')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0020
     * @tc.name   : list_getVisibleListContentInfo_listitemgroup+listitem_切换行列数
     * @tc.desc   : Verify list scroller getitemindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0020 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listScrollIndex10')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、切换行列数
      let switchButton: Component = await driver.waitForComponent(ON.id('switchColumnsButton_10'), 1000);
      await switchButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、分别触摸、点击、拖动listitem
      let list: Component = await driver.waitForComponent(ON.id('scrollIndexList_10'), 1000);
      let rect = await list.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let centerY = rect.top + (rect.bottom - rect.top) / 2;

      // 触摸
      await driver.click(centerX, centerY);
      await driver.waitForIdle(500, 2000);

      // 点击
      let listItem: Component = await driver.waitForComponent(ON.id('listItem_10_1_2'), 1000);
      await listItem.click();
      await driver.waitForIdle(500, 2000);

      // 拖动
      let startY = rect.top + (rect.bottom - rect.top) * 0.5;
      let endY = rect.top + (rect.bottom - rect.top) * 0.3;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0020')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0030
     * @tc.name   : list_getItemIndex+getVisibleListContentInfo_listitemgroup与listitem间隔布局_切换行列数
     * @tc.desc   : Verify list scroller getitemindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0030 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listScrollIndex11')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、切换行列数
      let switchButton: Component = await driver.waitForComponent(ON.id('switchColumnsButton_11'), 1000);
      await switchButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、分别触摸、点击、拖动listitem
      let list: Component = await driver.waitForComponent(ON.id('scrollIndexList_11'), 1000);
      let rect = await list.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let centerY = rect.top + (rect.bottom - rect.top) / 2;

      // 触摸
      await driver.click(centerX, centerY);
      await driver.waitForIdle(500, 2000);

      // 点击
      let listItem: Component = await driver.waitForComponent(ON.id('listItem_11_1_2'), 1000);
      await listItem.click();
      await driver.waitForIdle(500, 2000);

      // 拖动
      let startY = rect.top + (rect.bottom - rect.top) * 0.5;
      let endY = rect.top + (rect.bottom - rect.top) * 0.3;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0030')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0040
     * @tc.name   : list_getVisibleListContentInfo_listitemgroup+listitem_增删item
     * @tc.desc   : Verify list scroller getitemindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0040 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listScrollIndex12')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、删除item
      let deleteButton: Component = await driver.waitForComponent(ON.id('deleteItemButton_12'), 1000);
      await deleteButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、分别触摸、点击、拖动listitem
      let list: Component = await driver.waitForComponent(ON.id('scrollIndexList_12'), 1000);
      let rect = await list.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let centerY = rect.top + (rect.bottom - rect.top) / 2;

      // 触摸
      await driver.click(centerX, centerY);
      await driver.waitForIdle(500, 2000);

      // 点击
      let listItem: Component = await driver.waitForComponent(ON.id('listItem_12_1_2'), 1000);
      await listItem.click();
      await driver.waitForIdle(500, 2000);

      // 拖动
      let startY = rect.top + (rect.bottom - rect.top) * 0.5;
      let endY = rect.top + (rect.bottom - rect.top) * 0.3;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0040')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0050
     * @tc.name   : list_getItemIndex_listitem_childrenmainsize
     * @tc.desc   : Verify list scroller getitemindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0050 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listScrollIndex13')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、分别触摸、点击、拖动listitem
      let list: Component = await driver.waitForComponent(ON.id('scrollIndexList_13'), 1000);
      let rect = await list.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let centerY = rect.top + (rect.bottom - rect.top) / 2;

      // 触摸
      await driver.click(centerX, centerY);
      await driver.waitForIdle(500, 2000);

      // 点击
      let listItem: Component = await driver.waitForComponent(ON.id('listItem_13_2'), 1000);
      await listItem.click();
      await driver.waitForIdle(500, 2000);

      // 拖动
      let startY = rect.top + (rect.bottom - rect.top) * 0.5;
      let endY = rect.top + (rect.bottom - rect.top) * 0.3;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0050')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0060
     * @tc.name   : list_getItemIndex_listitem_动态改变布局方向
     * @tc.desc   : Verify list scroller getitemindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0060 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listScrollIndex14')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、动态改变布局方向
      let switchButton: Component = await driver.waitForComponent(ON.id('switchDirectionButton_14'), 1000);
      await switchButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、分别触摸、点击、拖动listitem
      let list: Component = await driver.waitForComponent(ON.id('scrollIndexList_14'), 1000);
      let rect = await list.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let centerY = rect.top + (rect.bottom - rect.top) / 2;

      // 触摸
      await driver.click(centerX, centerY);
      await driver.waitForIdle(500, 2000);

      // 点击
      let listItem: Component = await driver.waitForComponent(ON.id('listItem_14_2'), 1000);
      await listItem.click();
      await driver.waitForIdle(500, 2000);

      // 拖动
      let startY = rect.top + (rect.bottom - rect.top) * 0.5;
      let endY = rect.top + (rect.bottom - rect.top) * 0.3;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0060')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0070
     * @tc.name   : list_getItemIndex_listitem_动态改变item大小
     * @tc.desc   : Verify list scroller getitemindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0070 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listScrollIndex15')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、动态改变item大小
      let switchButton: Component = await driver.waitForComponent(ON.id('switchSizeButton_15'), 1000);
      await switchButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、分别触摸、点击、拖动listitem
      let list: Component = await driver.waitForComponent(ON.id('scrollIndexList_15'), 1000);
      let rect = await list.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let centerY = rect.top + (rect.bottom - rect.top) / 2;

      // 触摸
      await driver.click(centerX, centerY);
      await driver.waitForIdle(500, 2000);

      // 点击
      let listItem: Component = await driver.waitForComponent(ON.id('listItem_15_2'), 1000);
      await listItem.click();
      await driver.waitForIdle(500, 2000);

      // 拖动
      let startY = rect.top + (rect.bottom - rect.top) * 0.5;
      let endY = rect.top + (rect.bottom - rect.top) * 0.3;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0070')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0080
     * @tc.name   : list_getItemIndex_listitem_动态改变padding/margin
     * @tc.desc   : Verify list scroller getitemindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0080 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listScrollIndex16')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、动态改变padding/margin
      let switchButton: Component = await driver.waitForComponent(ON.id('switchPaddingMarginButton_16'), 1000);
      await switchButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、分别触摸、点击、拖动listitem
      let list: Component = await driver.waitForComponent(ON.id('scrollIndexList_16'), 1000);
      let rect = await list.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let centerY = rect.top + (rect.bottom - rect.top) / 2;

      // 触摸
      await driver.click(centerX, centerY);
      await driver.waitForIdle(500, 2000);

      // 点击
      let listItem: Component = await driver.waitForComponent(ON.id('listItem_16_2'), 1000);
      await listItem.click();
      await driver.waitForIdle(500, 2000);

      // 拖动
      let startY = rect.top + (rect.bottom - rect.top) * 0.5;
      let endY = rect.top + (rect.bottom - rect.top) * 0.3;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0080')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0090
     * @tc.name   : list_getItemIndex_listitem_动态改变item的显隐性
     * @tc.desc   : Verify list scroller getitemindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0090 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listScrollIndex17')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、动态改变item的显隐性
      let switchButton: Component = await driver.waitForComponent(ON.id('switchVisibilityButton_17'), 1000);
      await switchButton.click();
      await driver.waitForIdle(1000, 2000);

      // 2、分别触摸、点击、拖动listitem
      let list: Component = await driver.waitForComponent(ON.id('scrollIndexList_17'), 1000);
      let rect = await list.getBounds();
      let centerX = rect.left + (rect.right - rect.left) / 2;
      let centerY = rect.top + (rect.bottom - rect.top) / 2;

      // 触摸
      await driver.click(centerX, centerY);
      await driver.waitForIdle(500, 2000);

      // 点击
      let listItem: Component = await driver.waitForComponent(ON.id('listItem_17_4'), 1000);
      await listItem.click();
      await driver.waitForIdle(500, 2000);

      // 拖动
      let startY = rect.top + (rect.bottom - rect.top) * 0.5;
      let endY = rect.top + (rect.bottom - rect.top) * 0.3;
      await driver.swipe(centerX, startY, centerX, endY, 1000);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0090')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0090 finish.`);
      done()
    })
  })
}
