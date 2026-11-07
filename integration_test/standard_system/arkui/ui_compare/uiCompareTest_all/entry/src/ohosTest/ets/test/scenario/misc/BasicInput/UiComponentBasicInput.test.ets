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

export default function uiComponentBasicInput() {
  describe('uiComponentBasicInput', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : Ace_JSDeclarativeParadigm_Component_Basic_Input_010
     * @tc.name   : 长文本框光标颜色测试
     * @tc.desc   : Verify ace jsdeclarativeparadigm component basic input interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('Ace_JSDeclarativeParadigm_Component_Basic_Input_010', 0, async () => {
      Logger.info('Ace_JSDeclarativeParadigm_Component_Basic_Input_010 begin');
      await Settings.createWindow('testability/pages/scenario/misc/BasicInput/BasicInput010');
      const driver = Driver.create();
      await driver.delayMs(1000);

      await windowSnap.snapShot('BasicInput010_default');

      // 切换光标颜色
      const blueBtn = await driver.findComponent(ON.id('blueBtn'));
      if (blueBtn) {
        await blueBtn.click();
        await driver.delayMs(500);
        await windowSnap.snapShot('BasicInput010_blue');
      }

      Logger.info('Ace_JSDeclarativeParadigm_Component_Basic_Input_010 end');
    });

    /*
     * @tc.number : Ace_JSDeclarativeParadigm_Component_Basic_Input_011
     * @tc.name   : 长文本框删除字符测试
     * @tc.desc   : Verify ace jsdeclarativeparadigm component basic input interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('Ace_JSDeclarativeParadigm_Component_Basic_Input_011', 0, async () => {
      Logger.info('Ace_JSDeclarativeParadigm_Component_Basic_Input_011 begin');
      await Settings.createWindow('testability/pages/scenario/misc/BasicInput/BasicInput011');
      const driver = Driver.create();
      await driver.delayMs(1000);

      await windowSnap.snapShot('BasicInput011_before');

      // 点击清空按钮
      const clearBtn = await driver.findComponent(ON.id('clearBtn'));
      if (clearBtn) {
        await clearBtn.click();
        await driver.delayMs(500);
        await windowSnap.snapShot('BasicInput011_cleared');
      }

      Logger.info('Ace_JSDeclarativeParadigm_Component_Basic_Input_011 end');
    });
  });
}
