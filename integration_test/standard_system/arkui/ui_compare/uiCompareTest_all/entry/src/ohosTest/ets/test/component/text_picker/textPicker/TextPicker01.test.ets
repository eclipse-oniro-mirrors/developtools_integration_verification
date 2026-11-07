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

export default function textPicker01Test () {

  describe('textPicker01Test', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err:BusinessError) => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0017
     * @tc.name   : When range is single-column data (string[] type), set columnWidths to abnormal value undefined to
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0017', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0017 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPicker01')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0017')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0017 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0018
     * @tc.name   : When range is single-column data (string[] type), set columnWidths to abnormal value null to
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0018', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0018 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPicker02')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0018')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0018 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0019
     * @tc.name   : When range is single-column data (string[] type), set columnWidths to abnormal value
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0019', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0019 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPicker03')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0019')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0019 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0020
     * @tc.name   : When range is single-column data (string[] type), set columnWidths to abnormal value
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0020 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPicker04')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0020')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0026
     * @tc.name   : When range is single-column Resource type data, observe display effect without setting columnWidths
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0026', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0026 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPicker05')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0026')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0026 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0027
     * @tc.name   : When range is single-column Resource type data, set columnWidths to normal value
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0027', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0027 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPicker06')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0027')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0027 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0028
     * @tc.name   : When range is single-column Resource type data, set columnWidths value larger than TextPicker
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0028', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0028 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPicker07')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0028')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0028 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0029
     * @tc.name   : When range is single-column Resource type data, set columnWidths length > 1
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0029', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0029 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPicker08')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0029')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0029 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0030
     * @tc.name   : When range is single-column Resource type data, set columnWidths length < 1 (empty array)
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0030 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPicker09')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0030')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0031
     * @tc.name   : When range is single-column TextPickerRangeContent[] type data, set columnWidths to normal value
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0031', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0031 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPicker10')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0031')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0031 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0035
     * @tc.name   : When range has n (n>1) columns (string[][] type), observe display effect without setting
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0035', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0035 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPicker11')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0035')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0035 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0042
     * @tc.name   : When range has n (n>1) columns (string[][] type), set columnWidths length=n with all columns as
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0042', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0042 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPicker12')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0042')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0042 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0043
     * @tc.name   : When range has n (n>1) columns (string[][] type), set columnWidths length=n with all columns as
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0043', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0043 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPicker13')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0043')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0043 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0044
     * @tc.name   : When range has n (n>1) columns (string[][] type), set columnWidths length=n with all columns as
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0044', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0044 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPicker14')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0044')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0044 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0045
     * @tc.name   : When range has n (n>1) columns (string[][] type), set columnWidths length=n with all columns as
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0045', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0045 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPicker15')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0045')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0045 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0046
     * @tc.name   : When range has n (n>1) columns (string[][] type), set columnWidths length=n with all columns as
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0046', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0046 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPicker16')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0046')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0046 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0047
     * @tc.name   : When range has multiple columns (string[][] type), set total columnWidths larger than TextPicker
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0047', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0047 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPicker17')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0047')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0047 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0048
     * @tc.name   : When range has n (n>1) columns (string[][] type), set columnWidths length > n to observe column
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0048', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0048 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPicker18')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0048')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0048 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0049
     * @tc.name   : When range has n (n>1) columns (string[][] type), set columnWidths length < n to observe column
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0049', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0049 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPicker19')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0049')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0049 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0050
     * @tc.name   : When range has n (n>1) columns (string[][] type), dynamically modify columnWidths values
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0050 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPicker20')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('textPicker20_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0050_01')
      await Utils.sleep(1000)
      let button2: Component = await driver.waitForComponent(ON.id('textPicker20_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0050_02')
      await Utils.sleep(1000)
      let button3: Component = await driver.waitForComponent(ON.id('textPicker20_03'), 1000);
      await button3.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0050_03')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0051
     * @tc.name   : When range has n (n>1) columns (TextCascadePickerRangeContent[] type), observe display effect
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0051', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0051 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPicker21')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0051')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0051 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0059
     * @tc.name   : When range has n (n>1) columns (TextCascadePickerRangeContent[] type), set columnWidths length=n
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0059', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0059 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPicker22')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0059')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0059 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0060
     * @tc.name   : When range has n (n>1) columns (TextCascadePickerRangeContent[] type), set columnWidths length=n
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0060 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPicker23')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0060')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0061
     * @tc.name   : When range has n (n>1) columns (TextCascadePickerRangeContent[] type), set columnWidths length=n
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0061', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0061 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPicker24')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0061')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0061 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0062
     * @tc.name   : When range has n (n>1) columns (TextCascadePickerRangeContent[] type), set columnWidths length=n
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0062', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0062 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPicker25')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0062')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0062 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0063
     * @tc.name   : When range has multiple columns (TextCascadePickerRangeContent[] type), set total columnWidths
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0063', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0063 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/textPicker26')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0063')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0063 finish.`);
      done()
    })
  })
}