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

export default function componentProgressLinear() {

  describe('componentProgressLinear', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0015
     * @tc.name   : Progress linear
     * @tc.desc   : Verify Progress linear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0015', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0015 start.`);
      Settings.createWindow('testability/pages/component/progress/ComponentProgressLinear/ComponentProgressLinear0015')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ComponentProgressLinear0015_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('ComponentProgressLinear0015_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('ComponentProgressLinear0015_003'),1000);
      await Button3.click();
      await driver.waitForIdle(500,2000)
      let Button4: Component = await driver.waitForComponent(ON.id('ComponentProgressLinear0015_004'),1000);
      await Button4.click();
      await driver.waitForIdle(500,2000)
      let Button5: Component = await driver.waitForComponent(ON.id('ComponentProgressLinear0015_005'),1000);
      await Button5.click();
      await driver.waitForIdle(500,2000)
      let Button6: Component = await driver.waitForComponent(ON.id('ComponentProgressLinear0015_006'),1000);
      await Button6.click();
      await driver.waitForIdle(500,2000)
      let Button7: Component = await driver.waitForComponent(ON.id('ComponentProgressLinear0015_007'),1000);
      await Button7.click();
      await driver.waitForIdle(500,2000)
      let Button8: Component = await driver.waitForComponent(ON.id('ComponentProgressLinear0015_008'),1000);
      await Button8.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0015 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0016
     * @tc.name   : Progress linear
     * @tc.desc   : Verify Progress linear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0016', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0016 start.`);
      Settings.createWindow('testability/pages/component/progress/ComponentProgressLinear/ComponentProgressLinear0016')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ComponentProgressLinear0016_type_001'),1000);
      let Button2: Component = await driver.waitForComponent(ON.id('ComponentProgressLinear0016_type_002'),1000);
      let Button3: Component = await driver.waitForComponent(ON.id('ComponentProgressLinear0016_type_003'),1000);
      let Button4: Component = await driver.waitForComponent(ON.id('ComponentProgressLinear0016_type_004'),1000);
      let Button5: Component = await driver.waitForComponent(ON.id('ComponentProgressLinear0016_type_005'),1000);
      let Button6: Component = await driver.waitForComponent(ON.id('ComponentProgressLinear0016_001'),1000);
      let Button7: Component = await driver.waitForComponent(ON.id('ComponentProgressLinear0016_002'),1000);
      let Button8: Component = await driver.waitForComponent(ON.id('ComponentProgressLinear0016_003'),1000);
      let Button9: Component = await driver.waitForComponent(ON.id('ComponentProgressLinear0016_004'),1000);
      let Button10: Component = await driver.waitForComponent(ON.id('ComponentProgressLinear0016_005'),1000);
      let Button11: Component = await driver.waitForComponent(ON.id('ComponentProgressLinear0016_get'),1000);
      let Button12: Component = await driver.waitForComponent(ON.id('ComponentProgressLinear0016_reset'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button6.click();
      await driver.waitForIdle(500,2000)
      await Button7.click();
      await driver.waitForIdle(500,2000)
      await Button8.click();
      await driver.waitForIdle(500,2000)
      await Button9.click();
      await driver.waitForIdle(500,2000)
      await Button10.click();
      await driver.waitForIdle(500,2000)
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      await Button6.click();
      await driver.waitForIdle(500,2000)
      await Button7.click();
      await driver.waitForIdle(500,2000)
      await Button8.click();
      await driver.waitForIdle(500,2000)
      await Button9.click();
      await driver.waitForIdle(500,2000)
      await Button10.click();
      await driver.waitForIdle(500,2000)
      await Button3.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      await Button6.click();
      await driver.waitForIdle(500,2000)
      await Button7.click();
      await driver.waitForIdle(500,2000)
      await Button8.click();
      await driver.waitForIdle(500,2000)
      await Button9.click();
      await driver.waitForIdle(500,2000)
      await Button10.click();
      await driver.waitForIdle(500,2000)
      await Button4.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      await Button6.click();
      await driver.waitForIdle(500,2000)
      await Button7.click();
      await driver.waitForIdle(500,2000)
      await Button8.click();
      await driver.waitForIdle(500,2000)
      await Button9.click();
      await driver.waitForIdle(500,2000)
      await Button10.click();
      await driver.waitForIdle(500,2000)
      await Button5.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      await Button6.click();
      await driver.waitForIdle(500,2000)
      await Button7.click();
      await driver.waitForIdle(500,2000)
      await Button8.click();
      await driver.waitForIdle(500,2000)
      await Button9.click();
      await driver.waitForIdle(500,2000)
      await Button10.click();
      await driver.waitForIdle(500,2000)
      await Button11.click();
      await driver.waitForIdle(500,2000)
      await Button12.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0016 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0017
     * @tc.name   : Progress linear
     * @tc.desc   : Verify Progress linear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0017', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0017 start.`);
      Settings.createWindow('testability/pages/component/progress/ComponentProgressLinear/ComponentProgressLinear0017')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ComponentProgressLinear0017_001'),1000);
      let Button2: Component = await driver.waitForComponent(ON.id('ComponentProgressLinear0017_002'),1000);
      let Button3: Component = await driver.waitForComponent(ON.id('ComponentProgressLinear0017_003'),1000);
      let Button4: Component = await driver.waitForComponent(ON.id('ComponentProgressLinear0017_004'),1000);
      let Button5: Component = await driver.waitForComponent(ON.id('ComponentProgressLinear0017_get'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button5.click();
      await driver.waitForIdle(500,2000)
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button5.click();
      await driver.waitForIdle(500,2000)
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await Button5.click();
      await driver.waitForIdle(500,2000)
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await Button5.click();
      await driver.waitForIdle(500,2000)
      await Button3.click();
      await driver.waitForIdle(500,2000)
      await Button5.click();
      await driver.waitForIdle(500,2000)
      await Button3.click();
      await driver.waitForIdle(500,2000)
      await Button5.click();
      await driver.waitForIdle(500,2000)
      await Button4.click();
      await driver.waitForIdle(500,2000)
      await Button5.click();
      await driver.waitForIdle(500,2000)
      await Button4.click();
      await driver.waitForIdle(500,2000)
      await Button5.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0017 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0018
     * @tc.name   : Progress linear
     * @tc.desc   : Verify Progress linear interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0018', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0018 start.`);
      Settings.createWindow('testability/pages/component/progress/ComponentProgressLinear/ComponentProgressLinear0018')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('ComponentProgressLinear0018_001'),1000);
      let Button2: Component = await driver.waitForComponent(ON.id('ComponentProgressLinear0018_002'),1000);
      let Button3: Component = await driver.waitForComponent(ON.id('ComponentProgressLinear0018_003'),1000);
      let Button4: Component = await driver.waitForComponent(ON.id('ComponentProgressLinear0018_004'),1000);
      let Button5: Component = await driver.waitForComponent(ON.id('ComponentProgressLinear0018_get'),1000);
      let Button6: Component = await driver.waitForComponent(ON.id('ComponentProgressLinear0018_reset'),1000);
      await Button5.click();
      await driver.waitForIdle(500,2000)
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button5.click();
      await driver.waitForIdle(500,2000)
      await Button1.click();
      await driver.waitForIdle(500,2000)
      await Button5.click();
      await driver.waitForIdle(500,2000)
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await Button5.click();
      await driver.waitForIdle(500,2000)
      await Button2.click();
      await driver.waitForIdle(500,2000)
      await Button5.click();
      await driver.waitForIdle(500,2000)
      await Button3.click();
      await driver.waitForIdle(500,2000)
      await Button5.click();
      await driver.waitForIdle(500,2000)
      await Button3.click();
      await driver.waitForIdle(500,2000)
      await Button5.click();
      await driver.waitForIdle(500,2000)
      await Button4.click();
      await driver.waitForIdle(500,2000)
      await Button5.click();
      await driver.waitForIdle(500,2000)
      await Button4.click();
      await driver.waitForIdle(500,2000)
      await Button5.click();
      await driver.waitForIdle(500,2000)
      await Button6.click();
      await driver.waitForIdle(500,2000)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_PROGRESS_LINEAR_0018 finish.`);
      done()
    })





  })
}