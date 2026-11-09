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

export default function textPicker02Test () {

  describe('textPicker02Test', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0012
     * @tc.name   : * @tc.type   : Function
     * @tc.desc   : Verify media TextPicker disabletsa interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0012', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0012 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/mediaTextPicker01')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0012')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0012 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0013
     * @tc.name   : * @tc.type   : Function
     * @tc.desc   : Verify media TextPicker disabletsa interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0013', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0013 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/mediaTextPicker02')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0013')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0013 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0015
     * @tc.name   : * @tc.type   : Function
     * @tc.desc   : Verify media TextPicker disabletsa interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0015', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0015 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/mediaTextPicker03')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0015')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0015 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0019
     * @tc.name   : * @tc.type   : Function
     * @tc.desc   : Verify media TextPicker disabletsa interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0019', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0019 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/mediaTextPicker04')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0019')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0019 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0020
     * @tc.name   : * @tc.type   : Function
     * @tc.desc   : Verify media TextPicker disabletsa interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0020 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/mediaTextPicker05')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button: Component = await driver.waitForComponent(ON.id('mediaTextPicker05'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0020')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0021
     * @tc.name   : Media TextPicker disabletsa
     * @tc.desc   : Verify media TextPicker disabletsa interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0021', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0021 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/mediaTextPicker06')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button: Component = await driver.waitForComponent(ON.id('mediaTextPicker06'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0021 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0023
     * @tc.name   : Media TextPicker disabletsa
     * @tc.desc   : Verify media TextPicker disabletsa interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0023', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0023 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/mediaTextPicker07')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let textPicker: Component = await driver.waitForComponent(ON.id('mediaTextPicker07'), 1000);
      let point = await textPicker.getBoundsCenter();
      await driver.swipe(point.x, point.y, point.x, point.y + 60, 3000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0023 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0024
     * @tc.name   : Media TextPicker disabletsa
     * @tc.desc   : Verify media TextPicker disabletsa interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0024', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0024 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/mediaTextPicker08')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let textPicker: Component = await driver.waitForComponent(ON.id('mediaTextPicker08'), 1000);
      let point = await textPicker.getBoundsCenter();
      await driver.swipe(point.x, point.y, point.x, point.y + 60, 3000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0024 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0025
     * @tc.name   : Media TextPicker disabletsa
     * @tc.desc   : Verify media TextPicker disabletsa interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0025', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0025 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/mediaTextPicker09')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let textPicker: Component = await driver.waitForComponent(ON.id('mediaTextPicker09'), 1000);
      let point = await textPicker.getBoundsCenter();
      await driver.swipe(point.x, point.y, point.x, point.y + 60, 3000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0025 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0026
     * @tc.name   : Media TextPicker disabletsa
     * @tc.desc   : Verify media TextPicker disabletsa interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0026', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0026 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/mediaTextPicker10')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let textPicker: Component = await driver.waitForComponent(ON.id('mediaTextPicker10'), 1000);
      let point = await textPicker.getBoundsCenter();
      await driver.swipe(point.x, point.y, point.x, point.y + 60, 3000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0026 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0028
     * @tc.name   : Media TextPicker disabletsa
     * @tc.desc   : Verify media TextPicker disabletsa interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0028', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0028 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/mediaTextPicker11')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0028 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0029
     * @tc.name   : Media TextPicker disabletsa
     * @tc.desc   : Verify media TextPicker disabletsa interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0029', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0029 start.`);
      Settings.createWindow('testability/pages/component/text_picker/textPicker/mediaTextPicker12')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_DISABLETSA_0029 finish.`);
      done()
    })
  })
}