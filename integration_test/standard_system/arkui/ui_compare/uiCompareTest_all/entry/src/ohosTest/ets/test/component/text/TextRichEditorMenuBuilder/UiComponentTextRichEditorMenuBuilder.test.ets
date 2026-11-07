/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
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
import { Driver, ON, Component, MouseButton } from '@kit.TestKit'
/*
 * SUB_ACE_UI_ATTRIBUTES_FONT_INTERFACE_0010:设置文本颜色
 *
 * Settings.createWindow(config.url)：
 *  创建窗口，更改窗口基本配置，更改方式详见model/Settings createWindow方法
 *
 * windowSnap.snapShot(globalThis.context)：
 *  窗口截屏&图片文件保存，存储在设备端
 *  存储文件固定，单挑用例执行后覆盖，用于自动化UI对比
 *  支持调试更改文件名为时间戳格式，更改model/snapShot createAndGetFile方法 注释L35，放开L32，L33
 *
 * Logger日志使用方法：
 *  import Logger form './model/Logger'
 *  Logger.info(TAG,`config = ${config}, err = ${JSON.stringify(exception)}`)
 * */

export default function uiComponentTextRichEditorMenuBuilder() {

  describe('uiComponentTextRichEditorMenuBuilder', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0007
     * @tc.name   : Long press/right-click/select builderSpan and other content, bind custom menu type as TEXT
     * @tc.desc   : Verify text richeditor menu contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0007', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0007 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorMenuBuilder/UiComponentTextRichEditorMenuBuilder01')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorMenuBuilder01'),1000);
      let point = await richeditor.getBoundsCenter()
      await richeditor.longClick();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_RIGHT);
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_LEFT);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.mouseDrag({x:point.x+200, y:point.y+70},{x:point.x-200, y:point.y-70},600);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0007 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0009
     * @tc.name   : Long press/right-click/select builderSpan and other content, bind custom menu type as BUILDER
     * @tc.desc   : Verify text richeditor menu contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0009', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0009 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorMenuBuilder/UiComponentTextRichEditorMenuBuilder02')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorMenuBuilder02'),1000);
      let point = await richeditor.getBoundsCenter()
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_RIGHT);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_LEFT);
      await richeditor.longClick();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(point.x+200,point.y+70)
      await driver.waitForIdle(500,2000)
      await driver.mouseDrag({x:point.x+200, y:point.y+60},{x:point.x-200, y:point.y-70},600);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0009 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0004
     * @tc.name   : Long press/right-click/select builderSpan with the mouse, bind the custom menu type as Mixed
     * @tc.desc   : Verify text richeditor menu contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0004', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0004 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorMenuBuilder/UiComponentTextRichEditorMenuBuilder03')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorMenuBuilder03'),1000);
      let point = await richeditor.getBoundsCenter()
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_RIGHT);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_LEFT);
      await richeditor.longClick();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(point.x+200,point.y+70)
      await driver.waitForIdle(500,2000)
      await driver.mouseDrag({x:point.x+200, y:point.y+60},{x:point.x-200, y:point.y-70},600);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0004 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0001
     * @tc.name   : Long press/right-click/select builderSpan with the mouse, bind custom menu type as TEXT
     * @tc.desc   : Verify text richeditor menu contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0001', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0001 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorMenuBuilder/UiComponentTextRichEditorMenuBuilder04')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorMenuBuilder04'),1000);
      let point = await richeditor.getBoundsCenter()
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_RIGHT);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_LEFT);
      await richeditor.longClick();
      windowSnap.snapShot()
      await Utils.sleep(1500)
      await driver.click(point.x+200,point.y+70)
      await driver.waitForIdle(500,2000)
      await driver.mouseDrag({x:point.x+200, y:point.y+60},{x:point.x-200, y:point.y-70},600);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0001 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0002
     * @tc.name   : Long press/right-click/select builderSpan with the mouse, bind custom menu type as IMAGE
     * @tc.desc   : Verify text richeditor menu contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0002', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0002 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorMenuBuilder/UiComponentTextRichEditorMenuBuilder05')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorMenuBuilder05'),1000);
      let point = await richeditor.getBoundsCenter()
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_RIGHT);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_LEFT);
      await richeditor.longClick();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(point.x+200,point.y+70)
      await driver.waitForIdle(500,2000)
      await driver.mouseDrag({x:point.x+200, y:point.y+60},{x:point.x-200, y:point.y-70},600);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0002 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0006
     * @tc.name   : Long press/right-click/select builderSpan with the mouse, bind custom menu type as IMAGE
     * @tc.desc   : Verify text richeditor menu contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0006', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0006 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorMenuBuilder/UiComponentTextRichEditorMenuBuilder06')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorMenuBuilder06'),1000);
      let point = await richeditor.getBoundsCenter()
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_RIGHT);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_LEFT);
      await richeditor.longClick();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(point.x+200,point.y+70)
      await driver.waitForIdle(500,2000)
      await driver.mouseDrag({x:point.x+200, y:point.y+60},{x:point.x-200, y:point.y-70},600);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0006 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0005
     * @tc.name   : Long press/right-click/select builderSpan with the mouse to bind multiple custom menus, including BUILDER
     * @tc.desc   : Verify text richeditor menu contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0005', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0005 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorMenuBuilder/UiComponentTextRichEditorMenuBuilder07')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorMenuBuilder07'),1000);
      let point = await richeditor.getBoundsCenter()
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_RIGHT);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_LEFT);
      await richeditor.longClick();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(point.x+200,point.y+70)
      await driver.waitForIdle(500,2000)
      await driver.mouseDrag({x:point.x+200, y:point.y+60},{x:point.x-200, y:point.y-70},600);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0005 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0008
     * @tc.name   : Long press/right-click/select builderSpan and other content, bind custom menu type as IMAGE
     * @tc.desc   : Verify text richeditor menu contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0008', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0008 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorMenuBuilder/UiComponentTextRichEditorMenuBuilder08')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorMenuBuilder08'),1000);
      let point = await richeditor.getBoundsCenter()
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_RIGHT);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_LEFT);
      await richeditor.longClick();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(point.x+200,point.y+70)
      await driver.waitForIdle(500,2000)
      await driver.mouseDrag({x:point.x+200, y:point.y+60},{x:point.x-200, y:point.y-70},600);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0008 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0010
     * @tc.name   : Long press/right-click/select builderSpan and other content with the mouse, bind custom menu type as Mixed
     * @tc.desc   : Verify text richeditor menu contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0010 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorMenuBuilder/UiComponentTextRichEditorMenuBuilder09')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorMenuBuilder09'),1000);
      let point = await richeditor.getBoundsCenter()
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_RIGHT);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_LEFT);
      await richeditor.longClick();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(point.x+200,point.y+70)
      await driver.waitForIdle(500,2000)
      await driver.mouseDrag({x:point.x+200, y:point.y+60},{x:point.x-200, y:point.y-70},600);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0012
     * @tc.name   : Long press/right-click/select builderSpan and other content, bind multiple custom menus, types do not include Mixed
     * @tc.desc   : Verify text richeditor menu contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0012', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0012 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorMenuBuilder/UiComponentTextRichEditorMenuBuilder10')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorMenuBuilder10'),1000);
      let point = await richeditor.getBoundsCenter()
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_RIGHT);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_LEFT);
      await richeditor.longClick();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(point.x+200,point.y+70)
      await driver.waitForIdle(500,2000)
      await driver.mouseDrag({x:point.x+200, y:point.y+60},{x:point.x-200, y:point.y-70},600);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0012 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0011
     * @tc.name   : Long press/right-click/select builderSpan and other content, bind multiple custom menus, types include Mixed
     * @tc.desc   : Verify text richeditor menu contentModifier builder interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0011', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0011 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorMenuBuilder/UiComponentTextRichEditorMenuBuilder11')
      let driver:Driver=Driver.create();
      let richeditor: Component = await driver.waitForComponent(ON.id('UiComponentTextRichEditorMenuBuilder11'),1000);
      let point = await richeditor.getBoundsCenter()
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_RIGHT);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_LEFT);
      await richeditor.longClick();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.click(point.x+200,point.y+70)
      await driver.waitForIdle(500,2000)
      await driver.mouseDrag({x:point.x+200, y:point.y+60},{x:point.x-200, y:point.y-70},600);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_MENU_BUILDER_0011 finish.`);
      done()
    })
  })
}