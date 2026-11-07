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

export default function gridScrollBarTest() {
  describe('gridScrollBarTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SCROLLBAR_0010_027_880
     * @tc.name   : 不设置onScrollBarUpdate接口设置滚动条
     * @tc.desc   : Verify listandgrid grid scrollbar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SCROLLBAR_0010_027_880', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SCROLLBAR_0010_027_880 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid_interface/gridScrollBar0010_027_880')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SCROLLBAR_0010_027_880_01');
      await Utils.sleep(1000);
      
      // 滑动Grid验证滚动条
      await driver.swipe(400, 500, 400, 300, 500);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SCROLLBAR_0010_027_880_02');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SCROLLBAR_0010_027_880 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SCROLLBAR_0020_015_730
     * @tc.name   : 设置onScrollBarUpdate接口设置滚动条
     * @tc.desc   : Verify listandgrid grid scrollbar interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SCROLLBAR_0020_015_730', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SCROLLBAR_0020_015_730 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid_interface/gridScrollBar0020_015_730')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SCROLLBAR_0020_015_730_01');
      await Utils.sleep(1000);
      
      // 滑动Grid验证滚动条
      await driver.swipe(400, 500, 400, 300, 500);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SCROLLBAR_0020_015_730_02');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_SCROLLBAR_0020_015_730 finish.`);
      done()
    })
  })
}
