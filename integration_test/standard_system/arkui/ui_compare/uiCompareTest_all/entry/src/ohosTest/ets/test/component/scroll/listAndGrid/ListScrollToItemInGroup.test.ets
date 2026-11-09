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

export default function listScrollToItemInGroupTest() {
  describe('listScrollToItemInGroupTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0020
     * @tc.name   : List#scroll#scroll_9
     * @tc.desc   : Verify listandgrid listitemgroup scrolltoindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0020 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listScrollToItemInGroup02');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 点击按钮跳转到对应item
      let scrollButton: Component = await driver.waitForComponent(ON.id('scrollToItemInGroupButton_02'), 1000);
      await scrollButton.click();
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0020');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0020 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0110
     * @tc.name   : 单列List纵向排列，设置ScrollAlign.AUTO，跳转到指定索引测试
     * @tc.desc   : Verify listandgrid listitemgroup scrolltoindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0110 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listScrollToItemInGroup11');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 点击按钮跳转到对应item
      let scrollButton: Component = await driver.waitForComponent(ON.id('scrollToItemInGroupButton_11'), 1000);
      await scrollButton.click();
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0110');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0110 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0120
     * @tc.name   : List#scroll#scroll_7
     * @tc.desc   : Verify listandgrid listitemgroup scrolltoindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0120 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listScrollToItemInGroup12');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 点击按钮跳转到对应item
      let scrollButton: Component = await driver.waitForComponent(ON.id('scrollToItemInGroupButton_12'), 1000);
      await scrollButton.click();
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0120');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0120 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0130
     * @tc.name   : List#scroll#scroll_6
     * @tc.desc   : Verify listandgrid listitemgroup scrolltoindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0130 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listScrollToItemInGroup13');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 点击按钮跳转到对应item
      let scrollButton: Component = await driver.waitForComponent(ON.id('scrollToItemInGroupButton_13'), 1000);
      await scrollButton.click();
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0130');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0130 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0170
     * @tc.name   : 单列List纵向排列，List内布局ListItem和ListItemGroup，跳转到指定索引测试
     * @tc.desc   : Verify listandgrid listitemgroup scrolltoindex interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0170 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listScrollToItemInGroup17');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 点击按钮，应该无法跳转（前3个是ListItem）
      let scrollButton: Component = await driver.waitForComponent(ON.id('scrollToItemInGroupButton_17'), 1000);
      await scrollButton.click();
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0170');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0170 finish.`);
      done();
    });
  });
}
