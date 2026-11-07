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

import { describe, it, expect, afterEach } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';

export default function uiComponentMediaDatepickerVoiceTest() {
  describe('uiComponentMediaDatepickerVoiceTest', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        Settings.destroyWindow(Settings.windowClass);
      }
      let driver = Driver.create();
      await driver.delayMs(500);
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_VOICE_0015
     * @tc.name   : 参数输入string类型验证
     * @tc.desc   : Verify media DatePicker voice interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_VOICE_0015', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_VOICE_0015 start');
      await Settings.createWindow('testability/pages/component/picker/MediaDatepickerVoice/DatepickerVoice0015');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let datePicker = await driver.findComponent(ON.id('date_picker'));
      expect(datePicker !== null).assertTrue();
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_VOICE_0030
     * @tc.name   : 一指向上一指向下滑动音效振动测试
     * @tc.desc   : Verify media DatePicker voice interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_VOICE_0030', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_VOICE_0030 start');
      await Settings.createWindow('testability/pages/component/picker/MediaDatepickerVoice/DatepickerVoice0030');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let datePicker = await driver.findComponent(ON.id('date_picker'));
      expect(datePicker !== null).assertTrue();
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_VOICE_0047
     * @tc.name   : API隔离测试
     * @tc.desc   : Verify media DatePicker voice interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_VOICE_0047', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_VOICE_0047 start');
      await Settings.createWindow('testability/pages/component/picker/MediaDatepickerVoice/DatepickerVoice0047');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let datePicker = await driver.findComponent(ON.id('date_picker'));
      expect(datePicker !== null).assertTrue();
      await windowSnap.snapShot();
      done();
    });
  });
}
