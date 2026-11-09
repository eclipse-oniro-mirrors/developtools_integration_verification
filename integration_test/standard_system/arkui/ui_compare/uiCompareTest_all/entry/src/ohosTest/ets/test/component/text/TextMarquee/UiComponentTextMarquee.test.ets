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

import { describe, it, afterEach } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';

export default function uiComponentTextMarquee() {
  describe('uiComponentTextMarquee', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0350
     * @tc.name   : 跑马灯循环未结束，重新触发start
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0350', 0, async () => {
      Logger.info('SUB_ACE_UI_COMPONENT_TEXT_TV_0350 begin');
      await Settings.createWindow('testability/pages/component/text/TextMarquee/TextMarquee0350');
      const driver = Driver.create();
      await driver.delayMs(2000);

      // 截图 - 跑马灯运行中
      await windowSnap.snapShot('TextMarquee0350_running');

      // 修改速度触发重新start
      const speedBtn = await driver.findComponent(ON.id('speedBtn'));
      if (speedBtn) {
        await speedBtn.click();
        await driver.delayMs(1000);
        await windowSnap.snapShot('TextMarquee0350_restarted');
      }

      Logger.info('SUB_ACE_UI_COMPONENT_TEXT_TV_0350 end');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0800
     * @tc.name   : 多个跑马灯同时执行
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0800', 0, async () => {
      Logger.info('SUB_ACE_UI_COMPONENT_TEXT_TV_0800 begin');
      await Settings.createWindow('testability/pages/component/text/TextMarquee/TextMarquee0800');
      const driver = Driver.create();
      await driver.delayMs(3000);

      // 截图 - 多跑马灯运行
      await windowSnap.snapShot('TextMarquee0800');

      Logger.info('SUB_ACE_UI_COMPONENT_TEXT_TV_0800 end');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0810
     * @tc.name   : 跑马灯循环多次，回调次数无丢失
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0810', 0, async () => {
      Logger.info('SUB_ACE_UI_COMPONENT_TEXT_TV_0810 begin');
      await Settings.createWindow('testability/pages/component/text/TextMarquee/TextMarquee0810');
      const driver = Driver.create();
      await driver.delayMs(2000);

      // 截图 - 回调统计
      await windowSnap.snapShot('TextMarquee0810');

      Logger.info('SUB_ACE_UI_COMPONENT_TEXT_TV_0810 end');
    });
  });
}
