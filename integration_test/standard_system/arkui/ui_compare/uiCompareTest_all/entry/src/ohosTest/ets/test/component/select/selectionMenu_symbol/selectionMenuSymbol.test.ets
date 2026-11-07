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

export default function selectionMenuSymbolTest() {

  describe('selectionMenuSymbolTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_SELECTIONMENU_SYMBOLSTYLE_0020
     * @tc.name   : SelectionMenu component, setting symbolStyle property with resource input
     * @tc.desc   : Verify selectionmenu symbolstyle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SELECTIONMENU_SYMBOLSTYLE_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SELECTIONMENU_SYMBOLSTYLE_0020 start.`);
      Settings.createWindow('testability/pages/component/select/selectionMenu_symbol/selectionMenu01')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('selectionMenu01'), 1000);
      await button.doubleClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SELECTIONMENU_SYMBOLSTYLE_0020')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SELECTIONMENU_SYMBOLSTYLE_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SELECTIONMENU_SYMBOLSTYLE_0010
     * @tc.name   : SelectionMenu component, passing symbol resource to icon property
     * @tc.desc   : Verify selectionmenu symbolstyle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SELECTIONMENU_SYMBOLSTYLE_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SELECTIONMENU_SYMBOLSTYLE_0010 start.`);
      Settings.createWindow('testability/pages/component/select/selectionMenu_symbol/selectionMenu02')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('selectionMenu02'), 1000);
      await button.doubleClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SELECTIONMENU_SYMBOLSTYLE_0010')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SELECTIONMENU_SYMBOLSTYLE_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SELECTIONMENU_SYMBOLSTYLE_0050
     * @tc.name   : SelectionMenu component, passing symbol resource to icon property
     * @tc.desc   : Verify selectionmenu symbolstyle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SELECTIONMENU_SYMBOLSTYLE_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SELECTIONMENU_SYMBOLSTYLE_0050 start.`);
      Settings.createWindow('testability/pages/component/select/selectionMenu_symbol/selectionMenu03')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('selectionMenu03'), 1000);
      await button.doubleClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SELECTIONMENU_SYMBOLSTYLE_0050')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SELECTIONMENU_SYMBOLSTYLE_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SELECTIONMENU_SYMBOLSTYLE_0070
     * @tc.name   : SelectionMenu component, passing symbol resource to icon property
     * @tc.desc   : Verify selectionmenu symbolstyle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SELECTIONMENU_SYMBOLSTYLE_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SELECTIONMENU_SYMBOLSTYLE_0070 start.`);
      Settings.createWindow('testability/pages/component/select/selectionMenu_symbol/selectionMenu03')
      let driver:Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('selectionMenu03'), 1000);
      await button.doubleClick();
      await driver.waitForIdle(500,2000);
      let button1: Component = await driver.waitForComponent(ON.id('setUg'), 1000);
      await button1.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SELECTIONMENU_SYMBOLSTYLE_0070')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SELECTIONMENU_SYMBOLSTYLE_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SELECTIONMENU_SYMBOLSTYLE_0060
     * @tc.name   : SelectionMenu component, passing symbol resource to icon property
     * @tc.desc   : Verify selectionmenu symbolstyle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SELECTIONMENU_SYMBOLSTYLE_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SELECTIONMENU_SYMBOLSTYLE_0060 start.`);
      Settings.createWindow('testability/pages/component/select/selectionMenu_symbol/selectionMenu03')
      let driver:Driver = Driver.create();

      let button: Component = await driver.waitForComponent(ON.id('selectionMenu03'), 1000);
      await button.doubleClick();
      await driver.waitForIdle(500,2000);

      let button1: Component = await driver.waitForComponent(ON.id('setFontSize'), 1000);
      await button1.click();
      let button2: Component = await driver.waitForComponent(ON.id('setFontWeight'), 1000);
      await button2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SELECTIONMENU_SYMBOLSTYLE_0060')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SELECTIONMENU_SYMBOLSTYLE_0060 finish.`);
      done()
    })
  })
}