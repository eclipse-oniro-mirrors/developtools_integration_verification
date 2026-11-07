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

export default function listCachedCountTest() {
  describe('listCachedCountTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_CACHEDCOUNT_0030
     * @tc.name   : List和ListItemGroup都使用repeat懒加载cachedcount测试
     * @tc.desc   : Verify listandgrid list interface cachedcount interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_CACHEDCOUNT_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_CACHEDCOUNT_0030 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listCachedCount03')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、设置cachedcount数为A
      // 2、滑动list使cachedcount数小于未显示item数
      let list: Component = await driver.waitForComponent(ON.id('listCachedCount_03'), 1000);
      
      // 向下滑动到底部
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_CACHEDCOUNT_0030');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_CACHEDCOUNT_0030 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_CACHEDCOUNT_0040
     * @tc.name   : List使用repeat懒加载cachedcount测试
     * @tc.desc   : Verify listandgrid list interface cachedcount interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_CACHEDCOUNT_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_CACHEDCOUNT_0040 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listCachedCount04')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、设置cachedcount数为A
      // 2、滑动list使cachedcount数小于未显示item数
      let list: Component = await driver.waitForComponent(ON.id('listCachedCount_04'), 1000);
      
      // 向下滑动到底部
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_CACHEDCOUNT_0040');
      await Utils.sleep(1000)
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_CACHEDCOUNT_SHOW_0040
     * @tc.name   : list_CacheCount_show_ForEach
     * @tc.desc   : Verify listandgrid list interface cachedcount show interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_CACHEDCOUNT_SHOW_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_CACHEDCOUNT_SHOW_0040 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listCachedCountShow04')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、设置clip属性为false，cachedCount(1, true)
      // 2、List + ForEach + ListItem
      // 3、List + ForEach + ListItemGroup + ForEach + ListItem
      // 滑动页面，正确显示预加载的listitem
      let list: Component = await driver.waitForComponent(ON.id('listCachedCountShow_04'), 1000);
      
      // 向下滑动到底部
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_CACHEDCOUNT_SHOW_0040');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_CACHEDCOUNT_SHOW_0040 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_CACHEDCOUNT_SHOW_0050
     * @tc.name   : list_CacheCount_show_LazyForEach
     * @tc.desc   : Verify listandgrid list interface cachedcount show interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_CACHEDCOUNT_SHOW_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_CACHEDCOUNT_SHOW_0050 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listCachedCountShow05')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、设置clip属性为false，cachedCount(1, true)
      // 2、List + LazyForEach + ListItem
      // 3、List + LazyForEach + ListItemGroup + LazyForEach + ListItem
      // 滑动页面，正确显示预加载的listitem
      let list: Component = await driver.waitForComponent(ON.id('listCachedCountShow_05'), 1000);
      
      // 向下滑动到底部
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_CACHEDCOUNT_SHOW_0050');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_CACHEDCOUNT_SHOW_0050 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_CACHEDCOUNT_SHOW_0060
     * @tc.name   : list_CacheCount_show_repeat
     * @tc.desc   : Verify listandgrid list interface cachedcount show interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_CACHEDCOUNT_SHOW_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_CACHEDCOUNT_SHOW_0060 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listCachedCountShow06')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 1、设置clip属性为false，cachedCount(1, true)
      // 2、List + Repeat + ListItem
      // 3、List + repeat + ListItemGroup + repeat + ListItem
      // 滑动页面，正确显示预加载的listitem
      let list: Component = await driver.waitForComponent(ON.id('listCachedCountShow_06'), 1000);
      
      // 向下滑动到底部
      await list.scrollToBottom(2000);
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_CACHEDCOUNT_SHOW_0060');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_CACHEDCOUNT_SHOW_0060 finish.`);
      done();
    });
  });
}
