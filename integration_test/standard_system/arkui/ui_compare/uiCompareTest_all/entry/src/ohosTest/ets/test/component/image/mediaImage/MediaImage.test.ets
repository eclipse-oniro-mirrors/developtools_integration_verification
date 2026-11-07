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

export default function mediaImageTest() {

  describe('mediaImageTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_BORDER_0010
     * @tc.name   : Media Image border
     * @tc.desc   : Verify media Image border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_BORDER_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_BORDER_0010 start.`);
      Settings.createWindow('testability/pages/component/image/mediaImage/mediaImage01')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_BORDER_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_FOCUSABLE_0022
     * @tc.name   : Media Image focusable
     * @tc.desc   : Verify media Image focusable interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_FOCUSABLE_0022', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_FOCUSABLE_0022 start.`);
      Settings.createWindow('testability/pages/component/image/mediaImage/mediaImage02')
      let driver:Driver = Driver.create();
      await driver.triggerKey(2049);
      await driver.waitForIdle(200,500);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.triggerKey(2049);
      await driver.waitForIdle(200,500);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.triggerKey(2049);
      await driver.waitForIdle(200,500);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_FOCUSABLE_0022 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_FOCUSABLE_0024
     * @tc.name   : Media Image focusable
     * @tc.desc   : Verify media Image focusable interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_FOCUSABLE_0024', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_FOCUSABLE_0024 start.`);
      Settings.createWindow('testability/pages/component/image/mediaImage/mediaImage03')
      let driver:Driver = Driver.create();
      await driver.triggerKey(2049);
      await driver.waitForIdle(200,500);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.triggerKey(2049);
      await driver.waitForIdle(200,500);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.triggerKey(2049);
      await driver.waitForIdle(200,500);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_FOCUSABLE_0024 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_FOCUSABLE_0010
     * @tc.name   : Media Image focusable
     * @tc.desc   : Verify media Image focusable interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_FOCUSABLE_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_FOCUSABLE_0010 start.`);
      Settings.createWindow('testability/pages/component/image/mediaImage/mediaImage04')
      let driver:Driver = Driver.create();
      await driver.triggerKey(2049);
      await driver.waitForIdle(200,500);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.triggerKey(2049);
      await driver.waitForIdle(200,500);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.triggerKey(2049);
      await driver.waitForIdle(200,500);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_FOCUSABLE_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_FOCUSABLE_0016
     * @tc.name   : Media Image focusable
     * @tc.desc   : Verify media Image focusable interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_FOCUSABLE_0016', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_FOCUSABLE_0016 start.`);
      Settings.createWindow('testability/pages/component/image/mediaImage/mediaImage05')
      let driver:Driver = Driver.create();
      await driver.triggerKey(2049);
      await driver.waitForIdle(200,500);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.triggerKey(2049);
      await driver.waitForIdle(200,500);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.triggerKey(2049);
      await driver.waitForIdle(200,500);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_FOCUSABLE_0016 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_FILLCOLOR_0010
     * @tc.name   : Media Image fillcolor
     * @tc.desc   : Verify media Image fillcolor interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_FILLCOLOR_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_FILLCOLOR_0010 start.`);
      Settings.createWindow('testability/pages/component/image/mediaImage/mediaImage06')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      let button: Component = await driver.findComponent(ON.id('changeFillColor'));
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_FILLCOLOR_0010 finish.`);
      done()
    })
  })
}