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

export default function specialComponentsUIContextGrayscale() {

  describe('specialComponentsUIContextGrayscale', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err) => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0100
     * @tc.name   : Special components uicontext grayscale
     * @tc.desc   : Verify special components uicontext grayscale interface behavior and expected UI result for this case.
     * @tc.type   : Configure the grayscale for the UIExtensionComponent content, setting the grayscale parameter to -10, -1, 0, 0.2, 0.5, 0.8, 1, 1.5, 100
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0100 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUIContextGrayscale/SpecialComponentsUIContextGrayscale0100')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(6000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0070
     * @tc.name   : Special components uicontext grayscale
     * @tc.desc   : Verify special components uicontext grayscale interface behavior and expected UI result for this case.
     * @tc.type   : Configure the grayscale for the Swiper content, setting the grayscale parameter to -10, -1, 0, 0.2, 0.5, 0.8, 1, 1.5, 100
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0070 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUIContextGrayscale/SpecialComponentsUIContextGrayscale0070')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0020
     * @tc.name   : Special components uicontext grayscale
     * @tc.desc   : Verify special components uicontext grayscale interface behavior and expected UI result for this case.
     * @tc.type   : The content of the Canvas component is configured with grayscale, and the grayscale input parameter is undefined.
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0020 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUIContextGrayscale/SpecialComponentsUIContextGrayscale0020')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0050
     * @tc.name   : Special components uicontext grayscale
     * @tc.desc   : Verify special components uicontext grayscale interface behavior and expected UI result for this case.
     * @tc.type   : The content of the List component is configured with grayscale, and the parameters set for grayscale are -10, -1, 0, 0.2, 0.5, 0.8, 1, 1.5, and 100.
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0050 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUIContextGrayscale/SpecialComponentsUIContextGrayscale0050')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0030
     * @tc.name   : Special components uicontext grayscale
     * @tc.desc   : Verify special components uicontext grayscale interface behavior and expected UI result for this case.
     * @tc.type   : The content of the Canvas component is configured with grayscale, and the parameters set for grayscale are -10, -1, 0, 0.2, 0.5, 0.8, 1, 1.5, and 100.
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0030 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUIContextGrayscale/SpecialComponentsUIContextGrayscale0030')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0110
     * @tc.name   : Special components uicontext grayscale
     * @tc.desc   : Verify special components uicontext grayscale interface behavior and expected UI result for this case.
     * @tc.type   : The content of the Rating component is configured with grayscale, and the parameters set for grayscale are -10, -1, 0, 0.2, 0.5, 0.8, 1, 1.5, and 100.
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0110 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUIContextGrayscale/SpecialComponentsUIContextGrayscale0110')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0200
     * @tc.name   : Special components uicontext grayscale
     * @tc.desc   : Verify special components uicontext grayscale interface behavior and expected UI result for this case.
     * @tc.type   : The content of the Search component is configured with grayscale, and the parameters set for grayscale are -10, -1, 0, 0.2, 0.5, 0.8, 1, 1.5, and 100.
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0200 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUIContextGrayscale/SpecialComponentsUIContextGrayscale0200')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0060
     * @tc.name   : Special components uicontext grayscale
     * @tc.desc   : Verify special components uicontext grayscale interface behavior and expected UI result for this case.
     * @tc.type   : The content of the WaterFlow component is configured with grayscale, and the parameters set for grayscale are -10, -1, 0, 0.2, 0.5, 0.8, 1, 1.5, and 100.
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0060 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUIContextGrayscale/SpecialComponentsUIContextGrayscale0060')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0080
     * @tc.name   : Special components uicontext grayscale
     * @tc.desc   : Verify special components uicontext grayscale interface behavior and expected UI result for this case.
     * @tc.type   : The content of the Stepper component is configured with grayscale, and the parameters set for grayscale are -10, -1, 0, 0.2, 0.5, 0.8, 1, 1.5, and 100.
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0080 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUIContextGrayscale/SpecialComponentsUIContextGrayscale0080')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0090
     * @tc.name   : Special components uicontext grayscale
     * @tc.desc   : Verify special components uicontext grayscale interface behavior and expected UI result for this case.
     * @tc.type   : The content of the Tabs component is configured with grayscale, and the parameters set for grayscale are -10, -1, 0, 0.2, 0.5, 0.8, 1, 1.5, and 100.
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0090 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUIContextGrayscale/SpecialComponentsUIContextGrayscale0090')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0140
     * @tc.name   : Special components uicontext grayscale
     * @tc.desc   : Verify special components uicontext grayscale interface behavior and expected UI result for this case.
     * @tc.type   : The content of the AlphabetIndexer component is configured with grayscale, and the parameters set for grayscale are -10, -1, 0, 0.2, 0.5, 0.8, 1, 1.5, and 100.
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0140 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUIContextGrayscale/SpecialComponentsUIContextGrayscale0140')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,6000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0170
     * @tc.name   : Special components uicontext grayscale
     * @tc.desc   : Verify special components uicontext grayscale interface behavior and expected UI result for this case.
     * @tc.type   : The content of the Text component is configured with grayscale, and the parameters set for grayscale are -10, -1, 0, 0.2, 0.5, 0.8, 1, 1.5, and 100.
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0170 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUIContextGrayscale/SpecialComponentsUIContextGrayscale0170')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,6000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0130
     * @tc.name   : Special components uicontext grayscale
     * @tc.desc   : Verify special components uicontext grayscale interface behavior and expected UI result for this case.
     * @tc.type   : The content of the Shape component is configured with grayscale, and the parameters set for grayscale are -10, -1, 0, 0.2, 0.5, 0.8, 1, 1.5, and 100.
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0130 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUIContextGrayscale/SpecialComponentsUIContextGrayscale0130')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0180
     * @tc.name   : Special components uicontext grayscale
     * @tc.desc   : Verify special components uicontext grayscale interface behavior and expected UI result for this case.
     * @tc.type   : The content of the TextArea component is configured with grayscale, and the parameters set for grayscale are -10, -1, 0, 0.2, 0.5, 0.8, 1, 1.5, and 100.
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0180 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUIContextGrayscale/SpecialComponentsUIContextGrayscale0180')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0120
     * @tc.name   : Special components uicontext grayscale
     * @tc.desc   : Verify special components uicontext grayscale interface behavior and expected UI result for this case.
     * @tc.type   : The content of the Video component is configured with grayscale, and the parameters set for grayscale are -10, -1, 0, 0.2, 0.5, 0.8, 1, 1.5, and 100.
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0120 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUIContextGrayscale/SpecialComponentsUIContextGrayscale0120')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,6000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0040
     * @tc.name   : Special components uicontext grayscale
     * @tc.desc   : Verify special components uicontext grayscale interface behavior and expected UI result for this case.
     * @tc.type   : The content of the Grid component is configured with grayscale, and the parameters set for grayscale are -10, -1, 0, 0.2, 0.5, 0.8, 1, 1.5, and 100.
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0040 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUIContextGrayscale/SpecialComponentsUIContextGrayscale0040')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,6000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0160
     * @tc.name   : Special components uicontext grayscale
     * @tc.desc   : Verify special components uicontext grayscale interface behavior and expected UI result for this case.
     * @tc.type   : The content of the SideBarContainer component is configured with grayscale, and the parameters set for grayscale are -10, -1, 0, 0.2, 0.5, 0.8, 1, 1.5, and 100.
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0160 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUIContextGrayscale/SpecialComponentsUIContextGrayscale0160')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0190
     * @tc.name   : Special components uicontext grayscale
     * @tc.desc   : Verify special components uicontext grayscale interface behavior and expected UI result for this case.
     * @tc.type   : The content of the TextInput component is configured with grayscale, and the parameters set for grayscale are -10, -1, 0, 0.2, 0.5, 0.8, 1, 1.5, and 100.
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0190 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUIContextGrayscale/SpecialComponentsUIContextGrayscale0190')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0150
     * @tc.name   : Special components uicontext grayscale
     * @tc.desc   : Verify special components uicontext grayscale interface behavior and expected UI result for this case.
     * @tc.type   : The content of the Navigator component is configured with grayscale, and the parameters set for grayscale are -10, -1, 0, 0.2, 0.5, 0.8, 1, 1.5, and 100.
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0150 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUIContextGrayscale/SpecialComponentsUIContextGrayscale0150')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0280
     * @tc.name   : Special components uicontext grayscale
     * @tc.desc   : Verify special components uicontext grayscale interface behavior and expected UI result for this case.
     * @tc.type   : The content of the implicit shared element transition (geometryTransition) within the component is configured with grayscale, and the parameters set for grayscale are -10, -1, 0, 0.2, 0.5, 0.8, 1, 1.5, and 100.
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0280 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUIContextGrayscale/SpecialComponentsUIContextGrayscale0280')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0260
     * @tc.name   : Special components uicontext grayscale
     * @tc.desc   : Verify special components uicontext grayscale interface behavior and expected UI result for this case.
     * @tc.type   : The content of the keyframe animation (keyframeAnimateTo) is configured with grayscale, and the parameters set for grayscale are -10, -1, 0, 0.2, 0.5, 0.8, 1, 1.5, and 100.
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0260 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUIContextGrayscale/SpecialComponentsUIContextGrayscale0260')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0310
     * @tc.name   : Special components uicontext grayscale
     * @tc.desc   : Verify special components uicontext grayscale interface behavior and expected UI result for this case.
     * @tc.type   : The content of the warning pop-up AlertDialog is configured with grayscale, and the parameters set for grayscale are -10, -1, 0, 0.2, 0.5, 0.8, 1, 1.5, and 100.
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0310 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUIContextGrayscale/SpecialComponentsUIContextGrayscale0310')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0210
     * @tc.name   : Special components uicontext grayscale
     * @tc.desc   : Verify special components uicontext grayscale interface behavior and expected UI result for this case.
     * @tc.type   : The content of the RichEditor component is configured with grayscale, and the parameters set for grayscale are -10, -1, 0, 0.2, 0.5, 0.8, 1, 1.5, and 100.
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0210 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUIContextGrayscale/SpecialComponentsUIContextGrayscale0210')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0290
     * @tc.name   : Special components uicontext grayscale
     * @tc.desc   : Verify special components uicontext grayscale interface behavior and expected UI result for this case.
     * @tc.type   : The content of the semi-modal transition (bindSheet) is configured with grayscale, and the parameters set for grayscale are -10, -1, 0, 0.2, 0.5, 0.8, 1, 1.5, and 100.
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0290 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUIContextGrayscale/SpecialComponentsUIContextGrayscale0290')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0290 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0300
     * @tc.name   : Special components uicontext grayscale
     * @tc.desc   : Verify special components uicontext grayscale interface behavior and expected UI result for this case.
     * @tc.type   : The content of the menu (Menu) is configured with grayscale, and the parameters set for grayscale are -10, -1, 0, 0.2, 0.5, 0.8, 1, 1.5, and 100.
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0300 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUIContextGrayscale/SpecialComponentsUIContextGrayscale0300')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0010
     * @tc.name   : Special components uicontext grayscale
     * @tc.desc   : Verify special components uicontext grayscale interface behavior and expected UI result for this case.
     * @tc.type   : The content of the Canvas component is configured with grayscale, and the input parameter for grayscale is null.
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0010 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUIContextGrayscale/SpecialComponentsUIContextGrayscale0010')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0250
     * @tc.name   : Special components uicontext grayscale
     * @tc.desc   : Verify special components uicontext grayscale interface behavior and expected UI result for this case.
     * @tc.type   : The content of the explicit animation (animateTo) is configured with grayscale, and the parameters set for grayscale are -10, -1, 0, 0.2, 0.5, 0.8, 1, 1.5, and 100.
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0250 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUIContextGrayscale/SpecialComponentsUIContextGrayscale0250')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0340
     * @tc.name   : Special components uicontext grayscale
     * @tc.desc   : Verify special components uicontext grayscale interface behavior and expected UI result for this case.
     * @tc.type   : The content of the DatePickerDialog is configured with grayscale, and the parameters set for grayscale are -10, -1, 0, 0.2, 0.5, 0.8, 1, 1.5, and 100.
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0340 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUIContextGrayscale/SpecialComponentsUIContextGrayscale0340')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0240
     * @tc.name   : Special components uicontext grayscale
     * @tc.desc   : Verify special components uicontext grayscale interface behavior and expected UI result for this case.
     * @tc.type   : The content of the animation is configured with grayscale, and the parameters set for grayscale are -10, -1, 0, 0.2, 0.5, 0.8, 1, 1.5, and 100.
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0240 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUIContextGrayscale/SpecialComponentsUIContextGrayscale0240')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0270
     * @tc.name   : Special components uicontext grayscale
     * @tc.desc   : Verify special components uicontext grayscale interface behavior and expected UI result for this case.
     * @tc.type   : The content of the Particle is configured with grayscale, and the parameters set for grayscale are -10, -1, 0, 0.2, 0.5, 0.8, 1, 1.5, and 100.
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0270 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUIContextGrayscale/SpecialComponentsUIContextGrayscale0270')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(7000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0360
     * @tc.name   : Special components uicontext grayscale
     * @tc.desc   : Verify special components uicontext grayscale interface behavior and expected UI result for this case.
     * @tc.type   : The content of the TimePickerDialog is configured with grayscale, and the parameters set for grayscale are -10, -1, 0, 0.2, 0.5, 0.8, 1, 1.5, and 100.
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0360 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUIContextGrayscale/SpecialComponentsUIContextGrayscale0360')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0360 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0350
     * @tc.name   : Special components uicontext grayscale
     * @tc.desc   : Verify special components uicontext grayscale interface behavior and expected UI result for this case.
     * @tc.type   : The content of the CalendarPickerDialog is configured with grayscale, and the parameters set for grayscale are -10, -1, 0, 0.2, 0.5, 0.8, 1, 1.5, and 100.
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0350 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUIContextGrayscale/SpecialComponentsUIContextGrayscale0350')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_GRAYSCALE_0350 finish.`);
      done()
    })


  })
}