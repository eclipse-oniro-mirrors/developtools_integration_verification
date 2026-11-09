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

export default function uiComponentPopupBoxSpecificationsCustomClose() {

  describe('uiComponentPopupBoxSpecificationsCustomClose', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0160
     * @tc.name   : Verify that in the openCustomDialogWithController popup scenario with all parameters in ParamsNode, when set to the enum Value 8, it displays correctly and the dialog can be closed normally.
     * @tc.desc   : Verify popupbox specifications customclose interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0160', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0160 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsCustomClose/UiComponentPopupBoxSpecificationsCustomClose01')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsCustomClose01_03'),1000);
      await button03.click();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsCustomClose01_01'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click();
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsCustomClose01_02'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0140
     * @tc.name   : Verify that in the openCustomDialogWithController popup scenario with all parameters in ParamsNode, when set to the enum Value 6, it displays correctly and the dialog can be closed normally.
     * @tc.desc   : Verify popupbox specifications customclose interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0140', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0140 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsCustomClose/UiComponentPopupBoxSpecificationsCustomClose02')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsCustomClose02_03'),1000);
      await button03.click();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsCustomClose02_01'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click();
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsCustomClose02_02'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0130
     * @tc.name   : Verify that in the openCustomDialogWithController popup scenario with all parameters in ParamsNode, when set to maskColor: $r("sys.color.ohos_id_color_emphasize"),, it displays correctly and the dialog can be closed normally.
     * @tc.desc   : Verify popupbox specifications customclose interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0130', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0130 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsCustomClose/UiComponentPopupBoxSpecificationsCustomClose03')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsCustomClose03_03'),1000);
      await button03.click();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsCustomClose03_01'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click();
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsCustomClose03_02'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0170
     * @tc.name   : Verify that in the openCustomDialogWithController popup scenario with all parameters in ParamsNode, when set to Style 9, it displays correctly and the dialog can be closed normally.
     * @tc.desc   : Verify popupbox specifications customclose interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0170', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0170 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsCustomClose/UiComponentPopupBoxSpecificationsCustomClose04')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsCustomClose04_03'),1000);
      await button03.click();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsCustomClose04_01'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click();
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsCustomClose04_02'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0190
     * @tc.name   : Verify that in the openCustomDialogWithController popup scenario with all parameters in ParamsNode, when set to Style 9, it displays correctly and the dialog can be closed normally.
     * @tc.desc   : Verify popupbox specifications customclose interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0190', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0190 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsCustomClose/UiComponentPopupBoxSpecificationsCustomClose05')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsCustomClose05_03'),1000);
      await button03.click();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsCustomClose05_01'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click();
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsCustomClose05_02'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0200
     * @tc.name   : Verify that in the presentCustomDialog CustomBuilderWithId parameter popup scenario, when set to the enum Value 12, it displays correctly and the dialog can be closed normally.
     * @tc.desc   : Verify popupbox specifications customclose interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0200', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0200 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsCustomClose/UiComponentPopupBoxSpecificationsCustomClose06')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsCustomClose06_01'),1000);
      await button03.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsCustomClose06_02'),1000);
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click();
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentPopupBoxSpecificationsCustomClose06_03'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0180
     * @tc.name   : Verify that in the presentCustomDialog+CustomBuilderWithId parameter popup scenario with all parameters, when set to the enum Value 10, it displays correctly and the dialog can be closed normally.
     * @tc.desc   : Verify popupbox specifications customclose interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0180', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0180 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsCustomClose/UiComponentPopupBoxSpecificationsCustomClose07')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose07_01'),1000);
      await button03.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      let button01: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose07_02'),1000);
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click();
      let button02: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose07_03'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0220
     * @tc.name   : Verify that in the presentCustomDialog+CustomBuilderWithId parameter popup scenario with all parameters, when set to the enum Value 2, it displays correctly and the dialog can be closed normally.
     * @tc.desc   : Verify popupbox specifications customclose interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0220', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0220 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsCustomClose/UiComponentPopupBoxSpecificationsCustomClose08')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose08_01'),1000);
      await button03.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      let button01: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose08_02'),1000);
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click();
      let button02: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose08_03'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0230
     * @tc.name   : Verify that in the presentCustomDialog+CustomBuilderWithId parameter popup scenario with all parameters, when set to the enum Value 3, it displays correctly and the dialog can be closed normally.
     * @tc.desc   : Verify popupbox specifications customclose interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0230', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0230 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsCustomClose/UiComponentPopupBoxSpecificationsCustomClose09')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose09_01'),1000);
      await button03.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      let button01: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose09_02'),1000);
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click();
      let button02: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose09_03'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0210
     * @tc.name   : Verify that in the presentCustomDialog+CustomBuilderWithId parameter popup scenario with all parameters, when set to the enum Value 13, it displays correctly and the dialog can be closed normally.
     * @tc.desc   : Verify popupbox specifications customclose interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0210', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0210 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsCustomClose/UiComponentPopupBoxSpecificationsCustomClose11')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose11_01'),1000);
      await button03.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      let button01: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose11_02'),1000);
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click();
      let button02: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose11_03'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0240
     * @tc.name   : Verify that in the presentCustomDialog+CustomBuilderWithId parameter popup scenario with all parameters, when set to the enum Value 4, it displays correctly and the dialog can be closed normally.
     * @tc.desc   : Verify popupbox specifications customclose interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0240', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0240 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsCustomClose/UiComponentPopupBoxSpecificationsCustomClose10')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose10_01'),1000);
      await button03.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      let button01: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose10_02'),1000);
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click();
      let button02: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose10_03'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0250
     * @tc.name   : Verify that in the presentCustomDialog+CustomBuilderWithId parameter popup scenario with all parameters, when set to the enum Value 5, it displays correctly and the dialog can be closed normally.
     * @tc.desc   : Verify popupbox specifications customclose interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0250', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0250 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsCustomClose/UiComponentPopupBoxSpecificationsCustomClose13')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose13_01'),1000);
      await button03.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      let button01: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose13_02'),1000);
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click();
      let button02: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose13_03'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0260
     * @tc.name   : Verify that in the presentCustomDialog+CustomBuilderWithId parameter popup scenario with all parameters, when set to the enum Value 6, it displays correctly and the dialog can be closed normally.
     * @tc.desc   : Verify popupbox specifications customclose interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0260', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0260 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsCustomClose/UiComponentPopupBoxSpecificationsCustomClose12')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose12_01'),1000);
      await button03.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      let button01: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose12_02'),1000);
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click();
      let button02: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose12_03'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0270
     * @tc.name   : Verify that in the presentCustomDialog+CustomBuilderWithId parameter popup scenario with all parameters, when set to the enum Value 7, it displays correctly and the dialog can be closed normally.
     * @tc.desc   : Verify popupbox specifications customclose interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0270', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0270 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsCustomClose/UiComponentPopupBoxSpecificationsCustomClose15')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose15_01'),1000);
      await button03.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      let button01: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose15_02'),1000);
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click();
      let button02: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose15_03'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0280
     * @tc.name   : Verify that in the presentCustomDialog+CustomBuilderWithId parameter popup scenario with all parameters, when set to the enum Value 8, it displays correctly and the dialog can be closed normally.
     * @tc.desc   : Verify popupbox specifications customclose interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0280', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0280 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsCustomClose/UiComponentPopupBoxSpecificationsCustomClose14')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose14_01'),1000);
      await button03.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      let button01: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose14_02'),1000);
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click();
      let button02: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose14_03'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0290
     * @tc.name   : Verify that in the presentCustomDialog+CustomBuilderWithId parameter popup scenario with all parameters, when set to the enum Value 9, it displays correctly and the dialog can be closed normally.
     * @tc.desc   : Verify popupbox specifications customclose interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0290', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0290 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsCustomClose/UiComponentPopupBoxSpecificationsCustomClose16')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose16_01'),1000);
      await button03.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      let button01: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose16_02'),1000);
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click();
      let button02: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose16_03'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0290 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0320
     * @tc.name   : Verify that in the presentCustomDialog CustomBuilder popup scenario, when set to enum Value 12, it displays correctly and the dialog can be closed normally.
     * @tc.desc   : Verify popupbox specifications customclose interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0320', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0320 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsCustomClose/UiComponentPopupBoxSpecificationsCustomClose17')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose17_01'),1000);
      await button03.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      let button01: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose17_02'),1000);
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click();
      let button02: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose17_03'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0320 finish.`);
      done()
    })

        /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0300
     * @tc.name   : Verify that in the presentCustomDialog+CustomBuilder parameter popup scenario with all parameters, when set to the enum Value 10, it displays correctly and the dialog can be closed normally.
     * @tc.desc   : Verify popupbox specifications customclose interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0300', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0300 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsCustomClose/UiComponentPopupBoxSpecificationsCustomClose18')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose18_01'),1000);
      await button03.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      let button01: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose18_02'),1000);
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click();
      let button02: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose18_03'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0310
     * @tc.name   : Verify that in the presentCustomDialog+CustomBuilder parameter popup scenario with all parameters, when set to the enum Value 11, it displays correctly and the dialog can be closed normally.
     * @tc.desc   : Verify popupbox specifications customclose interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0310', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0310 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsCustomClose/UiComponentPopupBoxSpecificationsCustomClose19')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose19_01'),1000);
      await button03.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      let button01: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose19_02'),1000);
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click();
      let button02: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose19_03'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0330
     * @tc.name   : Verify that in the presentCustomDialog+CustomBuilder parameter popup scenario with all parameters, when set to the enum Value 13, it displays correctly and the dialog can be closed normally.
     * @tc.desc   : Verify popupbox specifications customclose interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0330', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0330 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsCustomClose/UiComponentPopupBoxSpecificationsCustomClose20')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose20_01'),1000);
      await button03.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      let button01: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose20_02'),1000);
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click();
      let button02: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose20_03'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)  
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0340
     * @tc.name   : Verify that in the presentCustomDialog+CustomBuilder parameter popup scenario with all parameters, when set to the enum Value 2, it displays correctly and the dialog can be closed normally.
     * @tc.desc   : Verify popupbox specifications customclose interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0340', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0340 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsCustomClose/UiComponentPopupBoxSpecificationsCustomClose21')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose21_01'),1000);
      await button03.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      let button01: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose21_02'),1000);
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click();
      let button02: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose21_03'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0350
     * @tc.name   : Verify that in the presentCustomDialog+CustomBuilder parameter popup scenario with all parameters, when set to the enum Value 3, it displays correctly and the dialog can be closed normally.
     * @tc.desc   : Verify popupbox specifications customclose interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0350', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0350 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsCustomClose/UiComponentPopupBoxSpecificationsCustomClose22')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose22_01'),1000);
      await button03.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      let button01: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose22_02'),1000);
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click();
      let button02: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose22_03'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0350 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0360
     * @tc.name   : Verify that in the presentCustomDialog+CustomBuilder parameter popup scenario with all parameters, when set to the enum Value 4, it displays correctly and the dialog can be closed normally.
     * @tc.desc   : Verify popupbox specifications customclose interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0360', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0360 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsCustomClose/UiComponentPopupBoxSpecificationsCustomClose23')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose23_01'),1000);
      await button03.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      let button01: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose23_02'),1000);
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click();
      let button02: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose23_03'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0360 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0370
     * @tc.name   : Verify that in the presentCustomDialog+CustomBuilder parameter popup scenario with all parameters, when set to the enum Value 5, it displays correctly and the dialog can be closed normally.
     * @tc.desc   : Verify popupbox specifications customclose interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0370', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0370 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsCustomClose/UiComponentPopupBoxSpecificationsCustomClose24')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose24_01'),1000);
      await button03.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      let button01: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose24_02'),1000);
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click();
      let button02: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose24_03'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0370 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0380
     * @tc.name   : Verify that in the presentCustomDialog+CustomBuilder parameter popup scenario with all parameters, when set to the enum Value 6, it displays correctly and the dialog can be closed normally.
     * @tc.desc   : Verify popupbox specifications customclose interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0380', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0380 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsCustomClose/UiComponentPopupBoxSpecificationsCustomClose25')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose25_01'),1000);
      await button03.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      let button01: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose25_02'),1000);
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click();
      let button02: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose25_03'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0380 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0390
     * @tc.name   : Verify that in the presentCustomDialog+CustomBuilder parameter popup scenario with all parameters, when set to the enum Value 7, it displays correctly and the dialog can be closed normally.
     * @tc.desc   : Verify popupbox specifications customclose interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0390', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0390 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsCustomClose/UiComponentPopupBoxSpecificationsCustomClose26')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose26_01'),1000);
      await button03.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      let button01: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose26_02'),1000);
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click();
      let button02: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose26_03'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0390 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0400
     * @tc.name   : Verify that in the presentCustomDialog+CustomBuilder parameter popup scenario with all parameters, when set to the enum Value 8, it displays correctly and the dialog can be closed normally.
     * @tc.desc   : Verify popupbox specifications customclose interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0400', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0400 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsCustomClose/UiComponentPopupBoxSpecificationsCustomClose27')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose27_01'),1000);
      await button03.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      let button01: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose27_02'),1000);
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click();
      let button02: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose27_03'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0400 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0410
     * @tc.name   : Verify that in the presentCustomDialog+CustomBuilder parameter popup scenario with all parameters, when set to the enum Value 9, it displays correctly and the dialog can be closed normally.
     * @tc.desc   : Verify popupbox specifications customclose interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0410', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0410 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxSpecificationsCustomClose/UiComponentPopupBoxSpecificationsCustomClose28')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose28_01'),1000);
      await button03.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      let button01: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose28_02'),1000);
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click();
      let button02: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxSpecificationsCustomClose28_03'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_CUSTOMCLOSE_0410 finish.`);
      done()
    })

  })
}