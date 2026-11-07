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

import { afterEach, describe, it, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON } from '@kit.TestKit'
import windowSnap from '../../../model/snapShot'

export default function UiComponentTextRichEditorOptimizeSelectAllMenuLocation() {
  describe('UiComponentTextRichEditorOptimizeSelectAllMenuLocation', () => {
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
      await Utils.sleep(2000);
      done()
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_OPTIMIZE_Select_All_MENU_LOCATION_0025
        * @tc.name   : Keyboard compression setting, lift mode, menu can correctly avoid
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_OPTIMIZE_Select_All_MENU_LOCATION_0025", Level.LEVEL3,
      async (done: Function) => {
        Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorOptimizeSelectAllMenuLocation/UiComponentTextRichEditorOptimizeSelectAllMenuLocation0025")
        let driver = await Driver.create()

        // 1、查找组件
        let rich_editor_optimizeselectallmenulocation_0025 =
          await driver.findComponent(ON.id("rich_editor_optimizeselectallmenulocation_0025"))
        if (!rich_editor_optimizeselectallmenulocation_0025) {
          Logger.error('TEST', 'RichEditor component not found!');
          done();
          return;
        }
        let button_optimizeselectallmenulocation_0025_addImage =
          await driver.findComponent(ON.id('button_optimizeselectallmenulocation_0025_addImage'))

        // 2、输入大段文字
        await rich_editor_optimizeselectallmenulocation_0025.inputText(
          '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本'
          , { paste: false, addition: true });
        await Utils.sleep(1000) // 等待输入完成
        for (let i = 0; i < 5; i++) {
          button_optimizeselectallmenulocation_0025_addImage.click()
          await Utils.sleep(500) // 等待按钮可点击状态
        }
        // 3、随机选中查看菜单状态
        await rich_editor_optimizeselectallmenulocation_0025.doubleClick()
        await Utils.sleep(1000) // 等待双击操作完成
        await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_OPTIMIZE_Select_All_MENU_LOCATION_0025_01")
        await Utils.sleep(1000) // 等待截图完成
        done();
      })


    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_OPTIMIZE_Select_All_MENU_LOCATION_0035
        * @tc.name   : Menu correctly avoids custom keyboard
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_OPTIMIZE_Select_All_MENU_LOCATION_0035", Level.LEVEL3,
      async (done: Function) => {
        Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorOptimizeSelectAllMenuLocation/UiComponentTextRichEditorOptimizeSelectAllMenuLocation0035")
        await Utils.sleep(2000) // 等待窗口创建完成
        let driver = await Driver.create()

        // 1、查找组件
        let rich_editor_optimizeselectallmenulocation_0035 =
          await driver.findComponent(ON.id("rich_editor_optimizeselectallmenulocation_0035"))
        if (!rich_editor_optimizeselectallmenulocation_0035) {
          Logger.error('TEST', 'RichEditor component not found!');
          done();
          return;
        }
        let button_optimizeselectallmenulocation_0035_addImage =
          await driver.findComponent(ON.id('button_optimizeselectallmenulocation_0035_addImage'));
        let button_optimizeselectallmenulocation_0035_select =
          await driver.findComponent(ON.id('button_optimizeselectallmenulocation_0035_select'))
        // 2、输入大段文字
        await rich_editor_optimizeselectallmenulocation_0035.inputText(
          '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本'
          , { paste: false, addition: true });
        await Utils.sleep(1000) // 等待输入完成
        for (let i = 0; i < 5; i++) {
          button_optimizeselectallmenulocation_0035_addImage.click()
          await Utils.sleep(500) // 等待按钮可点击状态
        }
        // 2、随机选中查看菜单状态
        await button_optimizeselectallmenulocation_0035_select.click()
        await Utils.sleep(2000) // 等待选择操作完成
        await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_OPTIMIZE_Select_All_MENU_LOCATION_0035_01")
        await Utils.sleep(1000) // 等待截图完成
        done();
      })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_OPTIMIZE_Select_All_MENU_LOCATION_0032
        * @tc.name   : In floating window mode, select all component content
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_OPTIMIZE_Select_All_MENU_LOCATION_0032", Level.LEVEL3,
      async (done: Function) => {
        Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorOptimizeSelectAllMenuLocation/UiComponentTextRichEditorOptimizeSelectAllMenuLocation0032")
        await Utils.sleep(2000) // 等待窗口创建完成
        let driver = await Driver.create()

        // 1、查找组件
        let rich_editor_optimizeselectallmenulocation_0032 =
          await driver.findComponent(ON.id("rich_editor_optimizeselectallmenulocation_0032"))
        if (!rich_editor_optimizeselectallmenulocation_0032) {
          Logger.error('TEST', 'RichEditor component not found!');
          done();
          return;
        }
        let button_optimizeselectallmenulocation_0032_addImage =
          await driver.findComponent(ON.id('button_optimizeselectallmenulocation_0032_addImage'));
        let button_optimizeselectallmenulocation_0032_select =
          await driver.findComponent(ON.id('button_optimizeselectallmenulocation_0032_select'))
        // 2、输入大段文字
        await rich_editor_optimizeselectallmenulocation_0032.inputText(
          '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本'
          , { paste: false, addition: true });
        await Utils.sleep(1000) // 等待输入完成
        for (let i = 0; i < 5; i++) {
          button_optimizeselectallmenulocation_0032_addImage.click()
          await Utils.sleep(500) // 等待按钮可点击状态
        }
        // 2、随机选中查看菜单状态
        await rich_editor_optimizeselectallmenulocation_0032.doubleClick()
        await Utils.sleep(2000) // 等待双击操作完成

        // 重新查找按钮，确保它仍然存在
        let button_optimizeselectallmenulocation_0032_select_refresh =
          await driver.findComponent(ON.id('button_optimizeselectallmenulocation_0032_select'))
        if (!button_optimizeselectallmenulocation_0032_select_refresh) {
          Logger.error('TEST', 'Select button not found after doubleClick!');
          done();
          return;
        }
        await button_optimizeselectallmenulocation_0032_select_refresh.click()
        await Utils.sleep(2000) // 等待选择操作完成
        await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_OPTIMIZE_Select_All_MENU_LOCATION_0032_01")
        await Utils.sleep(1000) // 等待截图完成
        done();
      })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_OPTIMIZE_Select_All_MENU_LOCATION_0030
        * @tc.name   : Select a line of content and slide to make content obscured until left/right handles are invisible
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_OPTIMIZE_Select_All_MENU_LOCATION_0030", Level.LEVEL3,
      async (done: Function) => {
        Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorOptimizeSelectAllMenuLocation/UiComponentTextRichEditorOptimizeSelectAllMenuLocation0030")
        await Utils.sleep(2000) // 等待窗口创建完成
        let driver = await Driver.create()

        // 1、查找组件
        let rich_editor_optimizeselectallmenulocation_0030 =
          await driver.findComponent(ON.id("rich_editor_optimizeselectallmenulocation_0030"))
        if (!rich_editor_optimizeselectallmenulocation_0030) {
          Logger.error('TEST', 'RichEditor component not found!');
          done();
          return;
        }
        let button_optimizeselectallmenulocation_0030_addImage =
          await driver.findComponent(ON.id('button_optimizeselectallmenulocation_0030_addImage'));
        let button_optimizeselectallmenulocation_0030_select =
          await driver.findComponent(ON.id('button_optimizeselectallmenulocation_0030_select'))
        // 2、输入大段文字
        await rich_editor_optimizeselectallmenulocation_0030.inputText(
          '测试文本测试文本\n' +
            '测试文本测试文本\n' +
            '测试文本测试文本\n' +
            '测试文本测试文本\n' +
            '测试文本测试文本\n' +
            '测试文本测试文本\n' +
            '测试文本测试文本\n' +
            '测试文本测试文本\n' +
            '测试文本测试文本\n' +
            '测试文本测试文本\n' +
            '测试文本测试文本\n' +
            '测试文本测试文本\n' +
            '测试文本测试文本\n' +
            '测试文本测试文本\n' +
            '测试文本测试文本\n' +
            '测试文本测试文本\n' +
            '测试文本测试文本\n' +
            '测试文本测试文本\n' +
            '测试文本测试文本\n' +
            '测试文本测试文本\n' +
            '测试文本测试文本\n' +
            '测试文本测试文本\n'
          , { paste: false, addition: true });
        await Utils.sleep(1000) // 等待输入完成
        for (let i = 0; i < 5; i++) {
          button_optimizeselectallmenulocation_0030_addImage.click()
          await Utils.sleep(500) // 等待按钮可点击状态
        }
        // 2、随机选中查看菜单状态
        await button_optimizeselectallmenulocation_0030_select.click()
        await Utils.sleep(1000) // 等待选择操作完成
        let point = await rich_editor_optimizeselectallmenulocation_0030.getBoundsCenter()
        // 模拟滑动测试
        // await driver.swipe(point.x,point.y +50,point.x,point.y -50,400)
        await rich_editor_optimizeselectallmenulocation_0030.scrollToBottom(200)
        await Utils.sleep(1000) // 等待滚动操作完成
        await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_OPTIMIZE_Select_All_MENU_LOCATION_0030_01")
        await Utils.sleep(1000) // 等待截图完成
        done();
      })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_OPTIMIZE_Select_All_MENU_LOCATION_0017
        * @tc.name   : setSelection sets selection area at top, middle, and bottom
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_OPTIMIZE_Select_All_MENU_LOCATION_0017", Level.LEVEL3,
      async (done: Function) => {
        Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorOptimizeSelectAllMenuLocation/UiComponentTextRichEditorOptimizeSelectAllMenuLocation0017")
        await Utils.sleep(2000) // 等待窗口创建完成
        let driver = await Driver.create()

        // 1、查找组件
        let rich_editor_optimizeselectallmenulocation_0017 =
          await driver.findComponent(ON.id("rich_editor_optimizeselectallmenulocation_0017"))
        if (!rich_editor_optimizeselectallmenulocation_0017) {
          Logger.error('TEST', 'RichEditor component not found!');
          done();
          return;
        }
        let button_optimizeselectallmenulocation_0017_addImage =
          await driver.findComponent(ON.id('button_optimizeselectallmenulocation_0017_addImage'));
        let button_optimizeselectallmenulocation_0017_selectTop =
          await driver.findComponent(ON.id('button_optimizeselectallmenulocation_0017_selectTop'))
        let button_optimizeselectallmenulocation_0017_selectMid =
          await driver.findComponent(ON.id('button_optimizeselectallmenulocation_0017_selectMid'))
        let button_optimizeselectallmenulocation_0017_selectBottom =
          await driver.findComponent(ON.id('button_optimizeselectallmenulocation_0017_selectBottom'))
        await Utils.sleep(1000)
        // 2、输入大段文字
        await rich_editor_optimizeselectallmenulocation_0017.inputText(
          '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本'
          , { paste: false, addition: true });
        await Utils.sleep(1000)
        for (let i = 0; i < 5; i++) {
          button_optimizeselectallmenulocation_0017_addImage.click()
          await Utils.sleep(500)
        }

        // 2、分别选择上中下部分并截图
        //  Bottom
        await button_optimizeselectallmenulocation_0017_selectBottom.click()
        await Utils.sleep(500)
        windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_OPTIMIZE_Select_All_MENU_LOCATION_0017_01")
        await Utils.sleep(1000)

        // Mid
        await button_optimizeselectallmenulocation_0017_selectMid.click()
        await Utils.sleep(500)
        windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_OPTIMIZE_Select_All_MENU_LOCATION_0017_01")
        await Utils.sleep(1000)

        // Top
        await button_optimizeselectallmenulocation_0017_selectTop.click()
        await Utils.sleep(500)
        windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_OPTIMIZE_Select_All_MENU_LOCATION_0017_01")
        await Utils.sleep(1000)
        done();
      })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_OPTIMIZE_Select_All_MENU_LOCATION_0022
        * @tc.name   : Multi-type span combination selection
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_OPTIMIZE_Select_All_MENU_LOCATION_0022", Level.LEVEL3,
      async (done: Function) => {
        Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorOptimizeSelectAllMenuLocation/UiComponentTextRichEditorOptimizeSelectAllMenuLocation0022")
        await Utils.sleep(2000) // 等待窗口创建完成
        let driver = await Driver.create()

        // 1、查找组件
        let rich_editor_optimizeselectallmenulocation_0022 =
          await driver.findComponent(ON.id("rich_editor_optimizeselectallmenulocation_0022"))
        if (!rich_editor_optimizeselectallmenulocation_0022) {
          Logger.error('TEST', 'RichEditor component not found!');
          done();
          return;
        }
        let button_optimizeselectallmenulocation_0022_addImage =
          await driver.findComponent(ON.id('button_optimizeselectallmenulocation_0022_addImage'));
        let button_optimizeselectallmenulocation_0022_symbol =
          await driver.findComponent(ON.id('button_optimizeselectallmenulocation_0022_symbol'));
        let button_optimizeselectallmenulocation_0022_builder =
          await driver.findComponent(ON.id('button_optimizeselectallmenulocation_0022_builder'));
        let button_optimizeselectallmenulocation_0022_select =
          await driver.findComponent(ON.id('button_optimizeselectallmenulocation_0022_select'));

        await Utils.sleep(1000)
        // 2、输入大段文字
        await rich_editor_optimizeselectallmenulocation_0022.inputText(
          '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本'
          , { paste: false, addition: true });
        await Utils.sleep(1000)

        button_optimizeselectallmenulocation_0022_addImage.click()
        await Utils.sleep(1000)
        button_optimizeselectallmenulocation_0022_symbol.click()
        await Utils.sleep(1000)
        button_optimizeselectallmenulocation_0022_builder.click()
        await Utils.sleep(2000)
        // 2、随机选中查看菜单状态
        // 重新查找按钮，确保它仍然存在
        let button_optimizeselectallmenulocation_0022_select_refresh =
          await driver.findComponent(ON.id('button_optimizeselectallmenulocation_0022_select'))
        if (!button_optimizeselectallmenulocation_0022_select_refresh) {
          Logger.error('TEST', 'Select button not found after operations!');
          done();
          return;
        }
        await button_optimizeselectallmenulocation_0022_select_refresh.click()
        await Utils.sleep(2000)
        await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_OPTIMIZE_Select_All_MENU_LOCATION_0022_01")
        await Utils.sleep(1000)
        done();
      })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_OPTIMIZE_Select_All_MENU_LOCATION_0020
        * @tc.name   : Set custom menu
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_OPTIMIZE_Select_All_MENU_LOCATION_0020", Level.LEVEL3,
      async (done: Function) => {
        Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorOptimizeSelectAllMenuLocation/UiComponentTextRichEditorOptimizeSelectAllMenuLocation0020")
        await Utils.sleep(2000) // 等待窗口创建完成
        let driver = await Driver.create()

        // 1、查找组件
        let rich_editor_optimizeselectallmenulocation_0020 =
          await driver.findComponent(ON.id("rich_editor_optimizeselectallmenulocation_0020"))
        if (!rich_editor_optimizeselectallmenulocation_0020) {
          Logger.error('TEST', 'RichEditor component not found!');
          done();
          return;
        }
        let button_optimizeselectallmenulocation_0020_addImage =
          await driver.findComponent(ON.id('button_optimizeselectallmenulocation_0020_addImage'));
        let button_optimizeselectallmenulocation_0020_symbol =
          await driver.findComponent(ON.id('button_optimizeselectallmenulocation_0020_symbol'));

        // 2、输入大段文字
        await rich_editor_optimizeselectallmenulocation_0020.inputText(
          '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本'
          , { paste: false, addition: true });
        await Utils.sleep(1000)
        for (let i = 0; i < 5; i++) {
          button_optimizeselectallmenulocation_0020_addImage.click()
          await Utils.sleep(500)
          button_optimizeselectallmenulocation_0020_symbol.click()
          await Utils.sleep(500)
        }
        await Utils.sleep(1000)
        // 2、随机选中查看菜单状态
        await rich_editor_optimizeselectallmenulocation_0020.longClick()
        await Utils.sleep(1000)
        await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_OPTIMIZE_Select_All_MENU_LOCATION_0020_01")
        await Utils.sleep(1000)
        done();
      })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_OPTIMIZE_Select_All_MENU_LOCATION_0021
        * @tc.name   : Set AI menu
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_OPTIMIZE_Select_All_MENU_LOCATION_0021", Level.LEVEL3,
      async (done: Function) => {
        Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorOptimizeSelectAllMenuLocation/UiComponentTextRichEditorOptimizeSelectAllMenuLocation0021")
        await Utils.sleep(2000) // 等待窗口创建完成
        let driver = await Driver.create()

        // 1、查找组件
        let rich_editor_optimizeselectallmenulocation_0021 =
          await driver.findComponent(ON.id("rich_editor_optimizeselectallmenulocation_0021"))
        if (!rich_editor_optimizeselectallmenulocation_0021) {
          Logger.error('TEST', 'RichEditor component not found!');
          done();
          return;
        }
        let button_optimizeselectallmenulocation_0021_select =
          await driver.findComponent(ON.id('button_optimizeselectallmenulocation_0021_select'));

        await Utils.sleep(1000)
        // 2、输入大段文字
        await rich_editor_optimizeselectallmenulocation_0021.inputText(
          '1584156509@qq.com'
          , { paste: false, addition: true });
        await Utils.sleep(1000)
        // 重新查找按钮，确保它仍然存在
        let button_optimizeselectallmenulocation_0021_select_refresh =
          await driver.findComponent(ON.id('button_optimizeselectallmenulocation_0021_select'))
        if (!button_optimizeselectallmenulocation_0021_select_refresh) {
          Logger.error('TEST', 'Select button not found after input!');
          done();
          return;
        }
        await button_optimizeselectallmenulocation_0021_select_refresh.click()
        await Utils.sleep(2000)
        await rich_editor_optimizeselectallmenulocation_0021.longClick()
        await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_OPTIMIZE_Select_All_MENU_LOCATION_0021_01")
        await Utils.sleep(1000)
        done();
      })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_OPTIMIZE_Select_All_MENU_LOCATION_0026
        * @tc.name   : Attribute string, menu can correctly avoid
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_OPTIMIZE_Select_All_MENU_LOCATION_0026", Level.LEVEL3,
      async (done: Function) => {
        Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorOptimizeSelectAllMenuLocation/UiComponentTextRichEditorOptimizeSelectAllMenuLocation0026")
        await Utils.sleep(2000) // 等待窗口创建完成
        let driver = await Driver.create()

        // 1、查找组件
        let rich_editor_optimizeselectallmenulocation_0026 =
          await driver.findComponent(ON.id("rich_editor_optimizeselectallmenulocation_0026"))
        if (!rich_editor_optimizeselectallmenulocation_0026) {
          Logger.error('TEST', 'RichEditor component not found!');
          done();
          return;
        }
        let button_optimizeselectallmenulocation_0026_addImage =
          await driver.findComponent(ON.id('button_optimizeselectallmenulocation_0026_addImage'));

        await Utils.sleep(1000)
        // 2、输入大段文字
        await rich_editor_optimizeselectallmenulocation_0026.inputText(
          '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本'
          , { paste: false, addition: true });
        await Utils.sleep(1000)
        for (let i = 0; i < 5; i++) {
          button_optimizeselectallmenulocation_0026_addImage.click()
          await Utils.sleep(500)
        }
        // 2、随机选中查看菜单状态
        await rich_editor_optimizeselectallmenulocation_0026.doubleClick()
        await Utils.sleep(2000)
        await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_OPTIMIZE_Select_All_MENU_LOCATION_0026_01")
        await Utils.sleep(1000)
        done();
      })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_OPTIMIZE_Select_All_MENU_LOCATION_0027
        * @tc.name   : Before and after portrait/landscape switching, menu normally avoids
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_OPTIMIZE_Select_All_MENU_LOCATION_0027", Level.LEVEL3,
      async (done: Function) => {
        Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorOptimizeSelectAllMenuLocation/UiComponentTextRichEditorOptimizeSelectAllMenuLocation0027")
        await Utils.sleep(2000) // 等待窗口创建完成
        let driver = await Driver.create()

        // 1、查找组件
        let rich_editor_optimizeselectallmenulocation_0027 =
          await driver.findComponent(ON.id("rich_editor_optimizeselectallmenulocation_0027"))
        if (!rich_editor_optimizeselectallmenulocation_0027) {
          Logger.error('TEST', 'RichEditor component not found!');
          done();
          return;
        }
        let button_optimizeselectallmenulocation_0027_addImage =
          await driver.findComponent(ON.id('button_optimizeselectallmenulocation_0027_addImage'));
        let button_optimizeselectallmenulocation_0027_exchangeWindow =
          await driver.findComponent(ON.id('button_optimizeselectallmenulocation_0027_exchangeWindow'))
        // 2、输入大段文字
        await rich_editor_optimizeselectallmenulocation_0027.inputText(
          '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本' +
            '测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本测试文本'
          , { paste: false, addition: true });
        await Utils.sleep(1000) // 等待输入完成
        for (let i = 0; i < 5; i++) {
          button_optimizeselectallmenulocation_0027_addImage.click()
          await Utils.sleep(500) // 等待按钮可点击状态
        }
        // 2、随机选中查看菜单状态
        await rich_editor_optimizeselectallmenulocation_0027.doubleClick()
        await Utils.sleep(2000) // 等待双击操作完成
        await button_optimizeselectallmenulocation_0027_exchangeWindow.click()
        await Utils.sleep(1000) // 等待窗口切换操作完成
        await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_OPTIMIZE_Select_All_MENU_LOCATION_0027_01")
        await Utils.sleep(1000) // 等待截图完成
        done();
      })

  })
}
