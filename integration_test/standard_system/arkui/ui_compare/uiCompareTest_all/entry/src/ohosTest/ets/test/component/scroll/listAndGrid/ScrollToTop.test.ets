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

export default function scrollToTopTest() {
  describe('scrollToTopTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0160
     * @tc.name   : List启用链式联动动效，划动List
     * @tc.desc   : Verify scrolltotop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0160 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/scrollToTop16')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.打开hap
      // 2.设置滚动组件联动动效为启用，划动组件
      // 3.查看设备效果
      let list: Component = await driver.waitForComponent(ON.id('scrollToTopList_16'), 1000);
      
      // 划动组件
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      
      await list.scrollToTop(2000);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0160');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0160 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0170
     * @tc.name   : List不启用链式联动动效，滑动List
     * @tc.desc   : Verify scrolltotop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0170 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/scrollToTop17')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.打开hap
      // 2.设置滚动组件联动动效为不启用，划动组件
      // 3.查看设备效果
      let list: Component = await driver.waitForComponent(ON.id('scrollToTopList_17'), 1000);
      
      // 滑动组件
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      
      await list.scrollToTop(2000);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0170');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0170 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0180
     * @tc.name   : List组件横向分布，划动后点击顶部状态栏
     * @tc.desc   : Verify scrolltotop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0180 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/scrollToTop18')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.打开hap
      // 2.设置滚动组件BackToTop为true，点击顶部状态栏
      // 3.查看设备效果
      let list: Component = await driver.waitForComponent(ON.id('scrollToTopList_18'), 1000);
      
      // 划动后点击顶部状态栏
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      
      // 点击顶部状态栏触发回滚
      // 通过点击屏幕顶部区域来模拟点击状态栏
      await driver.click(500, 50);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0180');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0180 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0330
     * @tc.name   : Grid不规则布局，划动后点击顶部状态栏
     * @tc.desc   : Verify scrolltotop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0330 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/scrollToTop33')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.打开hap
      // 2.设置滚动组件BackToTop为true，点击状态栏
      // 3.查看设备效果
      let grid: Component = await driver.waitForComponent(ON.id('scrollToTopGrid_33'), 1000);
      
      // 划动后点击顶部状态栏
      await grid.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      
      // 点击顶部状态栏触发回滚
      await driver.click(500, 50);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0330');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0330 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0340
     * @tc.name   : Grid嵌套不同滚动组件，划动后点击顶部状态栏
     * @tc.desc   : Verify scrolltotop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0340 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/scrollToTop34')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.打开hap
      // 2.设置滚动组件BackToTop为true，点击状态栏
      // 3.查看设备效果
      let grid: Component = await driver.waitForComponent(ON.id('scrollToTopGrid_34'), 1000);
      
      // 划动后点击顶部状态栏
      await grid.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      
      // 点击顶部状态栏触发回滚
      await driver.click(500, 50);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0340');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0340 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0650
     * @tc.name   : 滚动组件和scrollToIndex组合测试
     * @tc.desc   : Verify scrolltotop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0650', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0650 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/scrollToTop65')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.打开hap
      // 2.设置滚动组件BackToTop，按钮里点击实现this.listScroller.scrollToIndex(5, false, ScrollAlign.START)
      // 3.查看设备效果
      // 点击按钮触发scrollToIndex
      let scrollButton: Component = await driver.waitForComponent(ON.id('scrollToIndexBtn_65'), 1000);
      await scrollButton.click();
      await driver.waitForIdle(1000, 2000);
      
      // 点击顶部状态栏触发回滚
      await driver.click(500, 50);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0650');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0650 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0660
     * @tc.name   : 滚动组件数据为200时
     * @tc.desc   : Verify scrolltotop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0660', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0660 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/scrollToTop66')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1.打开hap
      // 2.设置滚动组件BackToTop，List设置内容区域起始偏移量 contentStartOffset为50
      // 3.查看设备效果
      let list: Component = await driver.waitForComponent(ON.id('scrollToTopList_66'), 1000);
      
      // 滚动触发正常
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);
      
      await list.scrollToTop(2000);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0660');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0660 finish.`);
      done();
    });
  })
}
