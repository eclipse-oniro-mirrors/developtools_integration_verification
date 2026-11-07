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

import { describe, afterEach, it, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit'

export default function gridSettingLayoutTest() {
  describe('gridSettingLayoutTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err: BusinessError) => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0050
     * @tc.name   : Grid设置自定义布局信息，组件选中态样式测试
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0050 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid_interface/gridSettingLayout0050')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0050_01');
      await Utils.sleep(1000);
      
      // 长按选中GridItem
      let gridItem = await driver.waitForComponent(ON.id('gridItem0050_0'), 2000);
      if (gridItem) {
        await gridItem.longClick();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0050_02');
        await Utils.sleep(1000);
      }
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0060
     * @tc.name   : Grid设置自定义布局信息，组件按压态样式测试
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0060 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid_interface/gridSettingLayout0060')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0060_01');
      await Utils.sleep(1000);
      
      // 手指按压GridItem（通过长按模拟按压）
      let gridItem = await driver.waitForComponent(ON.id('gridItem0060_0'), 2000);
      if (gridItem) {
        await gridItem.longClick();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0060_02');
        await Utils.sleep(1000);
      }
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0070
     * @tc.name   : Grid设置自定义布局信息，组件走焦态样式测试
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0070 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid_interface/gridSettingLayout0070')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0070_01');
      await Utils.sleep(1000);
      
      // TAB键走焦（通过点击GridItem模拟走焦）
      let gridItem = await driver.waitForComponent(ON.id('gridItem0070_0'), 2000);
      if (gridItem) {
        await gridItem.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0070_02');
        await Utils.sleep(1000);
      }
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0080
     * @tc.name   : Grid设置自定义布局信息，组件点击态样式测试
     * @tc.desc   : Verify listandgrid grid settinglayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0080 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid_interface/gridSettingLayout0080')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0080_01');
      await Utils.sleep(1000);
      
      // 点击GridItem
      let gridItem = await driver.waitForComponent(ON.id('gridItem0080_0'), 2000);
      if (gridItem) {
        await gridItem.click();
        await driver.waitForIdle(500, 2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0080_02');
        await Utils.sleep(1000);
      }
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SETTINGLAYOUT_0080 finish.`);
      done()
    })
  })
}
