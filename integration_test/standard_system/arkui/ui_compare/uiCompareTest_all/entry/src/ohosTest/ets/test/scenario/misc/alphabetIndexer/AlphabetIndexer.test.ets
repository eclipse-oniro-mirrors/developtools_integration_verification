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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';
import Utils from '../../../model/Utils';
import { Driver, ON, Component } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit'

export default function alphabetIndexerTest() {

  describe('alphabetIndexerTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0180
     * @tc.name   : Attribute - popupBackground(Value: ResourceColor) - Take string Value
     * @tc.desc   : Verify other alphabetindexer attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0180 start.`);
      Settings.createWindow('testability/pages/scenario/misc/alphabetIndexer/alphabetIndexer01')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.text('B'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0180')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0250
     * @tc.name   : Attribute - popupBackground(Value: ResourceColor) - Not set
     * @tc.desc   : Verify other alphabetindexer attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0150 start.`);
      Settings.createWindow('testability/pages/scenario/misc/alphabetIndexer/alphabetIndexer02')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.text('B'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0150')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0200
     * @tc.name   : Attribute - popupBackground(Value: ResourceColor) - Set to rgb Value
     * @tc.desc   : Verify other alphabetindexer attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0200 start.`);
      Settings.createWindow('testability/pages/scenario/misc/alphabetIndexer/alphabetIndexer03')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.text('B'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0200')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0190
     * @tc.name   : Attribute - popupBackground(Value: ResourceColor) - Take enum Value
     * @tc.desc   : Verify other alphabetindexer attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0190 start.`);
      Settings.createWindow('testability/pages/scenario/misc/alphabetIndexer/alphabetIndexer04')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.text('B'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0190')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0170
     * @tc.name   : Attribute - popupBackground(Value: ResourceColor) - Take number Value
     * @tc.desc   : Verify other alphabetindexer attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0170 start.`);
      Settings.createWindow('testability/pages/scenario/misc/alphabetIndexer/alphabetIndexer05')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.text('B'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0170')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0010
     * @tc.name   : Attribute - alignStyle(Value: IndexerAlign) - Left
     * @tc.desc   : Verify other alphabetindexer attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0010 start.`);
      Settings.createWindow('testability/pages/scenario/misc/alphabetIndexer/alphabetIndexer06')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.text('B'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0010')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0020
     * @tc.name   : Attribute - alignStyle(Value: IndexerAlign) - Right
     * @tc.desc   : Verify other alphabetindexer attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0020 start.`);
      Settings.createWindow('testability/pages/scenario/misc/alphabetIndexer/alphabetIndexer07')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.text('B'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0020')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0240
     * @tc.name   : Attribute - popupColor(Value: ResourceColor) - Take string Value
     * @tc.desc   : Verify other alphabetindexer attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0240 start.`);
      Settings.createWindow('testability/pages/scenario/misc/alphabetIndexer/alphabetIndexer08')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.text('B'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0240')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0230
     * @tc.name   : Attribute - popupColor(Value: ResourceColor) - Take number Value
     * @tc.desc   : Verify other alphabetindexer attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0230 start.`);
      Settings.createWindow('testability/pages/scenario/misc/alphabetIndexer/alphabetIndexer09')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.text('B'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0230')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0210
     * @tc.name   : Attribute - popupColor(Value: ResourceColor) - Not set
     * @tc.desc   : Verify other alphabetindexer attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0210 start.`);
      Settings.createWindow('testability/pages/scenario/misc/alphabetIndexer/alphabetIndexer10')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.text('B'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0210')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0260
     * @tc.name   : Attribute - popupColor(Value: ResourceColor) - Set to rgb Value
     * @tc.desc   : Verify other alphabetindexer attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0260 start.`);
      Settings.createWindow('testability/pages/scenario/misc/alphabetIndexer/alphabetIndexer11')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.text('B'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0260')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0250
     * @tc.name   : Attribute - popupColor(Value: ResourceColor) - Take enum Value
     * @tc.desc   : Verify other alphabetindexer attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0250 start.`);
      Settings.createWindow('testability/pages/scenario/misc/alphabetIndexer/alphabetIndexer12')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.text('B'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0250')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0300
     * @tc.name   : Attribute - popupPosition(Value: Position) - Default Value
     * @tc.desc   : Verify other alphabetindexer attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0300 start.`);
      Settings.createWindow('testability/pages/scenario/misc/alphabetIndexer/alphabetIndexer13')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.text('B'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0300')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0280
     * @tc.name   : Attribute - popupFont(Value: Font) - Default configuration
     * @tc.desc   : Verify other alphabetindexer attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0280 start.`);
      Settings.createWindow('testability/pages/scenario/misc/alphabetIndexer/alphabetIndexer14')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.text('B'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0280')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0480
     * @tc.name   : Attribute - usingPopup(Value: boolean) - false .usingPopup(false)
     * @tc.desc   : Verify other alphabetindexer attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0480', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0480 start.`);
      Settings.createWindow('testability/pages/scenario/misc/alphabetIndexer/alphabetIndexer15')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.text('B'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0480')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0480 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0500
     * @tc.name   : Attribute - usingPopup(Value: boolean) - Not configured
     * @tc.desc   : Verify other alphabetindexer attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0500 start.`);
      Settings.createWindow('testability/pages/scenario/misc/alphabetIndexer/alphabetIndexer16')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.text('B'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0500')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0500 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0490
     * @tc.name   : Attribute - usingPopup(Value: boolean) - true .usingPopup(true)
     * @tc.desc   : Verify other alphabetindexer attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0490 start.`);
      Settings.createWindow('testability/pages/scenario/misc/alphabetIndexer/alphabetIndexer17')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.text('B'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0490')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_ATTRIBUTE_0490 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_IMPROVE_0380
     * @tc.name   : Set AlphabetIndexer's popupTitleBackground attribute parameter to color.red
     * @tc.desc   : Verify other alphabetindexer improve interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_IMPROVE_0380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_IMPROVE_0380 start.`);
      Settings.createWindow('testability/pages/scenario/misc/alphabetIndexer/alphabetIndexer18')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.text('B'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_IMPROVE_0380')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_IMPROVE_0380 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_IMPROVE_0310
     * @tc.name   : Set AlphabetIndexer's popupBackgroundBlurStyle attribute parameter to COMPONENT_REGULAR
     * @tc.desc   : Verify other alphabetindexer improve interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_IMPROVE_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_IMPROVE_0310 start.`);
      Settings.createWindow('testability/pages/scenario/misc/alphabetIndexer/alphabetIndexer19')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.text('B'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_IMPROVE_0310')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_IMPROVE_0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_IMPROVE_0220
     * @tc.name   : Set AlphabetIndexer's popupBackgroundBlurStyle attribute parameter to Regular
     * @tc.desc   : Verify other alphabetindexer improve interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_IMPROVE_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_IMPROVE_0220 start.`);
      Settings.createWindow('testability/pages/scenario/misc/alphabetIndexer/alphabetIndexer20')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.text('B'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_IMPROVE_0220')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_IMPROVE_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_IMPROVE_0250
     * @tc.name   : Set AlphabetIndexer's popupBackgroundBlurStyle attribute parameter to BACKGROUND_REGULAR
     * @tc.desc   : Verify other alphabetindexer improve interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_IMPROVE_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_IMPROVE_0250 start.`);
      Settings.createWindow('testability/pages/scenario/misc/alphabetIndexer/alphabetIndexer21')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.text('B'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_IMPROVE_0250')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_IMPROVE_0250 finish.`);
      done()
    })
  })
}