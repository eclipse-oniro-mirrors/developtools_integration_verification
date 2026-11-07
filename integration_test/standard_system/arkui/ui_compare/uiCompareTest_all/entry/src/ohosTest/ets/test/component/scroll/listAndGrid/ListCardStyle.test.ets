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

export default function listCardStyleTest() {
  describe('listCardStyleTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERACTION_0010
     * @tc.name   : ListItem and ListItemGroup CARD style with isEnabled=false test
     * @tc.desc   : Verify listandgrid list interaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERACTION_0010', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listCardStyle0010');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0010: 开始查找List组件 (list_0010)');
        let listComponent: Component = await driver.waitForComponent(ON.id('list_0010'), 1000);
        console.info('TEST_0010: 成功找到List组件');

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERACTION_0010');
        await Utils.sleep(1000);

        console.info('TEST_0010: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0010: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0010: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERACTION_0020
     * @tc.name   : ListItem and ListItemGroup CARD style mouse hover effect test
     * @tc.desc   : Verify listandgrid list interaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERACTION_0020', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listCardStyle0020');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0020: 开始查找List组件 (list_0020)');
        let listComponent: Component = await driver.waitForComponent(ON.id('list_0020'), 1000);
        console.info('TEST_0020: 成功找到List组件');

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERACTION_0020');
        await Utils.sleep(1000);

        console.info('TEST_0020: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0020: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0020: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERACTION_0030
     * @tc.name   : ListItem and ListItemGroup CARD style display effect test
     * @tc.desc   : Verify listandgrid list interaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERACTION_0030', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listCardStyle0030');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0030: 开始查找List组件 (list_0030)');
        let listComponent: Component = await driver.waitForComponent(ON.id('list_0030'), 1000);
        console.info('TEST_0030: 成功找到List组件');

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERACTION_0030');
        await Utils.sleep(1000);

        console.info('TEST_0030: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0030: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0030: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERACTION_0040
     * @tc.name   : ListItem and ListItemGroup CARD style press effect test
     * @tc.desc   : Verify listandgrid list interaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERACTION_0040', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listCardStyle0040');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0040: 开始查找List组件 (list_0040)');
        let listComponent: Component = await driver.waitForComponent(ON.id('list_0040'), 1000);
        console.info('TEST_0040: 成功找到List组件');

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERACTION_0040');
        await Utils.sleep(1000);

        console.info('TEST_0040: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0040: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0040: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0760
     * @tc.name   : ListItem and ListItemGroup CARD style with selectable=true test
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0760', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listCardStyle0760');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0760: 开始查找List组件 (list_0760)');
        let listComponent: Component = await driver.waitForComponent(ON.id('list_0760'), 1000);
        console.info('TEST_0760: 成功找到List组件');

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0760');
        await Utils.sleep(1000);

        console.info('TEST_0760: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0760: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0760: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0770
     * @tc.name   : ListItem and ListItemGroup CARD style default card style effect test
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0770', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listCardStyle0770');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0770: 开始查找List组件 (list_0770)');
        let listComponent: Component = await driver.waitForComponent(ON.id('list_0770'), 1000);
        console.info('TEST_0770: 成功找到List组件');

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0770');
        await Utils.sleep(1000);

        console.info('TEST_0770: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0770: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0770: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0900
     * @tc.name   : ListItem and ListItemGroup CARD style with isEnabled=true test
     * @tc.desc   : Verify listandgrid list interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0900', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listCardStyle0900');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0900: 开始查找List组件 (list_0900)');
        let listComponent: Component = await driver.waitForComponent(ON.id('list_0900'), 1000);
        console.info('TEST_0900: 成功找到List组件');

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_0900');
        await Utils.sleep(1000);

        console.info('TEST_0900: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0900: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0900: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_UI_0570
     * @tc.name   : ListItem and ListItemGroup CARD style Tab key focus effect test
     * @tc.desc   : Verify listandgrid list ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_UI_0570', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listCardStyle0570');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0570: 开始查找List组件 (list_0570)');
        let listComponent: Component = await driver.waitForComponent(ON.id('list_0570'), 1000);
        console.info('TEST_0570: 成功找到List组件');

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_UI_0570');
        await Utils.sleep(1000);

        console.info('TEST_0570: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0570: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0570: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_UI_0590
     * @tc.name   : ListItem and ListItemGroup CARD style mouse hover visual effect test
     * @tc.desc   : Verify listandgrid list ui interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_UI_0590', Level.LEVEL3, async (done: Function) => {
      let driver: Driver = Driver.create();
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listCardStyle0590');
      await driver.waitForIdle(500, 2000);

      try {
        console.info('TEST_0590: 开始查找List组件 (list_0590)');
        let listComponent: Component = await driver.waitForComponent(ON.id('list_0590'), 1000);
        console.info('TEST_0590: 成功找到List组件');

        await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_UI_0590');
        await Utils.sleep(1000);

        console.info('TEST_0590: 测试用例执行成功');
        done();
      } catch (error) {
        console.error('TEST_0590: 测试用例执行失败 - ' + JSON.stringify(error));
        console.error('TEST_0590: 错误堆栈: ' + error.message);
        expect().assertFail();
      }
    });
  })
}