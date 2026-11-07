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

export default function popupboxInverse() {

  describe('popupboxInverse', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_INVERSE_0280
     * @tc.name   : Verify that the second MenuItem in a menuItemGroup nested within MenuItem has a top margin of 20.
     * @tc.desc   : Verify popupbox inverse interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_INVERSE_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_INVERSE_0280 start.`);
      // 步骤0：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxInverse/PopupboxInverse0280')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤1：点击button
      let menubutton = await driver.waitForComponent(ON.id('PopupboxMenu0020_001'), 2000)
      await menubutton.click()
      await Utils.sleep(500)
      // 步骤2：查看菜单样式，预期：弹出菜单，菜单分组中第二个菜单项和第一个菜单项距离为20
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_INVERSE_0280 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_INVERSE_0290
     * @tc.name   : Verify that the second MenuItem in a menuItemGroup nested within MenuItem has a bottom margin of 20.
     * @tc.desc   : Verify popupbox inverse interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_INVERSE_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_INVERSE_0290 start.`);
      // 步骤0：打开页面
      Settings.createWindow('testability/pages/component/popup/PopupboxInverse/PopupboxInverse0290')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤1：点击button
      let menubutton = await driver.waitForComponent(ON.id('PopupboxInverse0290_001'), 2000)
      await menubutton.click()
      await Utils.sleep(500)
      // 步骤2：查看菜单样式，预期：弹出菜单，菜单分组中第二个菜单项和第三个菜单项距离为20
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_INVERSE_0290 finish.`);
      done()
    })


  })
}