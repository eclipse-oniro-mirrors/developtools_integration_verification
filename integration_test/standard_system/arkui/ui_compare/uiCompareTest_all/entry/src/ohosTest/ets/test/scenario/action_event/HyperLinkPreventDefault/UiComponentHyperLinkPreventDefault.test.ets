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

export default function uiComponentHyperLinkPreventDefault() {

  describe('uiComponentHyperLinkPreventDefault', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_HYPERLINK_PREVENTDEFAULT_0010
     * @tc.name   : The hyperlink component registers preventDefault, which blocks onclick and not touch
     * @tc.desc   : Verify hyperlink preventdefault interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_HYPERLINK_PREVENTDEFAULT_0010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HYPERLINK_PREVENTDEFAULT_0010 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/HyperLinkPreventDefault/UiComponentHyperLinkPreventDefault01')
      let driver:Driver=Driver.create();
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000)
      let HyperLink: Component = await driver.waitForComponent(ON.id('UiComponentHyperLinkPreventDefault01'),1000);
      await HyperLink.longClick();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HYPERLINK_PREVENTDEFAULT_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_HYPERLINK_PREVENTDEFAULT_0030
     * @tc.name   : The hyperlink component registers preventDefault, which blocks onclick and touch
     * @tc.desc   : Verify hyperlink preventdefault interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_HYPERLINK_PREVENTDEFAULT_0030', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HYPERLINK_PREVENTDEFAULT_0030 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/HyperLinkPreventDefault/UiComponentHyperLinkPreventDefault02')
      let driver:Driver=Driver.create();
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000)
      let HyperLink: Component = await driver.waitForComponent(ON.id('UiComponentHyperLinkPreventDefault02'),1000);
      await HyperLink.longClick();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HYPERLINK_PREVENTDEFAULT_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_HYPERLINK_PREVENTDEFAULT_0040
     * @tc.name   : The hyperlink component does not register preventDefault
     * @tc.desc   : Verify hyperlink preventdefault interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_HYPERLINK_PREVENTDEFAULT_0040', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HYPERLINK_PREVENTDEFAULT_0040 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/HyperLinkPreventDefault/UiComponentHyperLinkPreventDefault03')
      let driver:Driver=Driver.create();
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000)
      let HyperLink: Component = await driver.waitForComponent(ON.id('UiComponentHyperLinkPreventDefault03'),1000);
      await HyperLink.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HYPERLINK_PREVENTDEFAULT_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_HYPERLINK_PREVENTDEFAULT_0060
     * @tc.name   : The image subcomponent added to the hyperlink component does not register preventDefault
     * @tc.desc   : Verify hyperlink preventdefault interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_HYPERLINK_PREVENTDEFAULT_0060', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HYPERLINK_PREVENTDEFAULT_0060 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/HyperLinkPreventDefault/UiComponentHyperLinkPreventDefault04')
      let driver:Driver=Driver.create();
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000)
      let HyperLink: Component = await driver.waitForComponent(ON.id('UiComponentHyperLinkPreventDefault04'),1000);
      await HyperLink.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HYPERLINK_PREVENTDEFAULT_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_HYPERLINK_PREVENTDEFAULT_0050
     * @tc.name   : Add the image subcomponent to the hyperlink component to register preventDefault, and block touch and onclick
     * @tc.desc   : Verify hyperlink preventdefault interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_HYPERLINK_PREVENTDEFAULT_0050', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HYPERLINK_PREVENTDEFAULT_0050 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/HyperLinkPreventDefault/UiComponentHyperLinkPreventDefault05')
      let driver:Driver=Driver.create();
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000)
      let HyperLink: Component = await driver.waitForComponent(ON.id('UiComponentHyperLinkPreventDefault05'),1000);
      await HyperLink.longClick();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HYPERLINK_PREVENTDEFAULT_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_HYPERLINK_PREVENTDEFAULT_0020
     * @tc.name   : The hyperlink component registers preventDefault, which blocks touch and does not block onclick
     * @tc.desc   : Verify hyperlink preventdefault interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_HYPERLINK_PREVENTDEFAULT_0020', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HYPERLINK_PREVENTDEFAULT_0020 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/HyperLinkPreventDefault/UiComponentHyperLinkPreventDefault06')
      let driver:Driver=Driver.create();
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000)
      let HyperLink: Component = await driver.waitForComponent(ON.id('UiComponentHyperLinkPreventDefault06'),1000);
      await HyperLink.longClick();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HYPERLINK_PREVENTDEFAULT_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_HYPERLINK_PREVENTDEFAULT_0070
     * @tc.name   : The hyperlink component refers to the wrong URL registered preventDefault
     * @tc.desc   : Verify hyperlink preventdefault interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_HYPERLINK_PREVENTDEFAULT_0070', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HYPERLINK_PREVENTDEFAULT_0070 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/HyperLinkPreventDefault/UiComponentHyperLinkPreventDefault07')
      let driver:Driver=Driver.create();
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000)
      let HyperLink: Component = await driver.waitForComponent(ON.id('UiComponentHyperLinkPreventDefault07'),1000);
      await HyperLink.longClick();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HYPERLINK_PREVENTDEFAULT_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_HYPERLINK_PREVENTDEFAULT_0080
     * @tc.name   : The hyperlink component does not register preventDefault for URLs that refer to the wrong URL
     * @tc.desc   : Verify hyperlink preventdefault interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_HYPERLINK_PREVENTDEFAULT_0080', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HYPERLINK_PREVENTDEFAULT_0080 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/HyperLinkPreventDefault/UiComponentHyperLinkPreventDefault08')
      let driver:Driver=Driver.create();
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000)
      let HyperLink: Component = await driver.waitForComponent(ON.id('UiComponentHyperLinkPreventDefault08'),1000);
      await HyperLink.longClick();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_HYPERLINK_PREVENTDEFAULT_0080 finish.`);
      done()
    })
  })
}