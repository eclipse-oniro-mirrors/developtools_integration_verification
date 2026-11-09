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
import Settings from '../../../../../../test/model/Settings.ets'
import windowSnap from '../../../../../../test/model/snapShot.ets'
import Logger from '../../../../../../test/model/Logger.ts'
import Utils from '../../../../../../test/model/Utils.ets'
import { Driver, ON, Component } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit'

export default function imageThumbNailsTest () {

  describe('imageThumbNailsTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0029
     * @tc.name   : image test rotate、translate、scale
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0029', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0029 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageThumbNails/imageThumbNails01')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0029 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0027
     * @tc.name   : image test rotate、translate、scale
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0027', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0027 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageThumbNails/imageThumbNails02')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button: Component = await driver.waitForComponent(ON.id('imageThumbNails02'), 1000);
      await button.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0027 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0025
     * @tc.name   : image test alt without src
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0025', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0025 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageThumbNails/imageThumbNails03')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0025 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0031
     * @tc.name   : image test rotate、translate、scale with landScape
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0031', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0031 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageThumbNails/imageThumbNails04')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await Settings.changeWindowOrientation('end');
      await Utils.sleep(600)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0031 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0030
     * @tc.name   : image test rotate、translate、scale with clip
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0030 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageThumbNails/imageThumbNails05')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0023
     * @tc.name   : image test rotate、translate、scale with change image
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0023', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0023 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageThumbNails/imageThumbNails06')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('imageThumbNails06'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0023_01')
      await Utils.sleep(1000)
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0023_02')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0023 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0020
     * @tc.name   : image test rotate、translate、scale with matchTextDirection
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0020 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageThumbNails/imageThumbNails07')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0023
     * @tc.name   : image test rotate、translate、scale with change image
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0023', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0023 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageThumbNails/imageThumbNails08')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('imageThumbNails08'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0023_01')
      await Utils.sleep(1000)
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0023_02')
      await Utils.sleep(1000)
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0023_03')
      await Utils.sleep(1000)
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0023_04')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0023 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0028
     * @tc.name   : image test rotate、translate、scale with orientation
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0028', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0028 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageThumbNails/imageThumbNails09')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0028 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0026
     * @tc.name   : image test rotate、translate、scale and change
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0026', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0026 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageThumbNails/imageThumbNails10')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0026 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0024
     * @tc.name   : image test rotate、translate、scale in PixelMap
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0024', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0024 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageThumbNails/imageThumbNails11')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0024 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0032
     * @tc.name   : image test different rotate、translate、scale in PixelMap
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0032', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0032 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageThumbNails/imageThumbNails13')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('imageThumbNails13_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id('imageThumbNails13_02'), 1000);
      let button3: Component = await driver.waitForComponent(ON.id('imageThumbNails13_03'), 1000);
      let button4: Component = await driver.waitForComponent(ON.id('imageThumbNails13_04'), 1000);

      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0032_01')
      await Utils.sleep(1000)

      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0032_02')
      await Utils.sleep(1000)

      await button3.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0032_03')
      await Utils.sleep(1000)

      await button4.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0032_04')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0032 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0012
     * @tc.name   : image test translate、scale in combine
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0012', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0012 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageThumbNails/imageThumbNails15')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('imageThumbNails15'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0012 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0018
     * @tc.name   : image test translate、scale with undefined
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0018', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0018 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageThumbNails/imageThumbNails16')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0018 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0021
     * @tc.name   : image test translate、rotate、autoResize
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0021', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0021 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageThumbNails/imageThumbNails17')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0021 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0011
     * @tc.name   : image test only set matrix
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0011', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0011 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageThumbNails/imageThumbNails18')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0011 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0010
     * @tc.name   : image test only set objectFit(ImageFit.MATRIX)
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0010 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageThumbNails/imageThumbNails19')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0022
     * @tc.name   : image test rotate、translate、scale with ImageRotateOrientation.AUTO
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0022', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0022 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageThumbNails/imageThumbNails20')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0022 finish.`);
      done()
    })
  })
}