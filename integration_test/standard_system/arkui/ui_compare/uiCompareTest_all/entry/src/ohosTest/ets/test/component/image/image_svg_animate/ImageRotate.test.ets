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

export default function imageRotateTest () {

  describe('imageRotateTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ROTATE_0032
     * @tc.name   : Image with orientation
     * @tc.desc   : Verify media Image rotate interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ROTATE_0032', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ROTATE_0032 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageRotate/imageRotate01')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ROTATE_0032 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ROTATE_0019
     * @tc.name   : Image with orientation
     * @tc.desc   : Verify media Image rotate interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ROTATE_0019', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ROTATE_0019 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageRotate/imageRotate02')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ROTATE_0019 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ROTATE_0023
     * @tc.name   : Image with orientation
     * @tc.desc   : Verify media Image rotate interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ROTATE_0023', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ROTATE_0023 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageRotate/imageRotate03')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      let button: Component = await driver.waitForComponent(ON.id('imageRotate03'), 1000);
      await button.click();
      await driver.waitForIdle(200,500);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ROTATE_0023 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ROTATE_0021
     * @tc.name   : Image with orientation
     * @tc.desc   : Verify media Image rotate interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ROTATE_0021', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ROTATE_0021 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageRotate/imageRotate04')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button: Component = await driver.waitForComponent(ON.id('imageRotate04'), 1000);
      await button.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ROTATE_0021 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ROTATE_0028
     * @tc.name   : Image with orientation
     * @tc.desc   : Verify media Image rotate interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ROTATE_0028', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ROTATE_0028 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageRotate/imageRotate05')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button: Component = await driver.waitForComponent(ON.id('imageRotate05'), 1000);
      await button.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await Settings.changeWindowOrientation('end');
      await Utils.sleep(600)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ROTATE_0028 finish.`);
      done()
    })
  })
}