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

export default function imageObjectFitTest () {

  describe('imageObjectFitTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0017
     * @tc.name   : image test objectFit in PixelMap
     * @tc.desc   : Verify media Image objectfit align interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0017', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0017 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageObjectFit/imageObjectFit01')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0017_01')
      await Utils.sleep(1000)
      let button1: Component = await driver.waitForComponent(ON.id('imageObjectFit01_01'), 1000);
      await button1.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0017_02')
      await Utils.sleep(1000)

      let button2: Component = await driver.waitForComponent(ON.id('imageObjectFit01_02'), 1000);
      await button2.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0017_03')
      await Utils.sleep(1000)

      let button3: Component = await driver.waitForComponent(ON.id('imageObjectFit01_03'), 1000);
      await button3.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0017_04')
      await Utils.sleep(1000)

      let button4: Component = await driver.waitForComponent(ON.id('imageObjectFit01_04'), 1000);
      await button4.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0017_05')
      await Utils.sleep(1000)

      let button5: Component = await driver.waitForComponent(ON.id('imageObjectFit01_05'), 1000);
      await button5.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0017_06')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0017 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0020
     * @tc.name   : image test ImageFit.TOP_START
     * @tc.desc   : Verify media Image objectfit align interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0020 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageObjectFit/imageObjectFit02')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0015
     * @tc.name   : image test default ImageFit
     * @tc.desc   : Verify media Image objectfit align interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0015', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0015 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageObjectFit/imageObjectFit03')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0015 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0016
     * @tc.name   : image test objectFit in PixelMap
     * @tc.desc   : Verify media Image objectfit align interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0016', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0016 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageObjectFit/imageObjectFit04')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0016_01')
      await Utils.sleep(1000)
      let button1: Component = await driver.waitForComponent(ON.id('imageObjectFit04_01'), 1000);
      await button1.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0016_02')
      await Utils.sleep(1000)

      let button2: Component = await driver.waitForComponent(ON.id('imageObjectFit04_02'), 1000);
      await button2.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0016_03')
      await Utils.sleep(1000)

      let button3: Component = await driver.waitForComponent(ON.id('imageObjectFit04_03'), 1000);
      await button3.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0016_04')
      await Utils.sleep(1000)

      let button4: Component = await driver.waitForComponent(ON.id('imageObjectFit04_04'), 1000);
      await button4.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0016_05')
      await Utils.sleep(1000)

      let button5: Component = await driver.waitForComponent(ON.id('imageObjectFit04_05'), 1000);
      await button5.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0016_06')
      await Utils.sleep(1000)

      let button6: Component = await driver.waitForComponent(ON.id('imageObjectFit04_06'), 1000);
      await button6.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0016_07')
      await Utils.sleep(1000)

      let button7: Component = await driver.waitForComponent(ON.id('imageObjectFit04_07'), 1000);
      await button7.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0016_08')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0016 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0018
     * @tc.name   : image test objectFit with undefined and null
     * @tc.desc   : Verify media Image objectfit align interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0018', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0018 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageObjectFit/imageObjectFit05')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0018_01')
      await Utils.sleep(1000)
      let button1: Component = await driver.waitForComponent(ON.id('imageObjectFit05_01'), 1000);
      await button1.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0018_02')
      await Utils.sleep(1000)

      let button2: Component = await driver.waitForComponent(ON.id('imageObjectFit05_02'), 1000);
      await button2.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0018_03')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0018 finish.`);
      done()
    })
  })
}