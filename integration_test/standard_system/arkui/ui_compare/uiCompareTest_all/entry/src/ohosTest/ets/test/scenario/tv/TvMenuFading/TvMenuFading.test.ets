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

export default function tvMenuFading() {

  describe('tvMenuFading', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TV_Menu_FADING_001
     * @tc.name   : Set a background image for menuItem and check the fade-out effect.
     * @tc.desc   : Verify tv menu fading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TV_Menu_FADING_001', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TV_Menu_FADING_001 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/scenario/tv/TvMenuFading/TvMenuFading001')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：点击按钮显示菜单
      let btn_show_menu = await driver.findComponent(ON.id('btn_show_menu_fading_001'))
      await btn_show_menu.click()
      await Utils.sleep(500)

      // 步骤3：查看效果，验证文字渐隐，背景图片不渐隐
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TV_Menu_FADING_001 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TV_Menu_FADING_002
     * @tc.name   : Set a background color for menuItem and check the fade-out effect.
     * @tc.desc   : Verify tv menu fading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TV_Menu_FADING_002', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TV_Menu_FADING_002 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/scenario/tv/TvMenuFading/TvMenuFading002')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：点击按钮显示菜单
      let btn_show_menu = await driver.findComponent(ON.id('btn_show_menu_fading_002'))
      await btn_show_menu.click()
      await Utils.sleep(500)

      // 步骤3：查看效果，验证文字渐隐，背景颜色不渐隐
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TV_Menu_FADING_002 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TV_Menu_FADING_003
     * @tc.name   : Set a background color for menu and check the fade-out effect.
     * @tc.desc   : Verify tv menu fading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TV_Menu_FADING_003', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TV_Menu_FADING_003 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/scenario/tv/TvMenuFading/TvMenuFading003')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：点击按钮显示菜单
      let btn_show_menu = await driver.findComponent(ON.id('btn_show_menu_fading_003'))
      await btn_show_menu.click()
      await Utils.sleep(500)

      // 步骤3：查看效果，验证文字渐隐，背景颜色不渐隐
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TV_Menu_FADING_003 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TV_Menu_FADING_004
     * @tc.name   : Set a background image for menu and check the fade-out effect.
     * @tc.desc   : Verify tv menu fading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TV_Menu_FADING_004', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TV_Menu_FADING_004 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/scenario/tv/TvMenuFading/TvMenuFading004')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：点击按钮显示菜单
      let btn_show_menu = await driver.findComponent(ON.id('btn_show_menu_fading_004'))
      await btn_show_menu.click()
      await Utils.sleep(500)

      // 步骤3：查看效果，验证文字渐隐，背景图片不渐隐
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TV_Menu_FADING_004 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TV_Menu_FADING_021
     * @tc.name   : SubMenuExpandingMode configuration does not affect the overlong effect.
     * @tc.desc   : Verify tv menu fading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TV_Menu_FADING_021', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TV_Menu_FADING_021 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/scenario/tv/TvMenuFading/TvMenuFading021')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：点击按钮弹出菜单
      let btn_show_menu = await driver.findComponent(ON.id('btn_show_menu_fading_021'))
      await btn_show_menu.click()
      await Utils.sleep(500)

      // 步骤3：点击第一个菜单项弹出子菜单(SIDE_EXPAND方式)
      let menu_item_01 = await driver.findComponent(ON.id('menu_item_fading_021_01'))
      await menu_item_01.click()
      await Utils.sleep(500)

      // 步骤4：观察子菜单超长样式，验证渐隐正常，获焦、hover有跑马灯
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TV_Menu_FADING_021 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TV_Menu_FADING_031
     * @tc.name   : MenuItem overlong focus marquee, switch to background.
     * @tc.desc   : Verify tv menu fading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TV_Menu_FADING_031', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TV_Menu_FADING_031 start.`);
      // 步骤1：打开页面，新建menu组件，使menuitem文字内容超长
      Settings.createWindow('testability/pages/scenario/tv/TvMenuFading/TvMenuFading031')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：点击按钮显示菜单
      let btn_show_menu = await driver.findComponent(ON.id('btn_show_menu_fading_031'))
      await btn_show_menu.click()
      await Utils.sleep(500)

      // 步骤3：获焦超长menuitem，触发跑马灯+渐隐
      let menu_item_01 = await driver.findComponent(ON.id('menu_item_fading_031_01'))
      await menu_item_01.click()
      await Utils.sleep(1000)

      // 步骤5：验证跑马灯渐隐正常
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TV_Menu_FADING_031 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TV_Menu_FADING_032
     * @tc.name   : MenuItem overlong focus marquee, screen off and on.
     * @tc.desc   : Verify tv menu fading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TV_Menu_FADING_032', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TV_Menu_FADING_032 start.`);
      // 步骤1：打开页面，新建menu组件，使menuitem文字内容超长
      Settings.createWindow('testability/pages/scenario/tv/TvMenuFading/TvMenuFading032')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：点击按钮显示菜单
      let btn_show_menu = await driver.findComponent(ON.id('btn_show_menu_fading_032'))
      await btn_show_menu.click()
      await Utils.sleep(500)

      // 步骤3：获焦超长menuitem，触发跑马灯+渐隐
      let menu_item_01 = await driver.findComponent(ON.id('menu_item_fading_032_01'))
      await menu_item_01.click()
      await Utils.sleep(1000)

      // 步骤5：验证跑马灯渐隐正常
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TV_Menu_FADING_032 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TV_Menu_FADING_033
     * @tc.name   : MenuItem overlong, long press and move.
     * @tc.desc   : Verify tv menu fading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TV_Menu_FADING_033', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TV_Menu_FADING_033 start.`);
      // 步骤1：打开页面，新建menu组件，每个menuitem都超长
      Settings.createWindow('testability/pages/scenario/tv/TvMenuFading/TvMenuFading033')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：点击按钮显示菜单
      let btn_show_menu = await driver.findComponent(ON.id('btn_show_menu_fading_033'))
      await btn_show_menu.click()
      await Utils.sleep(500)

      // 步骤3：长按第一个menuitem并移动
      let menu_item_01 = await driver.findComponent(ON.id('menu_item_fading_033_01'))
      let bounds = await menu_item_01.getBounds()
      let centerX = Math.round((bounds.left + bounds.right) / 2)
      let centerY = Math.round((bounds.top + bounds.bottom) / 2)
      await driver.longClick(centerX, centerY)
      await Utils.sleep(500)

      // 步骤4：移动到第二个menuitem
      let menu_item_02 = await driver.findComponent(ON.id('menu_item_fading_033_02'))
      let bounds2 = await menu_item_02.getBounds()
      let centerX2 = Math.round((bounds2.left + bounds2.right) / 2)
      let centerY2 = Math.round((bounds2.top + bounds2.bottom) / 2)
      await driver.swipe(centerX, centerY, centerX2, centerY2)
      await Utils.sleep(500)

      // 步骤5：验证跑马灯渐隐正常
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TV_Menu_FADING_033 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TV_Menu_FADING_034
     * @tc.name   : Menu expand submenu, click blank area to collapse.
     * @tc.desc   : Verify tv menu fading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TV_Menu_FADING_034', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TV_Menu_FADING_034 start.`);
      // 步骤1：打开页面，新建menu组件，存在二级菜单
      Settings.createWindow('testability/pages/scenario/tv/TvMenuFading/TvMenuFading034')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：点击按钮显示菜单
      let btn_show_menu = await driver.findComponent(ON.id('btn_show_menu_fading_034'))
      await btn_show_menu.click()
      await Utils.sleep(500)

      // 步骤3：点击带二级菜单的菜单项，展开二级菜单
      let menu_item_02 = await driver.findComponent(ON.id('menu_item_fading_034_02'))
      await menu_item_02.click()
      await Utils.sleep(500)

      // 步骤4：点击空白处收起菜单
      await driver.click(50, 50)
      await Utils.sleep(500)

      // 步骤5：验证整个菜单都正常收起
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TV_Menu_FADING_034 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TV_Menu_FADING_035
     * @tc.name   : Menu component focus hover switch.
     * @tc.desc   : Verify tv menu fading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TV_Menu_FADING_035', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TV_Menu_FADING_035 start.`);
      // 步骤1：打开页面，新建menu组件，存在多个MenuItem，每个content均超长
      Settings.createWindow('testability/pages/scenario/tv/TvMenuFading/TvMenuFading035')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：点击按钮显示菜单
      let btn_show_menu = await driver.findComponent(ON.id('btn_show_menu_fading_035'))
      await btn_show_menu.click()
      await Utils.sleep(500)

      // 步骤3：在每个menuItem进行hover切换，模拟灵犀遥控器hover切换
      let menu_item_01 = await driver.findComponent(ON.id('menu_item_fading_035_01'))
      let bounds1 = await menu_item_01.getBounds()
      await driver.mouseMoveTo({ x: Math.round((bounds1.left + bounds1.right) / 2), y: Math.round((bounds1.top + bounds1.bottom) / 2) })
      await Utils.sleep(300)

      let menu_item_02 = await driver.findComponent(ON.id('menu_item_fading_035_02'))
      let bounds2 = await menu_item_02.getBounds()
      await driver.mouseMoveTo({ x: Math.round((bounds2.left + bounds2.right) / 2), y: Math.round((bounds2.top + bounds2.bottom) / 2) })
      await Utils.sleep(300)

      let menu_item_03 = await driver.findComponent(ON.id('menu_item_fading_035_03'))
      let bounds3 = await menu_item_03.getBounds()
      await driver.mouseMoveTo({ x: Math.round((bounds3.left + bounds3.right) / 2), y: Math.round((bounds3.top + bounds3.bottom) / 2) })
      await Utils.sleep(300)

      let menu_item_04 = await driver.findComponent(ON.id('menu_item_fading_035_04'))
      let bounds4 = await menu_item_04.getBounds()
      await driver.mouseMoveTo({ x: Math.round((bounds4.left + bounds4.right) / 2), y: Math.round((bounds4.top + bounds4.bottom) / 2) })
      await Utils.sleep(300)

      let menu_item_05 = await driver.findComponent(ON.id('menu_item_fading_035_05'))
      let bounds5 = await menu_item_05.getBounds()
      await driver.mouseMoveTo({ x: Math.round((bounds5.left + bounds5.right) / 2), y: Math.round((bounds5.top + bounds5.bottom) / 2) })
      await Utils.sleep(300)

      // 步骤4：验证来回切换跑马灯效果切换流畅，无卡顿
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TV_Menu_FADING_035 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TV_Menu_FADING_036
     * @tc.name   : Menu component focus switch back and forth.
     * @tc.desc   : Verify tv menu fading interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TV_Menu_FADING_036', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TV_Menu_FADING_036 start.`);
      // 步骤1：打开页面，新建menu组件，存在多个MenuItem，每个content均超长
      Settings.createWindow('testability/pages/scenario/tv/TvMenuFading/TvMenuFading036')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤2：点击按钮显示菜单
      let btn_show_menu = await driver.findComponent(ON.id('btn_show_menu_fading_036'))
      await btn_show_menu.click()
      await Utils.sleep(500)

      // 步骤3：在每个menuItem走焦切换（模拟多次切换）
      // 向下切换5次
      for (let i = 0; i < 5; i++) {
        await driver.triggerKey(2012) // 下键
        await Utils.sleep(100)
      }
      // 向上切换5次
      for (let i = 0; i < 5; i++) {
        await driver.triggerKey(2013) // 上键
        await Utils.sleep(100)
      }
      // 再向下切换5次
      for (let i = 0; i < 5; i++) {
        await driver.triggerKey(2012) // 下键
        await Utils.sleep(100)
      }
      await Utils.sleep(500)

      // 步骤4：验证来回切换跑马灯效果切换流畅，无卡顿
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TV_Menu_FADING_036 finish.`);
      done()
    })

  })
}