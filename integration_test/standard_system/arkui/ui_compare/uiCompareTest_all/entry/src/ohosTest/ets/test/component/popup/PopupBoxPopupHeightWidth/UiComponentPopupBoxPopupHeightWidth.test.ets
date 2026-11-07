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

export default function uiComponentPopupBoxPopupHeightWidth() {

  describe('uiComponentPopupBoxPopupHeightWidth', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0010
     * @tc.name   : The popup adds a width attribute, and the width parameter of PopupOptions is set to '50px'.
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0010 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupHeightWidthAlt/UiComponentPopupBoxPopupHeightWidth01')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupHeightWidth01'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0100
     * @tc.name   : The popup adds a width attribute, and the width parameter of PopupOptions is set to '50lpx'.
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0100', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0100 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupHeightWidthAlt/UiComponentPopupBoxPopupHeightWidth02')
      let driver:Driver=Driver.create();
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupHeightWidth02'),1000);
      await button02.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0150
     * @tc.name   : The popup adds a width attribute, and the width parameter of PopupOptions is set to '-50%'.
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0150', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0150 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupHeightWidthAlt/UiComponentPopupBoxPopupHeightWidth03')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupHeightWidth03'),1000);
      await button03.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0070
     * @tc.name   : The popup adds a width attribute, and the width parameter of PopupOptions is set to '50fp'.
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0070', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0070 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupHeightWidthAlt/UiComponentPopupBoxPopupHeightWidth04')
      let driver:Driver=Driver.create();
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupHeightWidth04'),1000);
      await button04.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0110
     * @tc.name   : The popup adds a width attribute, and the width parameter of PopupOptions is set to '0lpx'.
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0110', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0110 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupHeightWidthAlt/UiComponentPopupBoxPopupHeightWidth05')
      let driver:Driver=Driver.create();
      let button05: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupHeightWidth05'),1000);
      await button05.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0050
     * @tc.name   : The popup adds a width attribute, and the width parameter of PopupOptions is set to '0vp'.
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0050', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0050 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupHeightWidthAlt/UiComponentPopupBoxPopupHeightWidth06')
      let driver:Driver=Driver.create();
      let button06: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupHeightWidth06'),1000);
      await button06.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0040
     * @tc.name   : The popup adds a width attribute, and the width parameter of PopupOptions is set to '50vp'.
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0040', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0040 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupHeightWidthAlt/UiComponentPopupBoxPopupHeightWidth07')
      let driver:Driver=Driver.create();
      let button07: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupHeightWidth07'),1000);
      await button07.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0090
     * @tc.name   : The popup adds a width attribute, and the width parameter of PopupOptions is set to '-50fp'.
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0090', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0090 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupHeightWidthAlt/UiComponentPopupBoxPopupHeightWidth08')
      let driver:Driver=Driver.create();
      let button08: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupHeightWidth08'),1000);
      await button08.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0130
     * @tc.name   : The popup adds a width attribute, and the width parameter of PopupOptions is set to '80%'.
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0130', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0130 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupHeightWidthAlt/UiComponentPopupBoxPopupHeightWidth09')
      let driver:Driver=Driver.create();
      let button09: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupHeightWidth09'),1000);
      await button09.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0030
     * @tc.name   : The popup adds a width attribute, and the width parameter of PopupOptions is set to '-50px'.
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0030', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0030 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupHeightWidthAlt/UiComponentPopupBoxPopupHeightWidth10')
      let driver:Driver=Driver.create();
      let button10: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupHeightWidth10'),1000);
      await button10.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0030 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0020
     * @tc.name   : The popup adds a width attribute, and the width parameter of PopupOptions is set to '0px'.
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0020', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0020 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupHeightWidthAlt/UiComponentPopupBoxPopupHeightWidth11')
      let driver:Driver=Driver.create();
      let button11: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupHeightWidth11'),1000);
      await button11.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0120
     * @tc.name   : The popup adds a width attribute, and the width parameter of PopupOptions is set to '-50lpx'.
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0120', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0120 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupHeightWidthAlt/UiComponentPopupBoxPopupHeightWidth13')
      let driver:Driver=Driver.create();
      let button13: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupHeightWidth13'),1000);
      await button13.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0060
     * @tc.name   : The popup adds a width attribute, and the width parameter of PopupOptions is set to '-50vp'.
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0060', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0060 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupHeightWidthAlt/UiComponentPopupBoxPopupHeightWidth14')
      let driver:Driver=Driver.create();
      let button14: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupHeightWidth14'),1000);
      await button14.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0080
     * @tc.name   : The popup adds a width attribute, and the width parameter of PopupOptions is set to '-0fp'.
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0080', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0080 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxPopupHeightWidthAlt/UiComponentPopupBoxPopupHeightWidth15')
      let driver:Driver=Driver.create();
      let button15: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxPopupHeightWidth15'),1000);
      await button15.click()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0080 finish.`);
      done()
    })

  })
}