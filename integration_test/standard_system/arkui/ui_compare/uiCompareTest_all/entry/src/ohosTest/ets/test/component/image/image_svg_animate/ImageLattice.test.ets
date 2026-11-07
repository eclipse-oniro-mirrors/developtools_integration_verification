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

export default function imageLatticeTest () {

  describe('imageLatticeTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_LATTICE_0016
     * @tc.name   : Image with Lattice
     * @tc.desc   : Verify media Image lattice interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_LATTICE_0016', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_LATTICE_0016 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLattice/imageLattice01')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_LATTICE_0016 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_LATTICE_0010
     * @tc.name   : Image with Lattice
     * @tc.desc   : Verify media Image lattice interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_LATTICE_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_LATTICE_0010 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLattice/imageLattice02')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_LATTICE_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_LATTICE_0011
     * @tc.name   : Image with Lattice
     * @tc.desc   : Verify media Image lattice interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_LATTICE_0011', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_LATTICE_0011 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLattice/imageLattice03')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_LATTICE_0011 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_LATTICE_0015
     * @tc.name   : Image with Lattice
     * @tc.desc   : Verify media Image lattice interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_LATTICE_0015', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_LATTICE_0015 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLattice/imageLattice05')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_LATTICE_0015 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_LATTICE_0020
     * @tc.name   : Image with Lattice
     * @tc.desc   : Verify media Image lattice interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_LATTICE_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_LATTICE_0020 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLattice/imageLattice06')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_LATTICE_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_LATTICE_0012
     * @tc.name   : Image with Lattice
     * @tc.desc   : Verify media Image lattice interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_LATTICE_0012', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_LATTICE_0012 start.`);
      Settings.createWindow('testability/pages/component/image/image_svg_animate/imageLattice/imageLattice08')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(200,500);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_LATTICE_0012 finish.`);
      done()
    })
  })
}