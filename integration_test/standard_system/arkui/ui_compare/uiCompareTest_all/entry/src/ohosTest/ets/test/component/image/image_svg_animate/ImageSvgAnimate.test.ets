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

export default function imageSvgAnimateTest () {

  describe('imageSvgAnimateTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0010
     * @tc.name   : SVG animate test case 10
     * @tc.desc   : Verify media Image svg animate interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0010 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageSvg/imageSvg01')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0010')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0011
     * @tc.name   : SVG animate test case 11
     * @tc.desc   : Verify media Image svg animate interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0011', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0011 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageSvg/imageSvg02')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0011')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0011 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0012
     * @tc.name   : SVG animate test case 12
     * @tc.desc   : Verify media Image svg animate interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0012', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0012 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageSvg/imageSvg03')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0012')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0012 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0013
     * @tc.name   : SVG animate test case 13
     * @tc.desc   : Verify media Image svg animate interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0013', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0013 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageSvg/imageSvg04')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0013')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0013 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0014
     * @tc.name   : SVG animate test case 14
     * @tc.desc   : Verify media Image svg animate interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0014', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0014 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageSvg/imageSvg05')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0014')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0014 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0015
     * @tc.name   : SVG animate test case 15
     * @tc.desc   : Verify media Image svg animate interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0015', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0015 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageSvg/imageSvg06')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0015')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0015 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0016
     * @tc.name   : SVG animate test case 16
     * @tc.desc   : Verify media Image svg animate interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0016', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0016 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageSvg/imageSvg07')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0016')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0016 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0017
     * @tc.name   : SVG animate test case 17
     * @tc.desc   : Verify media Image svg animate interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0017', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0017 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageSvg/imageSvg08')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0017')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0017 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0018
     * @tc.name   : SVG animate test case 18
     * @tc.desc   : Verify media Image svg animate interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0018', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0018 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageSvg/imageSvg09')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0018')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0018 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0019
     * @tc.name   : SVG animate test case 19
     * @tc.desc   : Verify media Image svg animate interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0019', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0019 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageSvg/imageSvg10')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0019')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0019 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0020
     * @tc.name   : SVG animate test case 20
     * @tc.desc   : Verify media Image svg animate interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0020 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageSvg/imageSvg11')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0020')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0021
     * @tc.name   : SVG animate test case 21
     * @tc.desc   : Verify media Image svg animate interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0021', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0021 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageSvg/imageSvg12')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0021')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATE_0021 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0023
     * @tc.name   : SVG animate test case 22
     * @tc.desc   : Verify media Image svg animatetransform interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0023', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0023 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageSvg/imageSvg13')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0023')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0023 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0024
     * @tc.name   : SVG animateTransform test case 24
     * @tc.desc   : Verify media Image svg animatetransform interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0024', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0024 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageSvg/imageSvg14')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0024')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0024 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0025
     * @tc.name   : SVG animateTransform test case 25
     * @tc.desc   : Verify media Image svg animatetransform interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0025', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0025 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageSvg/imageSvg15')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0025')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0025 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0026
     * @tc.name   : SVG animateTransform test case 26
     * @tc.desc   : Verify media Image svg animatetransform interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0026', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0026 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageSvg/imageSvg16')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0026')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0026 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0028
     * @tc.name   : SVG animateTransform test case 28
     * @tc.desc   : Verify media Image svg animatetransform interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0028', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0028 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageSvg/imageSvg17')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0028')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0028 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0029
     * @tc.name   : SVG animateTransform test case 29
     * @tc.desc   : Verify media Image svg animatetransform interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0029', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0029 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageSvg/imageSvg18')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0029')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0029 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0030
     * @tc.name   : SVG animateTransform test case 30
     * @tc.desc   : Verify media Image svg animatetransform interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0030 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageSvg/imageSvg19')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_ANIMATETRANSFORM_0030 finish.`);
      done()
    })
  })
}