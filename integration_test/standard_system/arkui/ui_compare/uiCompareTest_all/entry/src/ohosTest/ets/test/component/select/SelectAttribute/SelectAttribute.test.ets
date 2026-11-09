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

export default function selectAttribute() {

  describe('selectAttribute', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SELECT_ATTRIBUTE_0600
     * @tc.name   : 深色模式下，select视觉显示符合UX规范
     * @tc.desc   : Verify button select attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_ATTRIBUTE_0600', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_ATTRIBUTE_0600 start.`);
      Settings.createWindow('testability/pages/component/select/SelectAttribute/SelectAttribute0600')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      let selectbutton = await driver.waitForComponent(ON.id('SelectAttribute0600_002'), 2000)
      await selectbutton.click()
      await Utils.sleep(500)
      await selectbutton.click()
      await Utils.sleep(500)
      let themebutton = await driver.waitForComponent(ON.id('SelectAttribute0600_001'), 2000)
      await themebutton.click()
      await Utils.sleep(500)
      await selectbutton.click()
      await Utils.sleep(500)
      await selectbutton.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_ATTRIBUTE_0600 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SELECT_ATTRIBUTE_0700
     * @tc.name   : 浅色模式下，select视觉显示符合UX规范
     * @tc.desc   : Verify button select attribute interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SELECT_ATTRIBUTE_0700', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_ATTRIBUTE_0700 start.`);
      Settings.createWindow('testability/pages/component/select/SelectAttribute/SelectAttribute0700')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      let selectbutton = await driver.waitForComponent(ON.id('SelectAttribute0700_002'), 2000)
      await selectbutton.click()
      await Utils.sleep(500)
      await selectbutton.click()
      await Utils.sleep(500)
      let themebutton = await driver.waitForComponent(ON.id('SelectAttribute0700_001'), 2000)
      await themebutton.click()
      await Utils.sleep(500)
      await selectbutton.click()
      await Utils.sleep(500)
      await selectbutton.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SELECT_ATTRIBUTE_0700 finish.`);
      done()
    })




  })
}