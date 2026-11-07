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

import { describe, it, afterEach, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON } from '@kit.TestKit'
import windowSnap from '../../../model/snapShot'

export default function uiComponentPopupboxMenuUiextension() {
  describe('uiComponentPopupboxMenuUiextension', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        done()
        return
      }
      Settings.windowClass.destroyWindow((err) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window.Cause :${JSON.stringify(err)}`)
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window`);
      })
      await Utils.sleep(1000);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_UIEXTENSION_0020
     * @tc.name   : Verify that when preview is not set or MenuPreviewMode is set to NULL, subMenuExpandingMode is set to side_expand, the primary and secondary menus of bindContextMenu can be displayed normally in UIExtension
     * @tc.desc   : Verify popupbox menu uiextension interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_UIEXTENSION_0020', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxMenuUiextension/UiComponentPopupboxMenuUiextension0020')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：不设置preview或MenuPreviewMode设置为NULL，subMenuExpandingMode设置为side_expand
      let button_menu_0020 = await driver.waitForComponent(ON.id('button_menu_0020'), 2000)
      await Utils.sleep(500)

      // 步骤2：长按按钮调起bindContextMenu
      await button_menu_0020.longClick()
      await Utils.sleep(1000)

      // 预期效果：无预览图，一级菜单能在UIExtension中正常调起并显示；菜单调起无蒙层
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_UIEXTENSION_0020_01')
      await Utils.sleep(1000)

      // 步骤3：点击菜单选项调起二级菜单
      let menu_item_2_0020 = await driver.waitForComponent(ON.id('menu_item_2_0020'), 2000)
      await menu_item_2_0020.click()
      await Utils.sleep(1000)

      // 预期效果：二级菜单以侧边展开方式正常显示
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_UIEXTENSION_0020_02')
      await Utils.sleep(1000)
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_UIEXTENSION_0030
     * @tc.name   : Verify that when preview is not set or MenuPreviewMode is set to NULL, subMenuExpandingMode is set to side_expand, bindContextMenu display is controlled by isShow, the primary and secondary menus of bindContextMenu can be displayed normally in UIExtension
     * @tc.desc   : Verify popupbox menu uiextension interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_UIEXTENSION_0030', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxMenuUiextension/UiComponentPopupboxMenuUiextension0030')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：不设置preview或MenuPreviewMode设置为NULL，subMenuExpandingMode设置为side_expand
      let button_menu_0030 = await driver.waitForComponent(ON.id('button_menu_0030'), 2000)
      await Utils.sleep(500)

      // 步骤2：通过isShow控制bindContextMenu的显隐，进而调起bindContextMenu
      await button_menu_0030.click()
      await Utils.sleep(1000)

      // 预期效果：无预览图，一级菜单能在UIExtension中正常调起并显示；菜单调起无蒙层
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_UIEXTENSION_0030_01')
      await Utils.sleep(1000)

      // 步骤3：点击菜单选项调起二级菜单
      let menu_item_2_0030 = await driver.waitForComponent(ON.id('menu_item_2_0030'), 2000)
      await menu_item_2_0030.click()
      await Utils.sleep(1000)

      // 预期效果：二级菜单以侧边展开方式正常显示
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_UIEXTENSION_0030_02')
      await Utils.sleep(1000)
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_UIEXTENSION_0040
     * @tc.name   : Verify that when preview is not set or MenuPreviewMode is set to NULL, subMenuExpandingMode is set to stack_expand, the primary and secondary menus of bindContextMenu can be displayed normally in UIExtension
     * @tc.desc   : Verify popupbox menu uiextension interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_UIEXTENSION_0040', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxMenuUiextension/UiComponentPopupboxMenuUiextension0040')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：不设置preview或MenuPreviewMode设置为NULL，subMenuExpandingMode设置为stack_expand
      let button_menu_0040 = await driver.waitForComponent(ON.id('button_menu_0040'), 2000)
      await Utils.sleep(500)

      // 步骤2：长按按钮调起bindContextMenu
      await button_menu_0040.longClick()
      await Utils.sleep(1000)

      // 预期效果：无预览图，一级菜单能在UIExtension中正常调起并显示；菜单调起无蒙层
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_UIEXTENSION_0040_01')
      await Utils.sleep(1000)

      // 步骤3：点击菜单选项调起二级菜单
      let menu_item_2_0040 = await driver.waitForComponent(ON.id('menu_item_2_0040'), 2000)
      await menu_item_2_0040.click()
      await Utils.sleep(1000)

      // 预期效果：二级菜单以嵌入式展开方式正常显示
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_UIEXTENSION_0040_02')
      await Utils.sleep(1000)
      done();
    })
  })
}