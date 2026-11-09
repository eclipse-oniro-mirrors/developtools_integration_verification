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

export default function uiComponentTextareaBarState() {

  describe('uiComponentTextareaBarState', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTAREA_BARSTATE_0020
     * @tc.name   : TextArea component, multiple lines of text, long mouse press on the blank space of the scrollbar
     * @tc.desc   : Verify textarea barstate interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXTAREA_BARSTATE_0020', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTAREA_BARSTATE_0020 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextareaBarState/UiComponentTextareaBarState01')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTAREA_BARSTATE_0020_01')
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentTextareaBarState01'),1000);
      let rect = await textarea.getBounds();
      let point = await textarea.getBoundsCenter();
      let click_x=rect.left+(point.x-rect.left)*2-10;
      let click_y=rect.top+(point.y-rect.top)*2-30;
      await driver.waitForIdle(500,2000);
      await textarea.click();
      await driver.mouseLongClick({x:click_x, y:click_y}, MouseButton.MOUSE_BUTTON_LEFT);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTAREA_BARSTATE_0020_02')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTAREA_BARSTATE_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTAREA_BARSTATE_0030
     * @tc.name   : TextArea component, multi-line text, set not to display scrollbar, mouse click scrollbar area
     * @tc.desc   : Verify textarea barstate interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXTAREA_BARSTATE_0030', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTAREA_BARSTATE_0030 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextareaBarState/UiComponentTextareaBarState02')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTAREA_BARSTATE_0030_01')
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentTextareaBarState02'),1000);
      let rect = await textarea.getBounds();
      let point = await textarea.getBoundsCenter();
      let click_x=rect.left+(point.x-rect.left)*2-10;
      let click_y=rect.top+(point.y-rect.top)*2-30;
      await driver.waitForIdle(500,2000);
      await textarea.click();
      await driver.mouseClick({x:click_x, y:click_y}, MouseButton.MOUSE_BUTTON_LEFT);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTAREA_BARSTATE_0030_02')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTAREA_BARSTATE_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTAREA_BARSTATE_0010
     * @tc.name   : TextArea component, multiple lines of text, mouse click scrollbar blank space
     * @tc.desc   : Verify textarea barstate interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXTAREA_BARSTATE_0010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTAREA_BARSTATE_0010 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextareaBarState/UiComponentTextareaBarState03')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTAREA_BARSTATE_0010_01')
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentTextareaBarState03'),1000);
      let rect = await textarea.getBounds();
      let point = await textarea.getBoundsCenter();
      let click_x1=rect.left+(point.x-rect.left)*2-10;
      let click_y1=rect.top+(point.y-rect.top)*2-30;
      let click_x2=rect.left+(point.x-rect.left)*2-10;
      let click_y2=rect.top+(point.y-rect.top)-30;
      await driver.waitForIdle(500,2000);
      await textarea.click();
      await driver.mouseLongClick({x:click_x1, y:click_y1}, MouseButton.MOUSE_BUTTON_LEFT);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTAREA_BARSTATE_0010_02')
      await driver.waitForIdle(500,2000);
      await driver.mouseLongClick({x:click_x2, y:click_y2}, MouseButton.MOUSE_BUTTON_LEFT);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTAREA_BARSTATE_0010_03')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTAREA_BARSTATE_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXTAREA_BARSTATE_0040
     * @tc.name   : TextArea component, multi-line text, the input box position is lower, which can trigger input method avoidance
     * @tc.desc   : Verify textarea barstate interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXTAREA_BARSTATE_0040', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTAREA_BARSTATE_0040 start.`);
      Settings.createWindow('testability/pages/component/text_input/TextareaBarState/UiComponentTextareaBarState04')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTAREA_BARSTATE_0040_01')
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentTextareaBarState04'),1000);
      let rect = await textarea.getBounds();
      let point = await textarea.getBoundsCenter();
      let click_x=rect.left+(point.x-rect.left)*2-10;
      let click_y=rect.top+(point.y-rect.top)*2-30;
      await driver.waitForIdle(500,2000);
      await textarea.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTAREA_BARSTATE_0040_02')
      await driver.mouseLongClick({x:click_x, y:click_y}, MouseButton.MOUSE_BUTTON_LEFT);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXTAREA_BARSTATE_0040_03')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXTAREA_BARSTATE_0040 finish.`);
      done()
    })

  })
}