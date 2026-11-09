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

export default function imageResetTest () {

  describe('imageResetTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0010
     * @tc.name   : Image with url
     * @tc.desc   : Verify media Image reset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0010 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageReset/imageReset01')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0012
     * @tc.name   : Image reset
     * @tc.desc   : Verify media Image reset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0012', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0012 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageReset/imageReset02')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0012 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0013
     * @tc.name   : Image reset
     * @tc.desc   : Verify media Image reset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0013', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0013 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageReset/imageReset03')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0013 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0014
     * @tc.name   : Image reset
     * @tc.desc   : Verify media Image reset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0014', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0014 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageReset/imageReset04')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('imageReset04'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0014 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0015
     * @tc.name   : Image reset
     * @tc.desc   : Verify media Image reset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0015', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0015 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageReset/imageReset05')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('imageReset05_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button2: Component = await driver.waitForComponent(ON.id('imageReset05_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0015 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0016
     * @tc.name   : Image reset
     * @tc.desc   : Verify media Image reset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0016', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0016 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageReset/imageReset06')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('imageReset06'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0016 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0017
     * @tc.name   : Image reset
     * @tc.desc   : Verify media Image reset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0017', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0017 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageReset/imageReset07')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('imageReset07'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0017 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0018
     * @tc.name   : Image reset
     * @tc.desc   : Verify media Image reset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0018', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0018 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageReset/imageReset08')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('imageReset08'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0018 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0019
     * @tc.name   : Image reset
     * @tc.desc   : Verify media Image reset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0019', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0019 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageReset/imageReset09')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('imageReset09'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0019 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0020
     * @tc.name   : Image reset
     * @tc.desc   : Verify media Image reset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0020 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageReset/imageReset10')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('imageReset10_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button2: Component = await driver.waitForComponent(ON.id('imageReset10_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0021
     * @tc.name   : Image reset
     * @tc.desc   : Verify media Image reset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0021', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0021 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageReset/imageReset11')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('imageReset11_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button2: Component = await driver.waitForComponent(ON.id('imageReset11_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0021 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0022
     * @tc.name   : Image reset
     * @tc.desc   : Verify media Image reset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0022', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0022 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageReset/imageReset12')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('imageReset12'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0022 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0023
     * @tc.name   : Image reset
     * @tc.desc   : Verify media Image reset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0023', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0023 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageReset/imageReset13')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('imageReset13_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button2: Component = await driver.waitForComponent(ON.id('imageReset13_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0023 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0024
     * @tc.name   : Image reset
     * @tc.desc   : Verify media Image reset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0024', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0024 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageReset/imageReset14')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('imageReset14_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button2: Component = await driver.waitForComponent(ON.id('imageReset14_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0024 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0025
     * @tc.name   : Image reset
     * @tc.desc   : Verify media Image reset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0025', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0025 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageReset/imageReset15')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('imageReset15_01'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      let button1: Component = await driver.waitForComponent(ON.id('imageReset15_02'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button2: Component = await driver.waitForComponent(ON.id('imageReset15_03'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0025 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0026
     * @tc.name   : Image reset
     * @tc.desc   : Verify media Image reset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0026', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0026 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageReset/imageReset16')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('imageReset16'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0026 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0027
     * @tc.name   : Image reset
     * @tc.desc   : Verify media Image reset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0027', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0027 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageReset/imageReset17')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('imageReset17_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button2: Component = await driver.waitForComponent(ON.id('imageReset17_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0027 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0028
     * @tc.name   : Image reset
     * @tc.desc   : Verify media Image reset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0028', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0028 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageReset/imageReset18')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('imageReset18'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0028 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0029
     * @tc.name   : Image reset
     * @tc.desc   : Verify media Image reset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0029', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0029 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageReset/imageReset19')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('imageReset19_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button2: Component = await driver.waitForComponent(ON.id('imageReset19_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0029 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0030
     * @tc.name   : Image reset
     * @tc.desc   : Verify media Image reset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0030 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageReset/imageReset20')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('imageReset20_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button2: Component = await driver.waitForComponent(ON.id('imageReset20_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0031
     * @tc.name   : Image reset
     * @tc.desc   : Verify media Image reset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0031', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0031 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageReset/imageReset21')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('imageReset21_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button2: Component = await driver.waitForComponent(ON.id('imageReset21_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0031 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0032
     * @tc.name   : Image reset
     * @tc.desc   : Verify media Image reset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0032', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0032 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageReset/imageReset22')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('imageReset22'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button2: Component = await driver.waitForComponent(ON.id('imageReset22_longClick'), 1000);
      await button2.longClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0032 finish.`);
      done()
    })
  })
}