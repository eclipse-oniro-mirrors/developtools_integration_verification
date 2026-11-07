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

export default function imageSvgParseTest () {

  describe('imageSvgParseTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGPARSE_0030
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svgparse interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGPARSE_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGPARSE_0030 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageParse/imageParse01')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('imageParse01_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button2: Component = await driver.waitForComponent(ON.id('imageParse01_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGPARSE_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGPARSE_0040
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svgparse interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGPARSE_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGPARSE_0040 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageParse/imageParse02')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGPARSE_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGPARSE_0050
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svgparse interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGPARSE_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGPARSE_0050 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageParse/imageParse03')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGPARSE_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGPARSE_0060
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svgparse interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGPARSE_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGPARSE_0060 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageParse/imageParse04')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGPARSE_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGPARSE_0070
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svgparse interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGPARSE_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGPARSE_0070 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageParse/imageParse05')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGPARSE_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGPARSE_0080
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svgparse interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGPARSE_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGPARSE_0080 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageParse/imageParse06')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGPARSE_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGPARSE_0090
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svgparse interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGPARSE_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGPARSE_0090 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageParse/imageParse07')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGPARSE_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGPARSE_0110
     * @tc.name   : Image with svg
     * @tc.desc   : Verify media Image svgparse interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGPARSE_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGPARSE_0110 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageParse/imageParse08')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVGPARSE_0110 finish.`);
      done()
    })
  })
}