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

export default function progressModifierColor() {

  describe('progressModifierColor', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0013
     * @tc.name   : Information Progress modifier color
     * @tc.desc   : Verify information Progress modifier color interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0013', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0013 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressModifierColor/ProgressModifierColor0013')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressModifierColor0013_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressModifierColor0013_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('ProgressModifierColor0013_003'),1000);
      await Button3.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0013 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0014
     * @tc.name   : Information Progress modifier color
     * @tc.desc   : Verify information Progress modifier color interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0014', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0014 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressModifierColor/ProgressModifierColor0014')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressModifierColor0014_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressModifierColor0014_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('ProgressModifierColor0014_003'),1000);
      await Button3.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0014 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0015
     * @tc.name   : Information Progress modifier color
     * @tc.desc   : Verify information Progress modifier color interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0015', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0015 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressModifierColor/ProgressModifierColor0015')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressModifierColor0015_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressModifierColor0015_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('ProgressModifierColor0015_003'),1000);
      await Button3.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0015 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0016
     * @tc.name   : Information Progress modifier color
     * @tc.desc   : Verify information Progress modifier color interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0016', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0016 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressModifierColor/ProgressModifierColor0016')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressModifierColor0016_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressModifierColor0016_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('ProgressModifierColor0016_003'),1000);
      await Button3.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0016 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0017
     * @tc.name   : Information Progress modifier color
     * @tc.desc   : Verify information Progress modifier color interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0017', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0017 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressModifierColor/ProgressModifierColor0017')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressModifierColor0017_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressModifierColor0017_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('ProgressModifierColor0017_003'),1000);
      await Button3.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0017 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0018
     * @tc.name   : Information Progress modifier color
     * @tc.desc   : Verify information Progress modifier color interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0018', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0018 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressModifierColor/ProgressModifierColor0018')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressModifierColor0018_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressModifierColor0018_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('ProgressModifierColor0018_003'),1000);
      await Button3.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0018 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0019
     * @tc.name   : Information Progress modifier color
     * @tc.desc   : Verify information Progress modifier color interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0019', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0019 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressModifierColor/ProgressModifierColor0019')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressModifierColor0019_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressModifierColor0019_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('ProgressModifierColor0019_003'),1000);
      await Button3.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0019 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0020
     * @tc.name   : Information Progress modifier color
     * @tc.desc   : Verify information Progress modifier color interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0020', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0020 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressModifierColor/ProgressModifierColor0020')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressModifierColor0020_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressModifierColor0020_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('ProgressModifierColor0020_003'),1000);
      await Button3.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0020 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0021
     * @tc.name   : Information Progress modifier color
     * @tc.desc   : Verify information Progress modifier color interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0021', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0021 start.`);
      Settings.createWindow('testability/pages/component/progress/ProgressModifierColor/ProgressModifierColor0021')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ProgressModifierColor0021_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ProgressModifierColor0021_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('ProgressModifierColor0021_003'),1000);
      await Button3.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_MODIFIER_COLOR_0021 finish.`);
      done()
    })




  })
}