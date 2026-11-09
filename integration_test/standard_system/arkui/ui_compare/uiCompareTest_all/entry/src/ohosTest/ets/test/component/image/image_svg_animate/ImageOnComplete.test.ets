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

export default function imageOnCompleteTest () {

  describe('imageOnCompleteTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONCOMPLETE_0015
     * @tc.name   : Image with onComplete
     * @tc.desc   : Verify media Image oncomplete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONCOMPLETE_0015', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONCOMPLETE_0015 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageOnComplete/imageOnComplete01')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      let button: Component = await driver.waitForComponent(ON.id('imageModifier01'), 1000);
      await button.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONCOMPLETE_0015 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONCOMPLETE_0018
     * @tc.name   : Image with onComplete
     * @tc.desc   : Verify media Image oncomplete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONCOMPLETE_0018', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONCOMPLETE_0018 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageOnComplete/imageOnComplete04')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      let button1: Component = await driver.waitForComponent(ON.id('imageOnComplete04_01'), 1000);
      await button1.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button2: Component = await driver.waitForComponent(ON.id('imageOnComplete04_02'), 1000);
      await button2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONCOMPLETE_0018 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONCOMPLETE_0019
     * @tc.name   : Image with onComplete
     * @tc.desc   : Verify media Image oncomplete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONCOMPLETE_0019', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONCOMPLETE_0019 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageOnComplete/imageOnComplete05')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await Settings.changeWindowOrientation('landScape');
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await Settings.changeWindowOrientation('end');
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONCOMPLETE_0019 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONCOMPLETE_0020
     * @tc.name   : Image with onComplete
     * @tc.desc   : Verify media Image oncomplete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONCOMPLETE_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONCOMPLETE_0020 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageOnComplete/imageOnComplete06')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await Settings.changeWindowOrientation('landScape');
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await Settings.changeWindowOrientation('end');
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONCOMPLETE_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONCOMPLETE_0024
     * @tc.name   : Image with onComplete
     * @tc.desc   : Verify media Image oncomplete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONCOMPLETE_0024', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONCOMPLETE_0024 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageOnComplete/imageOnComplete07')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONCOMPLETE_0024 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONCOMPLETE_0016
     * @tc.name   : Image with onComplete
     * @tc.desc   : Verify media Image oncomplete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONCOMPLETE_0016', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONCOMPLETE_0016 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageOnComplete/imageOnComplete08')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONCOMPLETE_0016 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONCOMPLETE_0031
     * @tc.name   : Image with onComplete
     * @tc.desc   : Verify media Image oncomplete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONCOMPLETE_0031', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONCOMPLETE_0031 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageOnComplete/imageOnComplete09')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      let button1: Component = await driver.waitForComponent(ON.id('imageOnComplete09_01'), 1000);
      await button1.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button2: Component = await driver.waitForComponent(ON.id('imageOnComplete09_02'), 1000);
      await button2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONCOMPLETE_0031 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0013
     * @tc.name   : Image with auto size
     * @tc.desc   : Verify media Image size interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0013', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0013 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageOnComplete/imageOnComplete10')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SIZE_0013 finish.`);
      done()
    })
  })
}