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

export default function componentOutliersTest() {

  describe('componentOutliersTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTIMER_OUTLIERS_0056
     * @tc.name   : A column nests a column1 component. The column sets width 100 and height 200. The column1 first
     * @tc.desc   : Verify media textimer outlier parameters interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTIMER_OUTLIERS_0056', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTIMER_OUTLIERS_0056 start.`);
      Settings.createWindow('testability/pages/scenario/misc/component_outliers/textTimer01')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('TextTimer_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button2: Component = await driver.waitForComponent(ON.id('TextTimer_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      let button3: Component = await driver.waitForComponent(ON.id('TextTimer_03'), 1000);
      await button3.click();
      await driver.waitForIdle(500,2000);
      let button4: Component = await driver.waitForComponent(ON.id('TextTimer_04'), 1000);
      await button4.click();
      await driver.waitForIdle(500,2000);
      let button5: Component = await driver.waitForComponent(ON.id('TextTimer_05'), 1000);
      await button5.click();
      await driver.waitForIdle(500,2000);
      let button6: Component = await driver.waitForComponent(ON.id('TextTimer_06'), 1000);
      await button6.click();
      await driver.waitForIdle(500,2000);
      let button7: Component = await driver.waitForComponent(ON.id('TextTimer_07'), 1000);
      await button7.click();
      await driver.waitForIdle(500,2000);
      let button8: Component = await driver.waitForComponent(ON.id('TextTimer_08'), 1000);
      await button8.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTIMER_OUTLIERS_0056')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTIMER_OUTLIERS_0056 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTCLOCK_OUTLIERS_0074
     * @tc.name   : A column nests a column1 component. The column sets width 100 and height 200. The column1 first
     * @tc.desc   : Verify media TextClock outlier parameters interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTCLOCK_OUTLIERS_0074', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTCLOCK_OUTLIERS_0074 start.`);
      Settings.createWindow('testability/pages/scenario/misc/component_outliers/textClock01')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('TextClock_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button2: Component = await driver.waitForComponent(ON.id('TextClock_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      let button3: Component = await driver.waitForComponent(ON.id('TextClock_03'), 1000);
      await button3.click();
      await driver.waitForIdle(500,2000);
      let button4: Component = await driver.waitForComponent(ON.id('TextClock_04'), 1000);
      await button4.click();
      await driver.waitForIdle(500,2000);
      let button5: Component = await driver.waitForComponent(ON.id('TextClock_05'), 1000);
      await button5.click();
      await driver.waitForIdle(500,2000);
      let button6: Component = await driver.waitForComponent(ON.id('TextClock_06'), 1000);
      await button6.click();
      await driver.waitForIdle(500,2000);
      let button7: Component = await driver.waitForComponent(ON.id('TextClock_07'), 1000);
      await button7.click();
      await driver.waitForIdle(500,2000);
      let button8: Component = await driver.waitForComponent(ON.id('TextClock_08'), 1000);
      await button8.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_TEXTCLOCK_OUTLIERS_0074')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTCLOCK_OUTLIERS_0074 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0040
     * @tc.name   : A column nests a column1 component. The column sets width 100 and height 200. The column1 first
     * @tc.desc   : Verify media PatternLock outlier parameters interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0040 start.`);
      Settings.createWindow('testability/pages/scenario/misc/component_outliers/patternLock01')
      let driver:Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('PatternLock_01'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      let button2: Component = await driver.waitForComponent(ON.id('PatternLock_02'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      let button3: Component = await driver.waitForComponent(ON.id('PatternLock_03'), 1000);
      await button3.click();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('PatternLock_001'), 1000);
      await button01.click();
      await driver.waitForIdle(500,2000);
      let button4: Component = await driver.waitForComponent(ON.id('PatternLock_04'), 1000);
      await button4.click();
      await driver.waitForIdle(500,2000);
      let button5: Component = await driver.waitForComponent(ON.id('PatternLock_05'), 1000);
      await button5.click();
      await driver.waitForIdle(500,2000);
      let button02: Component = await driver.waitForComponent(ON.id('PatternLock_002'), 1000);
      await button02.click();
      await driver.waitForIdle(500,2000);
      let button6: Component = await driver.waitForComponent(ON.id('PatternLock_06'), 1000);
      await button6.click();
      await driver.waitForIdle(500,2000);
      let button7: Component = await driver.waitForComponent(ON.id('PatternLock_07'), 1000);
      await button7.click();
      let button03: Component = await driver.waitForComponent(ON.id('PatternLock_003'), 1000);
      await button03.click();
      await driver.waitForIdle(500,2000);
      let button8: Component = await driver.waitForComponent(ON.id('PatternLock_08'), 1000);
      await button8.click();
      await driver.waitForIdle(500,2000);
      let button9: Component = await driver.waitForComponent(ON.id('PatternLock_09'), 1000);
      await button9.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0040')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PATTERNLOCK_OUTLIERS_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_GAUGE_OUTLIERS_0010
     * @tc.name   : Media gauge outlier parameters
     * @tc.desc   : Verify media gauge outlier parameters interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_GAUGE_OUTLIERS_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_GAUGE_OUTLIERS_0010 start.`);
      Settings.createWindow('testability/pages/scenario/misc/component_outliers/guage01')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_GAUGE_OUTLIERS_0010 finish.`);
      done()
    })
  })
}
