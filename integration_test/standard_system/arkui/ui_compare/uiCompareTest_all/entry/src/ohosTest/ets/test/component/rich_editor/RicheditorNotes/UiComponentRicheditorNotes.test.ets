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

export default function uiComponentRicheditorNotes() {
  describe('uiComponentRicheditorNotes', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_NOTES_0007_772_579
     * @tc.name   : 备忘录url链接复制粘贴
     * @tc.desc   : Verify text richeditor notes interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_NOTES_0007_772_579', 0, async () => {
      Logger.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_NOTES_0007_772_579 begin');
      await Settings.createWindow('testability/pages/component/rich_editor/RicheditorNotes/RicheditorNotes0579');
      const driver = Driver.create();
      await driver.delayMs(1000);

      // 截图 - 初始状态
      await windowSnap.snapShot('RicheditorNotes0579');

      // 添加URL
      const addUrlBtn = await driver.findComponent(ON.id('addUrlBtn'));
      if (addUrlBtn) {
        await addUrlBtn.click();
        await driver.delayMs(500);
        await windowSnap.snapShot('RicheditorNotes0579_url_added');
      }

      Logger.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_NOTES_0007_772_579 end');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_NOTES_0007_772_581
     * @tc.name   : 备忘录小窗模式清单/列表圆圈
     * @tc.desc   : Verify text richeditor notes interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_NOTES_0007_772_581', 0, async () => {
      Logger.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_NOTES_0007_772_581 begin');
      await Settings.createWindow('testability/pages/component/rich_editor/RicheditorNotes/RicheditorNotes0581');
      const driver = Driver.create();
      await driver.delayMs(1000);

      // 截图 - 全屏模式
      await windowSnap.snapShot('RicheditorNotes0581_fullscreen');

      // 切换到小窗模式
      const smallWindowBtn = await driver.findComponent(ON.id('smallWindowBtn'));
      if (smallWindowBtn) {
        await smallWindowBtn.click();
        await driver.delayMs(500);
        await windowSnap.snapShot('RicheditorNotes0581_smallwindow');
      }

      Logger.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_NOTES_0007_772_581 end');
    });
  });
}
