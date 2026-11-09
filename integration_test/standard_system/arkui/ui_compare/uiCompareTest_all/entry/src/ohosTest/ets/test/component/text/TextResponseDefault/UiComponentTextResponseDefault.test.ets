/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

export default function uiComponentTextResponseDefault() {

  describe('uiComponentTextResponseDefault', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0060
     * @tc.name   : Text component, set a custom menu, TextSpanType.DEFAULT, bind the TextResponseType.DEFAULT menu
     * @tc.desc   : Verify textresponse default interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0060', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0060 start.`);
      Settings.createWindow('testability/pages/component/text/TextResponseDefault/UiComponentTextResponseDefault01')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let text: Component = await driver.waitForComponent(ON.id('UiComponentTextResponseDefault01'),1000);
      await text.longClick();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0060_01')
      await driver.waitForIdle(500,2000);
      await driver.mouseDrag({x:50, y:100},{x:50, y:200},600);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0060_02')
      await driver.mouseClick({x:75, y:125}, MouseButton.MOUSE_BUTTON_RIGHT);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0060_03')
      await driver.doubleClick(75,125)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0060_04')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0010
     * @tc.name   : Text component, set a custom menu, TextSpanType.TEXT, bind the TextResponseType.DEFAULT menu
     * @tc.desc   : Verify textresponse default interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0010 start.`);
      Settings.createWindow('testability/pages/component/text/TextResponseDefault/UiComponentTextResponseDefault02')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let text: Component = await driver.waitForComponent(ON.id('UiComponentTextResponseDefault02'),1000);
      await text.longClick();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0010_01')
      await driver.waitForIdle(500,2000);
      await driver.mouseDrag({x:50, y:100},{x:50, y:200},600);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0010_02')
      await driver.mouseClick({x:75, y:125}, MouseButton.MOUSE_BUTTON_RIGHT);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0010_03')
      await driver.doubleClick(75,125)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0010_04')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0020
     * @tc.name   : Text component, set custom menus, TextSpanType.TEXT,bind TextResponseType.DEFAULT, RIGHT_CLICK, LONG_PRESS, and SELECT menus
     * @tc.desc   : Verify textresponse default interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0020', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0020 start.`);
      Settings.createWindow('testability/pages/component/text/TextResponseDefault/UiComponentTextResponseDefault03')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let text: Component = await driver.waitForComponent(ON.id('UiComponentTextResponseDefault03'),1000);
      await text.longClick();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0020_01')
      await driver.waitForIdle(500,2000);
      await driver.mouseDrag({x:50, y:100},{x:50, y:200},600);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0020_02')
      await driver.mouseClick({x:75, y:125}, MouseButton.MOUSE_BUTTON_RIGHT);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0020_03')
      await driver.doubleClick(75,125)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0020_04')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0050
     * @tc.name   : Text component, set the custom menu, TextSpanType.MIXED, bind the TextResponseType.DEFAULT menu
     * @tc.desc   : Verify textresponse default interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0050', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0050 start.`);
      Settings.createWindow('testability/pages/component/text/TextResponseDefault/UiComponentTextResponseDefault04')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      await driver.mouseDrag({x:50, y:100},{x:300, y:200},600);
      await Utils.sleep(1000)
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0030
     * @tc.name   : Text component, set custom menus, TextSpanType.IMAGE,bind TextResponseType.DEFAULT
     * @tc.desc   : Verify textresponse default interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0030', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0030 start.`);
      Settings.createWindow('testability/pages/component/text/TextResponseDefault/UiComponentTextResponseDefault05')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let text: Component = await driver.findComponent(ON.id('UiComponentTextResponseDefault05'));
      await driver.waitForIdle(500,2000);
      await driver.mouseDrag({x:50, y:100},{x:200, y:200},600);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0030_01')
      await text.longClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0030_02')
      await driver.mouseClick({x:75, y:125}, MouseButton.MOUSE_BUTTON_RIGHT);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0030_03')
      await driver.doubleClick(75,125)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0030_04')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0040
     * @tc.name   : Text component, set custom menus, TextSpanType.IMAGE,bind TextResponseType.DEFAULT, RIGHT_CLICK, LONG_PRESS, and SELECT menus
     * @tc.desc   : Verify textresponse default interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0040', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0040 start.`);
      Settings.createWindow('testability/pages/component/text/TextResponseDefault/UiComponentTextResponseDefault06')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let text: Component = await driver.waitForComponent(ON.id('UiComponentTextResponseDefault06'),1000);
      await driver.waitForIdle(500,2000);
      await driver.mouseDrag({x:50, y:100},{x:200, y:200},600);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0040_01')
      await text.longClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0040_02')
      await driver.mouseClick({x:75, y:125}, MouseButton.MOUSE_BUTTON_RIGHT);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0040_03')
      await driver.doubleClick(75,125)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0040_04')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0070
     * @tc.name   : Text component, set a custom menu, TextSpanType.DEFAULT,bind TextResponseType.DEFAULT, RIGHT_CLICK, LONG_PRESS, and SELECT menus
     * @tc.desc   : Verify textresponse default interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0070', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0070 start.`);
      Settings.createWindow('testability/pages/component/text/TextResponseDefault/UiComponentTextResponseDefault07')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let text: Component = await driver.waitForComponent(ON.id('UiComponentTextResponseDefault07'),1000);
      await text.longClick();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0070_01')
      await driver.waitForIdle(500,2000);
      await driver.mouseDrag({x:50, y:100},{x:200, y:200},600);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0070_02')
      await driver.mouseClick({x:75, y:125}, MouseButton.MOUSE_BUTTON_RIGHT);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0070_03')
      await driver.doubleClick(75,125)
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0070_04')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTRESPONSE_DEFAULT_0070 finish.`);
      done()
    })


  })
}