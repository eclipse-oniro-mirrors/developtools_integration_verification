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

export default function specialComponentsEmbeddedComponentMinSize0170() {

  describe('specialComponentsEmbeddedComponentMinSize0170', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err) => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_EMBEDDCOMPONENT_MINSIZE_0170
     * @tc.name   : Special components embeddcomponent minsize
     * @tc.desc   : Verify special components embeddcomponent minsize interface behavior and expected UI result for this case.
     * @tc.type   : Set the width and height of the EmbeddedComponent (initialize both width and height to 15vp), and dynamically modify the component's width and height.
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_EMBEDDCOMPONENT_MINSIZE_0170', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_EMBEDDCOMPONENT_MINSIZE_0170 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsEmbeddedComponentMinSize/SpecialComponentsEmbeddedComponentMinSize0170')
      let driver:Driver = Driver.create();
      await driver.triggerKey(2049);
      await driver.waitForIdle(500,2000)
      let buttonA: Component = await driver.waitForComponent(ON.id('SpecialComponentsEmbeddedComponentMinSize0170_002'),1000);
      await buttonA.click();
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2049);
      await driver.waitForIdle(500,2000)
      let buttonB: Component = await driver.waitForComponent(ON.id('SpecialComponentsEmbeddedComponentMinSize0170_003'),1000);
      await buttonB.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_EMBEDDCOMPONENT_MINSIZE_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_EMBEDDCOMPONENT_MINSIZE_0020
     * @tc.name   : Special components embeddcomponent minsize
     * @tc.desc   : Verify special components embeddcomponent minsize interface behavior and expected UI result for this case.
     * @tc.type   : Set the width and height of the EmbeddedComponent to 10vp.
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_EMBEDDCOMPONENT_MINSIZE_0020', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_EMBEDDCOMPONENT_MINSIZE_0020 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsEmbeddedComponentMinSize/SpecialComponentsEmbeddedComponentMinSize0020')
      let driver:Driver = Driver.create();
      await driver.triggerKey(2049);
      await driver.waitForIdle(500,2000)
      let buttonA: Component = await driver.waitForComponent(ON.id('SpecialComponentsEmbeddedComponentMinSize0020_002'),1000);
      await buttonA.click();
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2049);
      await driver.waitForIdle(500,2000)
      let buttonB: Component = await driver.waitForComponent(ON.id('SpecialComponentsEmbeddedComponentMinSize0020_003'),1000);
      await buttonB.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_EMBEDDCOMPONENT_MINSIZE_0020 finish.`);
      done()
    })

  })
}