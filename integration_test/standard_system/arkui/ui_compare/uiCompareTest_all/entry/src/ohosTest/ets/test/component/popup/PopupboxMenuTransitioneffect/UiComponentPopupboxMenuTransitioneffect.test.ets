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

export default function uiComponentPopupboxMenuTransitioneffect() {
  describe('uiComponentPopupboxMenuTransitioneffect', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_TRANSITIONEFFECT_0010
     * @tc.name   : bindContextMenu sets asymmetric transition animation, appears from the left edge and disappears from the right edge
     * @tc.desc   : Verify popupbox menu transitioneffect interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_TRANSITIONEFFECT_0010', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxMenuTransitioneffect/UiComponentPopupboxMenuTransitioneffect0010')
      await Utils.sleep(500)
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：长按"opacity_move"按钮（完整非对称动画）
      let button_opacity_move_0010 = await driver.waitForComponent(ON.id('button_opacity_move_0010'), 2000)
      await button_opacity_move_0010.longClick()
      await Utils.sleep(3100)

      // 预期效果：弹出菜单，组件转场透明度效果为0.5，从窗口左边缘出现，动画持续3秒
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_TRANSITIONEFFECT_0010_01')
      await Utils.sleep(500)

      // 步骤2：点击空白区域
      await driver.click(100, 100)
      await Utils.sleep(3100)

      // 预期效果：菜单消失，组件转场透明度效果为0.5，从窗口右边缘消失，动画持续3秒
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_TRANSITIONEFFECT_0010_02')
      await Utils.sleep(500)
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_TRANSITIONEFFECT_0100
     * @tc.name   : bindMenu sets combined transition animation (opacity + translate)
     * @tc.desc   : Verify popupbox menu transitioneffect interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_TRANSITIONEFFECT_0100', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxMenuTransitioneffect/UiComponentPopupboxMenuTransitioneffect0100')
      await Utils.sleep(500)
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击"opacity_translate"按钮（完整组合动画）
      let button_opacity_translate_0100 = await driver.waitForComponent(ON.id('button_opacity_translate_0100'), 2000)
      await button_opacity_translate_0100.click()
      await Utils.sleep(3100)

      // 预期效果：弹出菜单，组件转场透明度效果为0.5，平移效果（横向、纵向、竖向各10vp），动画持续3秒
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_TRANSITIONEFFECT_0100_01')
      await Utils.sleep(500)

      // 步骤2：点击空白区域
      await driver.click(100, 100)
      await Utils.sleep(3100)

      // 预期效果：菜单消失，效果同上
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_TRANSITIONEFFECT_0100_02')
      await Utils.sleep(500)
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_TRANSITIONEFFECT_0140
     * @tc.name   : menu does not set animation, preview sets animation
     * @tc.desc   : Verify popupbox menu transitioneffect interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_TRANSITIONEFFECT_0140', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxMenuTransitioneffect/UiComponentPopupboxMenuTransitioneffect0140')
      await Utils.sleep(500)
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：长按"Preview设置动画"按钮（有preview有动画）
      let button_preview_animation_0140 = await driver.waitForComponent(ON.id('button_preview_animation_0140'), 2000)
      await button_preview_animation_0140.longClick()
      await Utils.sleep(3100)

      // 预期效果：弹出菜单和预览图，组件转场透明度效果为0.5，menu无动画，预览图动画时长3秒
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_TRANSITIONEFFECT_0140_01')
      await Utils.sleep(500)

      // 步骤2：点击空白区域
      await driver.click(100, 100)
      await Utils.sleep(3100)

      // 预期效果：菜单和预览图消失，组件转场透明度效果为0.5，menu无动画，预览图动画时长3秒
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_TRANSITIONEFFECT_0140_02')
      await Utils.sleep(500)
      done();
    })
  })
}