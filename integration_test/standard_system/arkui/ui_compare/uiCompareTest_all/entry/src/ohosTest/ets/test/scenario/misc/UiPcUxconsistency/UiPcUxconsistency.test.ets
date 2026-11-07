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

export default function uiPcUxconsistency() {
  describe('uiPcUxconsistency', () => {
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
     * @tc.number : SUB_ACE_UI_PC_UXCONSISTENCY_0150
     * @tc.name   : Dynamic switching showSideBar attribute focus loss gray display test
     * @tc.desc   : Verify pc uxconsistency interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_PC_UXCONSISTENCY_0150', Level.LEVEL3, async (done: Function) => {
      // 步骤1：创建 sidebarcontainer 组件
      Settings.createWindow('testability/pages/scenario/misc/UiPcUxconsistency/UiPcUxconsistency0150')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：动态切换 showSideBar 属性
      let toggleBtn = await driver.waitForComponent(ON.id('button_uxconsistency_0150'), 500)
      await toggleBtn.click()
      await Utils.sleep(500)
      let sidebarContainer = await driver.waitForComponent(ON.id('sidebarcontainer_uxconsistency_0150'), 500)


      // 步骤3：打开应用，点击桌面空白处
      let sidebarContainer_bounds = await sidebarContainer.getBounds()
      await driver.click(sidebarContainer_bounds.right-200,sidebarContainer_bounds.bottom-300)

      // 预期效果：showSideBar 属性为显示状态时，页面出现半透明灰色蒙层
      await windowSnap.snapShot('SUB_ACE_UI_PC_UXCONSISTENCY_0150_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_PC_UXCONSISTENCY_0130
     * @tc.name   : Sidebar with SideBarPosition.Start focus loss gray display test
     * @tc.desc   : Verify pc uxconsistency interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_PC_UXCONSISTENCY_0130', Level.LEVEL3, async (done: Function) => {
      // 步骤1：创建 sidebarcontainer 组件
      Settings.createWindow('testability/pages/scenario/misc/UiPcUxconsistency/UiPcUxconsistency0130')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：设置 SideBarPosition 为 Start
      let sidebarContainer = await driver.waitForComponent(ON.id('sidebarcontainer_uxconsistency_0130'), 500)
      await Utils.sleep(500)

      // 步骤3：打开应用，点击桌面空白处
      let sidebarContainer_bounds = await sidebarContainer.getBounds()
      await driver.click(sidebarContainer_bounds.right-200,sidebarContainer_bounds.bottom-300)
      // 预期效果：侧边栏所在区域出现半透明灰色蒙层
      await windowSnap.snapShot('SUB_ACE_UI_PC_UXCONSISTENCY_0130_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_PC_UXCONSISTENCY_0060
     * @tc.name   : NavBar focus loss gray display test when dragging to hide and show navigation bar
     * @tc.desc   : Verify pc uxconsistency interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_PC_UXCONSISTENCY_0060', Level.LEVEL3, async (done: Function) => {
      // 步骤1：创建 navigation 组件，默认窗口大小720x1220
      Settings.createWindow('testability/pages/scenario/misc/UiPcUxconsistency/UiPcUxconsistency0060')
      let driver = await Driver.create()
      await Utils.sleep(1000)

      // 步骤2：设置 NavigationMode 为 Auto，截图初始状态（导航栏显示）
      let navigation = await driver.waitForComponent(ON.id('navigation_uxconsistency_0060'), 500)
      await Utils.sleep(500)

      // 截图初始导航栏显示状态
      await windowSnap.snapShot('SUB_ACE_UI_PC_UXCONSISTENCY_0060_01')
      await Utils.sleep(1000)

      // 步骤3：从下向上缩小窗口到500x900（过渡状态）
      if (Settings.windowClass) {
        Settings.changeWindowSize(Settings.windowClass, 500, 900)
      }
      await Utils.sleep(1500)

      // 截图验证导航栏过渡状态
      await windowSnap.snapShot('SUB_ACE_UI_PC_UXCONSISTENCY_0060_02')
      await Utils.sleep(1000)

      // 步骤4：继续从下向上缩小窗口到360x600，导航栏完全消失
      if (Settings.windowClass) {
        Settings.changeWindowSize(Settings.windowClass, 360, 600)
      }
      await Utils.sleep(1500)

      // 预期效果：导航栏从显示半透明灰色蒙层状态过渡到完全消失状态
      await windowSnap.snapShot('SUB_ACE_UI_PC_UXCONSISTENCY_0060_03')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_PC_UXCONSISTENCY_0110
     * @tc.name   : Sidebar with showSideBar true focus loss gray display test
     * @tc.desc   : Verify pc uxconsistency interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_PC_UXCONSISTENCY_0110', Level.LEVEL3, async (done: Function) => {
      // 步骤1：创建 sidebarcontainer 组件
      Settings.createWindow('testability/pages/scenario/misc/UiPcUxconsistency/UiPcUxconsistency0110')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：设置 showSideBar 属性为 true
      let sidebarContainer = await driver.waitForComponent(ON.id('sidebarcontainer_uxconsistency_0110'), 500)
      await Utils.sleep(500)

      // 步骤3：打开应用，点击桌面空白处
      let sidebarContainer_bounds = await sidebarContainer.getBounds()
      await driver.click(sidebarContainer_bounds.right-200,sidebarContainer_bounds.bottom-300)
      // 预期效果：页面无侧边栏显示，且不出现半透明灰色蒙层
      await windowSnap.snapShot('SUB_ACE_UI_PC_UXCONSISTENCY_0110_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_PC_UXCONSISTENCY_0090
     * @tc.name   : Sidebar with SideBarContainerType.Embed focus loss gray display test
     * @tc.desc   : Verify pc uxconsistency interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_PC_UXCONSISTENCY_0090', Level.LEVEL3, async (done: Function) => {
      // 步骤1：创建 sidebarcontainer 组件
      Settings.createWindow('testability/pages/scenario/misc/UiPcUxconsistency/UiPcUxconsistency0090')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：设置 SideBarContainerType 为 Embed
      let sidebarContainer = await driver.waitForComponent(ON.id('sidebarcontainer_uxconsistency_0090'), 500)
      await Utils.sleep(500)

      // 步骤3：打开应用，点击桌面空白处
      let sidebarContainer_bounds = await sidebarContainer.getBounds()
      await driver.click(sidebarContainer_bounds.right-200,sidebarContainer_bounds.bottom-300)
      // 预期效果：侧边栏所在区域出现半透明灰色蒙层
      await windowSnap.snapShot('SUB_ACE_UI_PC_UXCONSISTENCY_0090_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_PC_UXCONSISTENCY_0170
     * @tc.name   : Dynamic switching SideBarContainerType focus loss gray display test
     * @tc.desc   : Verify pc uxconsistency interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_PC_UXCONSISTENCY_0170', Level.LEVEL3, async (done: Function) => {
      // 步骤1：创建 sidebarcontainer 组件
      Settings.createWindow('testability/pages/scenario/misc/UiPcUxconsistency/UiPcUxconsistency0170')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：动态切换 SideBarContainerType 属性
      let toggleBtn = await driver.waitForComponent(ON.id('button_uxconsistency_0170'), 500)
      await toggleBtn.click()
      await Utils.sleep(500)

      // 步骤3：打开应用，点击桌面空白处
      let sidebarContainer = await driver.waitForComponent(ON.id('sidebarcontainer_uxconsistency_0170'), 500)
      let sidebarContainer_bounds = await sidebarContainer.getBounds()
      await driver.click(sidebarContainer_bounds.right-200,sidebarContainer_bounds.bottom-300)
      // 预期效果：侧边栏所在区域出现半透明灰色蒙层
      await windowSnap.snapShot('SUB_ACE_UI_PC_UXCONSISTENCY_0170_01')
      await Utils.sleep(1000)

      done();
    })
  })
}