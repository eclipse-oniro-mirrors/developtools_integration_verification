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

export default function uiComponentUiContextAddMenuFocus() {

  describe('uiComponentUiContextAddMenuFocus', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0140
     * @tc.name   : Connect to the external mouse settings and set the mouse style to NORTH with setCursor
     * @tc.desc   : Verify special components uicontext addmenufocus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0140', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0140 start.`);
      Settings.createWindow('testability/pages/component/embedded/UiContextAddMenuFocus/UiComponentUiContextAddMenuFocus01')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentUiContextAddMenuFocus01_02'),1000);
      let point = await button.getBoundsCenter()
      await driver.mouseMoveTo({x:point.x, y:point.y})
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0150
     * @tc.name   : Connect to the external mouse settings and set the mouse style to West with setCursor
     * @tc.desc   : Verify special components uicontext addmenufocus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0150', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0150 start.`);
      Settings.createWindow('testability/pages/component/embedded/UiContextAddMenuFocus/UiComponentUiContextAddMenuFocus02')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentUiContextAddMenuFocus02_01'),1000);
      let point = await button.getBoundsCenter()
      await driver.mouseMoveTo({x:point.x, y:point.y})
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0220
     * @tc.name   : Connect the external mouse settings and set the mouse style to LOADNG by setting setCursor
     * @tc.desc   : Verify special components uicontext addmenufocus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0220', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0220 start.`);
      Settings.createWindow('testability/pages/component/embedded/UiContextAddMenuFocus/UiComponentUiContextAddMenuFocus03')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentUiContextAddMenuFocus03'),1000);
      let point = await button.getBoundsCenter()
      await driver.mouseMoveTo({x:point.x, y:point.y})
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0180
     * @tc.name   : Connect the external mouse settings and set the mouse style to TEXT_CURSOR by using setCursor
     * @tc.desc   : Verify special components uicontext addmenufocus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0180', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0180 start.`);
      Settings.createWindow('testability/pages/component/embedded/UiContextAddMenuFocus/UiComponentUiContextAddMenuFocus04')
      let driver:Driver=Driver.create();
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentUiContextAddMenuFocus04'),1000);
      let point = await textarea.getBoundsCenter()
      await driver.mouseMoveTo({x:point.x, y:point.y})
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0170
     * @tc.name   : Connect the external mouse settings and set the mouse style to COLOR_SUCKER by setting setCursor
     * @tc.desc   : Verify special components uicontext addmenufocus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0170', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0170 start.`);
      Settings.createWindow('testability/pages/component/embedded/UiContextAddMenuFocus/UiComponentUiContextAddMenuFocus05')
      let driver:Driver=Driver.create();
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentUiContextAddMenuFocus05'),1000);
      let point = await textarea.getBoundsCenter()
      await driver.mouseMoveTo({x:point.x, y:point.y})
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0190
     * @tc.name   : Connect the external mouse settings and set the mouse style to HELP by setting setCursor
     * @tc.desc   : Verify special components uicontext addmenufocus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0190', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0190 start.`);
      Settings.createWindow('testability/pages/component/embedded/UiContextAddMenuFocus/UiComponentUiContextAddMenuFocus06')
      let driver:Driver=Driver.create();
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentUiContextAddMenuFocus06'),1000);
      let point = await textarea.getBoundsCenter()
      await driver.mouseMoveTo({x:point.x, y:point.y-10})
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0160
     * @tc.name   : Connect the external mouse settings and set the mouse style to MOVE by setCursor
     * @tc.desc   : Verify special components uicontext addmenufocus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0160', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0160 start.`);
      Settings.createWindow('testability/pages/component/embedded/UiContextAddMenuFocus/UiComponentUiContextAddMenuFocus07')
      let driver:Driver=Driver.create();
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentUiContextAddMenuFocus07'),1000);
      let point = await textarea.getBoundsCenter()
      await driver.mouseMoveTo({x:point.x, y:point.y-10})
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0110
     * @tc.name   : Connect the external mouse settings and see that the default mouse style is a black arrow
     * @tc.desc   : Verify special components uicontext addmenufocus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0110', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0110 start.`);
      Settings.createWindow('testability/pages/component/embedded/UiContextAddMenuFocus/UiComponentUiContextAddMenuFocus08')
      let driver:Driver=Driver.create();
      await driver.mouseMoveTo({x:100, y:100})
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0130
     * @tc.name   : Connect the external mouse settings and set the mouse style to HAND_POINTING by setCursor
     * @tc.desc   : Verify special components uicontext addmenufocus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0130', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0130 start.`);
      Settings.createWindow('testability/pages/component/embedded/UiContextAddMenuFocus/UiComponentUiContextAddMenuFocus09')
      let driver:Driver=Driver.create();
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentUiContextAddMenuFocus09'),1000);
      let point = await textarea.getBoundsCenter()
      await driver.mouseMoveTo({x:point.x, y:point.y})
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0120
     * @tc.name   : Connect the external mouse settings and set the mouse style to CURSOR_CIRCLE by setCursor
     * @tc.desc   : Verify special components uicontext addmenufocus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0120', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0120 start.`);
      Settings.createWindow('testability/pages/component/embedded/UiContextAddMenuFocus/UiComponentUiContextAddMenuFocus10')
      let driver:Driver=Driver.create();
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentUiContextAddMenuFocus10'),1000);
      let point = await textarea.getBoundsCenter()
      await driver.mouseMoveTo({x:point.x, y:point.y})
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0030
     * @tc.name   : Call getFocusController(): FocusController, and set focusable(false) to the component
     * @tc.desc   : Verify special components uicontext addmenufocus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0030', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0030 start.`);
      Settings.createWindow('testability/pages/component/embedded/UiContextAddMenuFocus/UiComponentUiContextAddMenuFocus11')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ADDMENUFOCUS_0030 finish.`);
      done()
    })

  })
}