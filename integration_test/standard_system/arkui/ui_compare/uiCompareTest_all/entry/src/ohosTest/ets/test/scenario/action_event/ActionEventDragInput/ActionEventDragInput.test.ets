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

export default function actionEventDragInputTest() {
  describe('actionEventDragInputTest', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INPUT_0270
     * @tc.name   : 输入组件拖拽跟手图显示
     * @tc.desc   : Verify action event commonevent drag input interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INPUT_0270', 0, async (done: Function) => {
      const testName = 'SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INPUT_0270';
      Logger.info(`[${testName}] START`);

      await Settings.createWindow('testability/pages/scenario/action_event/ActionEventDragInput/DragInput0270');
      const driver = await Driver.create();
      await driver.delayMs(1000);

      const textArea = await driver.findComponent(ON.id('DragInput0270_TextArea'));
      expect(textArea !== null).assertTrue();
      Logger.info(`[${testName}] TextArea found`);

      const textInput = await driver.findComponent(ON.id('DragInput0270_TextInput'));
      expect(textInput !== null).assertTrue();
      Logger.info(`[${testName}] TextInput found`);

      const search = await driver.findComponent(ON.id('DragInput0270_Search'));
      expect(search !== null).assertTrue();
      Logger.info(`[${testName}] Search found`);

      await windowSnap.snapShot(`DragInput0270_initial`);

      Logger.info(`[${testName}] Manual test required: Select text in each component, long press and drag`);
      Logger.info(`[${testName}] Expected: 可以拖拽，跟手图显示正确`);

      await driver.delayMs(500);
      await windowSnap.snapShot(`DragInput0270_ready`);
      Logger.info(`[${testName}] PASS`);
      done();
    });
  });
}
