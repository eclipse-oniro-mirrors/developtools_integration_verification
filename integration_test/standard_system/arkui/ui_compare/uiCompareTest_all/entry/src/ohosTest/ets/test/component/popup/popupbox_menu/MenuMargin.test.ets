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

export default function menuMarginTest() {
  describe('menuMarginTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err: BusinessError) => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0010
     * @tc.name   : Popupbox menu margin
     * @tc.desc   : Verify popupbox menu margin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0010 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuMargin01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 长按触发菜单
      let imageComponent: Component = await driver.waitForComponent(ON.id('menu_image_01'), 1000);
      await imageComponent.longClick();
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0010')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0020
     * @tc.name   : Popupbox menu margin
     * @tc.desc   : Verify popupbox menu margin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0020 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuMargin02')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 长按触发菜单
      let imageComponent: Component = await driver.waitForComponent(ON.id('menu_image_02'), 1000);
      await imageComponent.longClick();
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0020')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0030
     * @tc.name   : Popupbox menu margin
     * @tc.desc   : Verify popupbox menu margin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0030 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuMargin03')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 长按触发菜单
      let imageComponent: Component = await driver.waitForComponent(ON.id('menu_image_03'), 1000);
      await imageComponent.longClick();
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0030')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0040
     * @tc.name   : Popupbox menu margin
     * @tc.desc   : Verify popupbox menu margin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0040 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuMargin04')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 长按触发菜单
      let imageComponent: Component = await driver.waitForComponent(ON.id('menu_image_04'), 1000);
      await imageComponent.longClick();
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0040')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0050
     * @tc.name   : Popupbox menu margin
     * @tc.desc   : Verify popupbox menu margin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0050 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuMargin05')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 长按触发菜单
      let imageComponent: Component = await driver.waitForComponent(ON.id('menu_image_05'), 1000);
      await imageComponent.longClick();
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0050')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0060
     * @tc.name   : Popupbox menu margin
     * @tc.desc   : Verify popupbox menu margin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0060 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuMargin06')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 长按触发菜单
      let imageComponent: Component = await driver.waitForComponent(ON.id('menu_image_06'), 1000);
      await imageComponent.longClick();
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0060')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0070
     * @tc.name   : Popupbox menu margin
     * @tc.desc   : Verify popupbox menu margin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0070 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuMargin07')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 长按触发菜单
      let imageComponent: Component = await driver.waitForComponent(ON.id('menu_image_07'), 1000);
      await imageComponent.longClick();
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0070')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0080
     * @tc.name   : Popupbox menu margin
     * @tc.desc   : Verify popupbox menu margin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0080 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuMargin08')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 长按触发菜单
      let imageComponent: Component = await driver.waitForComponent(ON.id('menu_image_08'), 1000);
      await imageComponent.longClick();
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0080')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0090
     * @tc.name   : Popupbox menu margin
     * @tc.desc   : Verify popupbox menu margin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0090 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuMargin09')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 长按触发菜单
      let imageComponent: Component = await driver.waitForComponent(ON.id('menu_image_09'), 1000);
      await imageComponent.longClick();
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0090_portrait')
      await Utils.sleep(1000)

      // 切换到横屏
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0090_landscape')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0100
     * @tc.name   : Popupbox menu margin
     * @tc.desc   : Verify popupbox menu margin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0100 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuMargin10')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 长按触发菜单
      let imageComponent: Component = await driver.waitForComponent(ON.id('menu_image_10'), 1000);
      await imageComponent.longClick();
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0100_portrait')
      await Utils.sleep(1000)

      // 切换到横屏
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0100_landscape')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0110
     * @tc.name   : Popupbox menu margin
     * @tc.desc   : Verify popupbox menu margin interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0110 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_menu/menuMargin11')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 长按触发菜单
      let imageComponent: Component = await driver.waitForComponent(ON.id('menu_image_11'), 1000);
      await imageComponent.longClick();
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0110_portrait')
      await Utils.sleep(1000)

      // 切换到横屏
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0110_landscape')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_MARGIN_0110 finish.`);
      done()
    })
  })
}
