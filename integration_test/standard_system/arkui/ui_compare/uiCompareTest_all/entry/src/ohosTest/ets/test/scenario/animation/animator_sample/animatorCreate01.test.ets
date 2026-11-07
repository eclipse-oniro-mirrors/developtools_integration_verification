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

export default function animatorCreate01Test() {

  describe('animatorCreate01Test', () => {
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
     * @tc.number : SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0040
     * @tc.name   : Test the missing optional parameters for the 'delay' method in the ohos.animator simple constructor.
     * @tc.desc   : Verify ohos animator simple create interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0040 start.`);
      Settings.createWindow('testability/pages/scenario/animation/animator_sample/animator01')
      let driver:Driver = Driver.create();
      for (let i = 0; i < 3; i++) {
        const str = `SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0040_${(i+1).toString().padStart(2, '0')}`;
        let buttonCreate: Component = await driver.waitForComponent(ON.id('create01'), 1000);
        await buttonCreate.click();
        let buttonPlay: Component = await driver.waitForComponent(ON.id('play01'), 1000);
        await buttonPlay.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot(str)
        await driver.waitForIdle(500,2000);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0020
     * @tc.name   : Test the missing optional parameters for the 'duration' method in the ohos.animator simple constructor.
     * @tc.desc   : Verify ohos animator simple create interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0020 start.`);
      Settings.createWindow('testability/pages/scenario/animation/animator_sample/animator02')
      let driver:Driver = Driver.create();
      for (let i = 0; i < 5; i++) {
        const str = `SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0020_${(i+1).toString().padStart(2, '0')}`;
        let buttonCreate: Component = await driver.waitForComponent(ON.id('create02'), 1000);
        await buttonCreate.click();
        let buttonPlay: Component = await driver.waitForComponent(ON.id('play02'), 1000);
        await buttonPlay.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot(str)
        await Utils.sleep(1000)
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0090
     * @tc.name   : Test the missing optional parameters for the 'delay' method when two optional parameters are missing in the ohos.animator simple constructor.
     * @tc.desc   : Verify ohos animator simple create interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0090 start.`);
      Settings.createWindow('testability/pages/scenario/animation/animator_sample/animator03')
      let driver:Driver = Driver.create();
      for (let i = 0; i < 3; i++) {
        const str = `SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0090_${(i+1).toString().padStart(2, '0')}`;
        let buttonCreate: Component = await driver.waitForComponent(ON.id('create03'), 1000);
        await buttonCreate.click();
        let buttonPlay: Component = await driver.waitForComponent(ON.id('play03'), 1000);
        await buttonPlay.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot(str)
        await driver.waitForIdle(500,2000);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0070
     * @tc.name   : Test the missing optional parameters for the 'duration' method when two optional parameters are missing in the ohos.animator simple constructor.
     * @tc.desc   : Verify ohos animator simple create interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0070 start.`);
      Settings.createWindow('testability/pages/scenario/animation/animator_sample/animator04')
      let driver:Driver = Driver.create();
      for (let i = 0; i < 10; i++) {
        const str = `SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0070_${(i+1).toString().padStart(2, '0')}`;
        let buttonCreate: Component = await driver.waitForComponent(ON.id('create04'), 1000);
        await buttonCreate.click();
        let buttonPlay: Component = await driver.waitForComponent(ON.id('play04'), 1000);
        await buttonPlay.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot(str)
        await driver.waitForIdle(500,2000);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0010
     * @tc.name   : Test the missing optional parameter alone in the ohos.animator simple constructor.
     * @tc.desc   : Verify ohos animator simple create interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0010 start.`);
      Settings.createWindow('testability/pages/scenario/animation/animator_sample/animator05')
      let driver:Driver = Driver.create();
      for (let i = 0; i < 6; i++) {
        const str = `SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0010_${(i+1).toString().padStart(2, '0')}`;
        let buttonCreate: Component = await driver.waitForComponent(ON.id('create05'), 1000);
        await buttonCreate.click();
        let buttonPlay: Component = await driver.waitForComponent(ON.id('play05'), 1000);
        await buttonPlay.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot(str)
        await driver.waitForIdle(500,2000);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0160
     * @tc.name   : Test the ohos.animator simple constructor with all optional parameters missing.
     * @tc.desc   : Verify ohos animator simple create interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0160 start.`);
      Settings.createWindow('testability/pages/scenario/animation/animator_sample/animator06')
      let driver:Driver = Driver.create();
      for (let i = 0; i < 1; i++) {
        const str = `SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0160_${(i+1).toString().padStart(2, '0')}`;
        let buttonCreate: Component = await driver.waitForComponent(ON.id('create06'), 1000);
        await buttonCreate.click();
        let buttonPlay: Component = await driver.waitForComponent(ON.id('play06'), 1000);
        await buttonPlay.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot(str)
        await driver.waitForIdle(500,2000);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_OHOS_ANIMATOR_SIMPLE_CREATE_0160 finish.`);
      done()
    })
  })
}
