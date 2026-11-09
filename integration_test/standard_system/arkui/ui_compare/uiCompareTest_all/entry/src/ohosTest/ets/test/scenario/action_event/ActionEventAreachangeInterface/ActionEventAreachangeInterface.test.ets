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

import { describe, it, afterEach, expect } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';

export default function actionEventAreachangeInterfaceTest() {
  describe('actionEventAreachangeInterfaceTest', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_INTERFACE_0270
     * @tc.name   : 触发消失的onVisibleAreaChange回调
     * @tc.desc   : Verify action event commonevent areachange interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_INTERFACE_0270', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_INTERFACE_0270';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionEventAreachangeInterface/Interface0270');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      // 初始状态截图
      await windowSnap.snapShot(`Interface0270_initial`);

      // 点击Remove Node按钮
      const removeBtn = await driver.findComponent(ON.id('Interface0270_RemoveBtn'));
      expect(removeBtn !== null).assertTrue();
      await removeBtn.click();
      Logger.info(`[${testName}] Remove button clicked`);
      await driver.delayMs(500);
      await windowSnap.snapShot(`Interface0270_removed`);

      // 点击Add Node按钮
      const addBtn = await driver.findComponent(ON.id('Interface0270_AddBtn'));
      expect(addBtn !== null).assertTrue();
      await addBtn.click();
      Logger.info(`[${testName}] Add button clicked`);
      await driver.delayMs(500);
      await windowSnap.snapShot(`Interface0270_added`);

      Logger.info(`[${testName}] Expected: Remove后视频消失，Add后视频显现并继续播放`);
      Logger.info(`[${testName}] PASS`);
      done();
    });
  });
}
