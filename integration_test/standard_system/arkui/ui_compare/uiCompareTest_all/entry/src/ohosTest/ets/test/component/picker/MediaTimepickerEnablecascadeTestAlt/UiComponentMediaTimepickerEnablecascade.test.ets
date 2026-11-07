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
import { Driver, ON, Component,} from '@kit.TestKit';

export default function uiComponentMediaTimepickerEnablecascade() {

  describe('uiComponentMediaTimepickerEnablecascade', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0016
     * @tc.name   : enableCascade: true, TimePicker_ Initialize time scene, "Initialization Time" -17:00:00
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0016', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0016 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnablecascadeAlt2/UiComponentMediaTimepickerEnablecascade0016')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let TimePicker = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnablecascade0016_001'), 1000);  // 显式等待组件出现[6](@ref)
      await TimePicker.click()
      await driver.waitForIdle(500,2000)
      let Button_1 = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnablecascade0016_002'), 1000);  // 显式等待组件出现[6](@ref)
      await Button_1.click()
      await driver.waitForIdle(500,2000)
      let Button_2 = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnablecascade0016_003'), 1000);  // 显式等待组件出现[6](@ref)
      await Button_2.click()
      await driver.waitForIdle(500,2000)
      windowSnap.screenShot();
      await Utils.sleep(1000);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0017
     * @tc.name   : enableCascade: true, TimePicker_ Initialize time scene, "Initialization Time" -12:00:00
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0017', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0017 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnablecascadeAlt2/UiComponentMediaTimepickerEnablecascade0017')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let TimePicker = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnablecascade0017_001'), 1000);  // 显式等待组件出现[6](@ref)
      await TimePicker.click()
      await driver.waitForIdle(500,2000)
      let Button_1 = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnablecascade0017_002'), 1000);  // 显式等待组件出现[6](@ref)
      await Button_1.click()
      await driver.waitForIdle(500,2000)
      let Button_2 = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnablecascade0017_003'), 1000);  // 显式等待组件出现[6](@ref)
      await Button_2.click()
      await driver.waitForIdle(500,2000)
      windowSnap.screenShot();
      await Utils.sleep(1000);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0014
     * @tc.name   : enableCascade: true, TimePicker_ Initialize time scene, "Initialization Time" -00:00:00
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0014', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0014 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnablecascadeAlt2/UiComponentMediaTimepickerEnablecascade0014')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let TimePicker = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnablecascade0014_001'), 1000);  // 显式等待组件出现[6](@ref)
      await TimePicker.click()
      await driver.waitForIdle(500,2000)
      let Button_1 = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnablecascade0014_002'), 1000);  // 显式等待组件出现[6](@ref)
      await Button_1.click()
      await driver.waitForIdle(500,2000)
      let Button_2 = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnablecascade0014_003'), 1000);  // 显式等待组件出现[6](@ref)
      await Button_2.click()
      await driver.waitForIdle(500,2000)
      windowSnap.screenShot();
      await Utils.sleep(1000);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0015
     * @tc.name   : enableCascade: true, TimePicker_ Initialize time scene, "Initialization Time" -07:00:00
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0015', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0015 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnablecascadeAlt2/UiComponentMediaTimepickerEnablecascade0015')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let TimePicker = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnablecascade0015_001'), 1000);  // 显式等待组件出现[6](@ref)
      await TimePicker.click()
      await driver.waitForIdle(500,2000)
      let Button_1 = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnablecascade0015_002'), 1000);  // 显式等待组件出现[6](@ref)
      await Button_1.click()
      await driver.waitForIdle(500,2000)
      let Button_2 = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnablecascade0015_003'), 1000);  // 显式等待组件出现[6](@ref)
      await Button_2.click()
      await driver.waitForIdle(500,2000)
      windowSnap.screenShot();
      await Utils.sleep(1000);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0025
     * @tc.name   : enableCascade: false, TimePicker_ Initialize time scene, "Initialization Time" -00:00:00
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0025', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0025 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnablecascadeAlt2/UiComponentMediaTimepickerEnablecascade0025')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let TimePicker = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnablecascade0025_001'), 1000);  // 显式等待组件出现[6](@ref)
      await TimePicker.click()
      await driver.waitForIdle(500,2000)
      let Button_1 = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnablecascade0025_002'), 1000);  // 显式等待组件出现[6](@ref)
      await Button_1.click()
      await driver.waitForIdle(500,2000)
      let Button_2 = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnablecascade0025_003'), 1000);  // 显式等待组件出现[6](@ref)
      await Button_2.click()
      await driver.waitForIdle(500,2000)
      windowSnap.screenShot();
      await Utils.sleep(1000);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0027
     * @tc.name   : enableCascade: false, TimePicker_ Initialization time scene, "Initialization time" -17:00:00
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0027', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0027 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnablecascadeAlt2/UiComponentMediaTimepickerEnablecascade0027')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let TimePicker = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnablecascade0027_001'), 1000);  // 显式等待组件出现[6](@ref)
      await TimePicker.click()
      await driver.waitForIdle(500,2000)
      let Button_1 = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnablecascade0027_002'), 1000);  // 显式等待组件出现[6](@ref)
      await Button_1.click()
      await driver.waitForIdle(500,2000)
      let Button_2 = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnablecascade0027_003'), 1000);  // 显式等待组件出现[6](@ref)
      await Button_2.click()
      await driver.waitForIdle(500,2000)
      windowSnap.screenShot();
      await Utils.sleep(1000);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0026
     * @tc.name   : enableCascade: false, TimePicker_ Initialization time scene, "Initialization Time" -07:00:00
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0026', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0026 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnablecascadeAlt2/UiComponentMediaTimepickerEnablecascade0026')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let TimePicker = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnablecascade0026_001'), 1000);  // 显式等待组件出现[6](@ref)
      await TimePicker.click()
      await driver.waitForIdle(500,2000)
      let Button_1 = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnablecascade0026_002'), 1000);  // 显式等待组件出现[6](@ref)
      await Button_1.click()
      await driver.waitForIdle(500,2000)
      let Button_2 = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnablecascade0026_003'), 1000);  // 显式等待组件出现[6](@ref)
      await Button_2.click()
      await driver.waitForIdle(500,2000)
      windowSnap.screenShot();
      await Utils.sleep(1000);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0028
     * @tc.name   : enableCascade: false, TimePicker_ Initialization time scene, "Initialization Time" -12:00:00
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0028', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0028 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnablecascadeAlt2/UiComponentMediaTimepickerEnablecascade0028')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let TimePicker = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnablecascade0028_001'), 1000);  // 显式等待组件出现[6](@ref)
      await TimePicker.click()
      await driver.waitForIdle(500,2000)
      let Button_1 = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnablecascade0028_002'), 1000);  // 显式等待组件出现[6](@ref)
      await Button_1.click()
      await driver.waitForIdle(500,2000)
      let Button_2 = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnablecascade0028_003'), 1000);  // 显式等待组件出现[6](@ref)
      await Button_2.click()
      await driver.waitForIdle(500,2000)
      windowSnap.screenShot();
      await Utils.sleep(1000);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0038
     * @tc.name   : enableCascade: true, TimePickerDialog_ Initialize time scene, "Initialization Time" -00:00:00
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0038', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0038 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnablecascadeAlt2/UiComponentMediaTimepickerEnablecascade0038')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let Button_1 = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnablecascade0038_001'), 1000);  // 显式等待组件出现[6](@ref)
      await Button_1.click()
      await driver.waitForIdle(500,2000)
      windowSnap.screenShot();
      await Utils.sleep(1000);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0039
     * @tc.name   : enableCascade: true, TimePickerDialog_ Initialization time scene, "Initialization Time" -07:00:00
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0039', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0039 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnablecascadeAlt2/UiComponentMediaTimepickerEnablecascade0039')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let Button_1 = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnablecascade0039_001'), 1000);  // 显式等待组件出现[6](@ref)
      await Button_1.click()
      await driver.waitForIdle(500,2000)
      windowSnap.screenShot();
      await Utils.sleep(1000);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0041
     * @tc.name   : enableCascade: true, TimePickerDialog_ Initialization time scene, "Initialization Time" -07:00:00
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0041', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0041 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnablecascadeAlt2/UiComponentMediaTimepickerEnablecascade0041')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let Button_1 = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnablecascade0041_001'), 1000);  // 显式等待组件出现[6](@ref)
      await Button_1.click()
      await driver.waitForIdle(500,2000)
      windowSnap.screenShot();
      await Utils.sleep(1000);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0040
     * @tc.name   : enableCascade: true, TimePickerDialog_ Initialization time scenario, "Initialization Time" -17:00:00
     * @tc.desc   : Verify media TimePicker enablecascade interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0040', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_ENABLECASCADE_0040 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerEnablecascadeAlt2/UiComponentMediaTimepickerEnablecascade0040')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let Button_1 = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnablecascade0040_001'), 1000);  // 显式等待组件出现[6](@ref)
      await Button_1.click()
      await driver.waitForIdle(500,2000)
      windowSnap.screenShot();
      await Utils.sleep(1000);
      done();
    })
  })
}