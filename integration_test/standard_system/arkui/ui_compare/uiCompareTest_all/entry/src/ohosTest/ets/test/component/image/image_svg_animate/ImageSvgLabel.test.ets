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

export default function imageSvgLabelTest () {

  describe('imageSvgLabelTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0011
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0011', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0011 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel01')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0011')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0011 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0012
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0012', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0012 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel35')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0012 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0013
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0013', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0013 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel02')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0013 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0014
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0014', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0014 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel03')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0014 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0015
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0015', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0015 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel04')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SV极光GLABEL_0015 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0016
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0016', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0016 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel05')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0016 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0017
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0017', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0017 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel06')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0017 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0018
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0018', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0018 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel07')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0018 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0019
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0019', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0019 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel08')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0019 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0020
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0020 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel09')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0021
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0021', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0021 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel10')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0021 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0022
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0022', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0022 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel11')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0022 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0023
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0023', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0023 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel12')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0023 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0024
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0024', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0024 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel13')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0024 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0025
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0025', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0025 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel14')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0025 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0026
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0026', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0026 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel15')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0026 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0027
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0027', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0027 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel16')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0027 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0028
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0028', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0028 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel17')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0028 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0029
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0029', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0029 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel18')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0029 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0030
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0030 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel19')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0031
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0031', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0031 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel20')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0031 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0032
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0032', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0032 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel21')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0032 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0033
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0033', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0033 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel22')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0033 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0034
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0034', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0034 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel23')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0034 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0035
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0035', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0035 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel24')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0035 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0036
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0036', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0036 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel25')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0036 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0037
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0037', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0037 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel26')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0037 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0038
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0038', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0038 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel27')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0038 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0039
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0039', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0039 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel28')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0039 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0040
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0040 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel29')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0041
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0041', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0041 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel30')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0041 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0042
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0042', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0042 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel31')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0042 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0043
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0043', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0043 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel32')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0043 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0044
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0044', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0044 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel33')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0044 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0045
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0045', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0045 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel34')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0045 finish.`);
      done()
    })
    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0046
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0046', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0046 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel36')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0046 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0047
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0047', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0047 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel37')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0047 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0048
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0048', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0048 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel38')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0048 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0049
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0049', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0049 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel39')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0049 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0050
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0050 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel40')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0051
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svglabel interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0051', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0051 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLabel/imageLabel41')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGLABEL_0051 finish.`);
      done()
    })
  })
}