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

export default function imageOpacityTest () {

  describe('imageOpacityTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OPACITY_0016
     * @tc.name   : Image with modifier
     * @tc.desc   : Verify media Image opacity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OPACITY_0016', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OPACITY_0016 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageOpacity/imageOpacity01')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('imageOpacity01_02'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button: Component = await driver.waitForComponent(ON.id('imageOpacity01_01'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OPACITY_0016 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OPACITY_0019
     * @tc.name   : Image with modifier
     * @tc.desc   : Verify media Image opacity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OPACITY_0019', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OPACITY_0019 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageOpacity/imageOpacity02')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('imageOpacity02_02'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id('imageOpacity02_03'), 1000);
      let button3: Component = await driver.waitForComponent(ON.id('imageOpacity02_04'), 1000);
      let button4: Component = await driver.waitForComponent(ON.id('imageOpacity02_05'), 1000);

      let button: Component = await driver.waitForComponent(ON.id('imageOpacity02_01'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button3.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button4.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)

      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OPACITY_0019 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OPACITY_0020
     * @tc.name   : Image with modifier
     * @tc.desc   : Verify media Image opacity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OPACITY_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OPACITY_0020 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageOpacity/imageOpacity03')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('imageOpacity03_02'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id('imageOpacity03_03'), 1000);
      let button3: Component = await driver.waitForComponent(ON.id('imageOpacity03_04'), 1000);
      let button4: Component = await driver.waitForComponent(ON.id('imageOpacity03_05'), 1000);
      let button5: Component = await driver.waitForComponent(ON.id('imageOpacity03_06'), 1000);

      let button: Component = await driver.waitForComponent(ON.id('imageOpacity03_01'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button3.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button4.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button5.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)

      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OPACITY_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OPACITY_0021
     * @tc.name   : Image with modifier
     * @tc.desc   : Verify media Image opacity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OPACITY_0021', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OPACITY_0021 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageOpacity/imageOpacity04')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('imageOpacity04_02'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id('imageOpacity04_03'), 1000);
      let button3: Component = await driver.waitForComponent(ON.id('imageOpacity04_04'), 1000);
      let button4: Component = await driver.waitForComponent(ON.id('imageOpacity04_05'), 1000);

      let button: Component = await driver.waitForComponent(ON.id('imageOpacity04_01'), 1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button3.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button4.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)

      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OPACITY_0021 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OPACITY_0023
     * @tc.name   : Image with modifier
     * @tc.desc   : Verify media Image opacity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OPACITY_0023', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OPACITY_0023 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageOpacity/imageOpacity05')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OPACITY_0023 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OPACITY_0024
     * @tc.name   : Image with modifier
     * @tc.desc   : Verify media Image opacity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OPACITY_0024', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OPACITY_0024 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageOpacity/imageOpacity06')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OPACITY_0024 finish.`);
      done()
    })
  })
}