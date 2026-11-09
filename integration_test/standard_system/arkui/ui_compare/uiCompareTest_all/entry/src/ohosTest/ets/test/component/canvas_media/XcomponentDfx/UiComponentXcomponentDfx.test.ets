/*
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

import { describe, it, afterEach } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';

export default function uiComponentXcomponentDfx() {
  describe('uiComponentXcomponentDfx', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_XCOMPONENT_DFX_0050
     * @tc.name   : XcomponentDfx0050
     * @tc.desc   : Verify special components xcomponent DFX interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_XCOMPONENT_DFX_0050', 0, async () => {
      Logger.info('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_XCOMPONENT_DFX_0050 begin');
      
      await Settings.createWindow('testability/pages/component/canvas_media/XcomponentDfx/XcomponentDfx0050');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 抓取Log
      const logBtn = await driver.findComponent(ON.id('logBtn'));
      if (logBtn) {
        await logBtn.click();
        await driver.delayMs(300);
      }
      
      // 抓取Trace
      const traceBtn = await driver.findComponent(ON.id('traceBtn'));
      if (traceBtn) {
        await traceBtn.click();
        await driver.delayMs(300);
      }
      
      // 抓取Dump
      const dumpBtn = await driver.findComponent(ON.id('dumpBtn'));
      if (dumpBtn) {
        await dumpBtn.click();
        await driver.delayMs(300);
      }
      
      await windowSnap.snapShot('XCOMPONENT_DFX_0050');
      
      Logger.info('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_XCOMPONENT_DFX_0050 end');
    });
  });
}
