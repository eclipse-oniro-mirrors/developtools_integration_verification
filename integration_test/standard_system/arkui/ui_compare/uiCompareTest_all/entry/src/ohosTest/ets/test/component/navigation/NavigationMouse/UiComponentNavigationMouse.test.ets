/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, afterEach, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import Utils from '../../../model/Utils'
import { Driver, ON, MouseButton } from '@kit.TestKit'
import windowSnap from '../../../model/snapShot'

export default function uiComponentNavigationMouse() {
  describe('uiComponentNavigationMouse', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        done()
        return
      }
      Settings.windowClass.destroyWindow((err) => {
        if (err.code) {
          return;
        }
      })
      await Utils.sleep(500);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAVIGATION_MOUSE_0050
     * @tc.name   : Navigation scenario drag out of hot area
     * @tc.desc   : Verify navigation mouse interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAVIGATION_MOUSE_0050', Level.LEVEL3, async (done: Function) => {
      // 步骤1：打开测试页面，创建Navigation组件
      Settings.createWindow('testability/pages/component/navigation/NavigationMouse/UiComponentNavigationMouse0050')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：点击"切换双栏"按钮，切换到双栏模式
      let btn_split_column_0050 = await driver.waitForComponent(ON.id('btn_split_column_0050'), 500)
      await btn_split_column_0050.click()
      await Utils.sleep(500)

      let navigation_mouse_0050 = await driver.waitForComponent(ON.id('navigation_mouse_0050'), 500)
      await Utils.sleep(500)

      // 步骤3：截取初始状态，验证双栏模式显示正常
      // await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_NAVIGATION_MOUSE_0050_01")
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      // 步骤4：获取Navigation组件边界，计算分割线位置
      let navigation_mouse_0050_bounds = await navigation_mouse_0050.getBounds()
      let navigation_mouse_0050_divider_x = Math.floor(navigation_mouse_0050_bounds.left + 360)
      let navigation_mouse_0050_divider_y = Math.floor((navigation_mouse_0050_bounds.top + navigation_mouse_0050_bounds.bottom) / 2)

      // 步骤5：长按鼠标并拖拽分割线至热区外（拖动出组件边界）
      await driver.mouseDrag(
        { x: navigation_mouse_0050_divider_x, y: navigation_mouse_0050_divider_y },
        { x: navigation_mouse_0050_bounds.right + 100, y: navigation_mouse_0050_divider_y },
        1500
      )
      await Utils.sleep(1000)

      // 步骤6：截图验证，拖拽过程中及拖动至热区外后鼠标样式保持不变
      // await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_NAVIGATION_MOUSE_0050_02")
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAVIGATION_MOUSE_0020
     * @tc.name   : Navigation scenario single and double column switching
     * @tc.desc   : Verify navigation mouse interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAVIGATION_MOUSE_0020', Level.LEVEL3, async (done: Function) => {
      // 步骤1：打开测试页面，创建Navigation组件
      Settings.createWindow('testability/pages/component/navigation/NavigationMouse/UiComponentNavigationMouse0020')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：点击"切换双栏"按钮，切换到双栏模式
      let btn_split_column_0020 = await driver.waitForComponent(ON.id('btn_split_column_0020'), 500)
      await btn_split_column_0020.click()
      await Utils.sleep(500)

      let navigation_mouse_0020 = await driver.waitForComponent(ON.id('navigation_mouse_0020'), 500)
      await Utils.sleep(500)

      // 步骤3：获取Navigation组件边界，计算分割线位置
      let navigation_mouse_0020_bounds = await navigation_mouse_0020.getBounds()
      let navigation_mouse_0020_divider_x = Math.floor(navigation_mouse_0020_bounds.left + 358)
      let navigation_mouse_0020_divider_y = Math.floor((navigation_mouse_0020_bounds.top + navigation_mouse_0020_bounds.bottom) / 2)

      // 步骤4：移动鼠标到分割线位置并点击，触发分割线交互
      await driver.mouseMoveTo({ x: navigation_mouse_0020_divider_x, y: navigation_mouse_0020_divider_y })
      await Utils.sleep(300)
      await driver.mouseClick({ x: navigation_mouse_0020_divider_x, y: navigation_mouse_0020_divider_y, displayId: 0 }, MouseButton.MOUSE_BUTTON_LEFT)
      await Utils.sleep(500)

      // 步骤5：截图验证，鼠标点击分割线时样式变更
      // await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_NAVIGATION_MOUSE_0020_01")
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      // 步骤6：点击"切换单栏"按钮，切换到单栏模式
      let btn_single_column_0020 = await driver.waitForComponent(ON.id('btn_single_column_0020'), 500)
      await btn_single_column_0020.click()
      await Utils.sleep(500)

      // 步骤7：截图验证，切换到单栏后鼠标样式恢复正常
      // await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_NAVIGATION_MOUSE_0020_02")
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAVIGATION_MOUSE_0040
     * @tc.name   : Navigation scenario drag stop
     * @tc.desc   : Verify navigation mouse interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAVIGATION_MOUSE_0040', Level.LEVEL3, async (done: Function) => {
      // 步骤1：打开测试页面，创建Navigation组件
      Settings.createWindow('testability/pages/component/navigation/NavigationMouse/UiComponentNavigationMouse0040')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：点击"切换双栏"按钮，切换到双栏模式
      let btn_split_column_0040 = await driver.waitForComponent(ON.id('btn_split_column_0040'), 500)
      await btn_split_column_0040.click()
      await Utils.sleep(500)

      let navigation_mouse_0040 = await driver.waitForComponent(ON.id('navigation_mouse_0040'), 500)
      await Utils.sleep(500)

      // 步骤3：获取Navigation组件边界，计算分割线位置
      let navigation_mouse_0040_bounds = await navigation_mouse_0040.getBounds()
      let navigation_mouse_0040_divider_x = Math.floor(navigation_mouse_0040_bounds.left + 358)
      let navigation_mouse_0040_divider_y = Math.floor((navigation_mouse_0040_bounds.top + navigation_mouse_0040_bounds.bottom) / 2)

      // 步骤4：移动鼠标到分割线位置
      await driver.mouseMoveTo({ x: navigation_mouse_0040_divider_x, y: navigation_mouse_0040_divider_y })
      await Utils.sleep(500)

      // 步骤5：截图验证，鼠标放置分割线时样式变更
      // await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_NAVIGATION_MOUSE_0040_01")
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      // 步骤6：长按鼠标拖拽分割线
      await driver.mouseDrag(
        { x: navigation_mouse_0040_divider_x, y: navigation_mouse_0040_divider_y },
        { x: navigation_mouse_0040_divider_x + 150, y: navigation_mouse_0040_divider_y },
        1000
      )
      await Utils.sleep(500)

      // 步骤7：拖动过程中松开鼠标左键，然后移动鼠标到分割线外的位置
      await driver.mouseMoveTo({ x: navigation_mouse_0040_divider_x + 200, y: navigation_mouse_0040_divider_y })
      await Utils.sleep(500)

      // 步骤8：截图验证，松开后鼠标离开分割线区域样式恢复正常
      // await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_NAVIGATION_MOUSE_0040_02")
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAVIGATION_MOUSE_0090
     * @tc.name   : sidebarcontainer scenario drag stop
     * @tc.desc   : Verify navigation mouse interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAVIGATION_MOUSE_0090', Level.LEVEL3, async (done: Function) => {
      // 步骤1：打开测试页面，创建SideBarContainer组件
      Settings.createWindow('testability/pages/component/navigation/NavigationMouse/UiComponentNavigationMouse0090')
      let driver = await Driver.create()
      await Utils.sleep(500)

      let sidebar_container_mouse_0090 = await driver.waitForComponent(ON.id('sidebar_container_mouse_0090'), 500)
      await Utils.sleep(500)

      // 步骤2：获取SideBarContainer组件边界，计算分割线位置
      let sidebar_container_mouse_0090_bounds = await sidebar_container_mouse_0090.getBounds()
      let sidebar_container_mouse_0090_divider_x = Math.floor(sidebar_container_mouse_0090_bounds.left + 300)
      let sidebar_container_mouse_0090_divider_y = Math.floor((sidebar_container_mouse_0090_bounds.top + sidebar_container_mouse_0090_bounds.bottom) / 2)

      // 步骤3：移动鼠标到分割线位置
      await driver.mouseMoveTo({ x: sidebar_container_mouse_0090_divider_x, y: sidebar_container_mouse_0090_divider_y })
      await Utils.sleep(500)

      // 步骤4：截图验证，鼠标放置分割线时样式变更
      // await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_NAVIGATION_MOUSE_0090_01")
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      // 步骤5：长按鼠标拖拽分割线
      await driver.mouseDrag(
        { x: sidebar_container_mouse_0090_divider_x, y: sidebar_container_mouse_0090_divider_y },
        { x: sidebar_container_mouse_0090_divider_x + 50, y: sidebar_container_mouse_0090_divider_y },
        1000
      )
      await Utils.sleep(500)

      // 步骤6：拖动过程中松开鼠标左键，然后移动鼠标到分割线外的位置
      await driver.mouseMoveTo({ x: sidebar_container_mouse_0090_divider_x + 100, y: sidebar_container_mouse_0090_divider_y })
      await Utils.sleep(500)

      // 步骤7：截图验证，松开后鼠标离开分割线区域样式恢复正常
      // await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_NAVIGATION_MOUSE_0090_02")
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAVIGATION_MOUSE_0100
     * @tc.name   : sidebarcontainer scenario drag out of hot area
     * @tc.desc   : Verify navigation mouse interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAVIGATION_MOUSE_0100', Level.LEVEL3, async (done: Function) => {
      // 步骤1：打开测试页面，创建SideBarContainer组件
      Settings.createWindow('testability/pages/component/navigation/NavigationMouse/UiComponentNavigationMouse0100')
      let driver = await Driver.create()
      await Utils.sleep(500)

      let sidebar_container_mouse_0100 = await driver.waitForComponent(ON.id('sidebar_container_mouse_0100'), 500)
      await Utils.sleep(500)

      // 步骤2：获取SideBarContainer组件边界，计算分割线位置
      let sidebar_container_mouse_0100_bounds = await sidebar_container_mouse_0100.getBounds()
      let sidebar_container_mouse_0100_divider_x = Math.floor(sidebar_container_mouse_0100_bounds.left + 300)
      let sidebar_container_mouse_0100_divider_y = Math.floor((sidebar_container_mouse_0100_bounds.top + sidebar_container_mouse_0100_bounds.bottom) / 2)

      // 步骤3：移动鼠标到分割线位置
      await driver.mouseMoveTo({ x: sidebar_container_mouse_0100_divider_x, y: sidebar_container_mouse_0100_divider_y })
      await Utils.sleep(500)

      // 步骤4：截图验证，鼠标放置分割线时样式变更
      // await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_NAVIGATION_MOUSE_0100_01")
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      // 步骤5：长按鼠标拖拽分割线至热区外（拖动出组件边界）
      await driver.mouseDrag(
        { x: sidebar_container_mouse_0100_divider_x, y: sidebar_container_mouse_0100_divider_y },
        { x: sidebar_container_mouse_0100_bounds.right + 100, y: sidebar_container_mouse_0100_divider_y },
        1500
      )
      await Utils.sleep(1000)

      // 步骤6：截图验证，拖拽过程中及拖动至热区外后鼠标样式保持不变
      // await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_NAVIGATION_MOUSE_0100_02")
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      done();
    })

  })
}