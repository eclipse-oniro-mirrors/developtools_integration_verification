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

export default function uiComponentButtonButtonAttributeUpdater() {

  describe('uiComponentButtonButtonAttributeUpdater', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0130
     * @tc.name   : AttributeUpdater attribute update Button constructor parameters (the 'label' parameter of updateConstructorParams is passed as undefined, the Option parameter is passed with a normal value), with child nodes
     * @tc.desc   : Verify button attributeupdater interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0130 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonAttributeUpdater/UiComponentButtonButtonAttributeUpdater01')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonAttributeUpdater01'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0040
     * @tc.name   : AttributeUpdater attribute update Button constructor parameters (updateConstructorParams passes Option parameter)
     * @tc.desc   : Verify button attributeupdater interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0040 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonAttributeUpdater/UiComponentButtonButtonAttributeUpdater02')
      let driver:Driver=Driver.create();
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonAttributeUpdater02'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button02.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0090
     * @tc.name   : AttributeUpdater attribute update Button constructor parameters (updateConstructorParams does not pass parameters), with child nodes
     * @tc.desc   : Verify button attributeupdater interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0090 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonAttributeUpdater/UiComponentButtonButtonAttributeUpdater03')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonAttributeUpdater03'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button03.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0010
     * @tc.name   : AttributeUpdater attribute update Button constructor parameters (updateConstructorParams does not pass parameters)
     * @tc.desc   : Verify button attributeupdater interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0010 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonAttributeUpdater/UiComponentButtonButtonAttributeUpdater04')
      let driver:Driver=Driver.create();
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonAttributeUpdater04'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button04.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0140
     * @tc.name   : AttributeUpdater attribute update Button constructor parameters (the 'label' parameter of updateConstructorParams is passed with a normal value, the Option parameter is passed as undefined), with child nodes
     * @tc.desc   : Verify button attributeupdater interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0140 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonAttributeUpdater/UiComponentButtonButtonAttributeUpdater05')
      let driver:Driver=Driver.create();
      let button05: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonAttributeUpdater05'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button05.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0120
     * @tc.name   : AttributeUpdater attribute update Button constructor parameters (updateConstructorParams passes Option parameter), with child nodes
     * @tc.desc   : Verify button attributeupdater interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0120 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonAttributeUpdater/UiComponentButtonButtonAttributeUpdater06')
      let driver:Driver=Driver.create();
      let button06: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonAttributeUpdater06'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button06.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0170
     * @tc.name   : AttributeUpdater attribute update Button constructor parameters (updateConstructorParams does not pass parameters, non-Option set parameters)
     * @tc.desc   : Verify button attributeupdater interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0170 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonAttributeUpdater/UiComponentButtonButtonAttributeUpdater07')
      let driver:Driver=Driver.create();
      let button07: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonAttributeUpdater07'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button07.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0150
     * @tc.name   : AttributeUpdater attribute update Button constructor parameters (the 'label' parameter of updateConstructorParams is passed with a normal value, the Option parameter is passed with a normal value), with child nodes
     * @tc.desc   : Verify button attributeupdater interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0150 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonAttributeUpdater/UiComponentButtonButtonAttributeUpdater08')
      let driver:Driver=Driver.create();
      let button08: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonAttributeUpdater08'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button08.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0180
     * @tc.name   : AttributeUpdater attribute update Button constructor parameters (the Option parameter of updateConstructorParams is passed with an abnormal value)
     * @tc.desc   : Verify button attributeupdater interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0180 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonAttributeUpdater/UiComponentButtonButtonAttributeUpdater09')
      let driver:Driver=Driver.create();
      let button09: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonAttributeUpdater09'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button09.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0190
     * @tc.name   : AttributeUpdater attribute update Button constructor parameters (any parameter of the Option of updateConstructorParams is passed with an abnormal value)
     * @tc.desc   : Verify button attributeupdater interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0190 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonAttributeUpdater/UiComponentButtonButtonAttributeUpdater10')
      let driver:Driver=Driver.create();
      let button10: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonAttributeUpdater10'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button10.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0080
     * @tc.name   : AttributeUpdater attribute update Button constructor parameters (the 'label' parameter of updateConstructorParams is passed as undefined, the Option parameter is passed as undefined)
     * @tc.desc   : Verify button attributeupdater interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0080 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonAttributeUpdater/UiComponentButtonButtonAttributeUpdater11')
      let driver:Driver=Driver.create();
      let button11: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonAttributeUpdater11'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button11.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0050
     * @tc.name   : AttributeUpdater attribute update Button constructor parameters (the 'label' parameter of updateConstructorParams is passed as undefined, the Option parameter is passed with a normal value)
     * @tc.desc   : Verify button attributeupdater interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0050 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonAttributeUpdater/UiComponentButtonButtonAttributeUpdater12')
      let driver:Driver=Driver.create();
      let button12: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonAttributeUpdater12'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button12.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0160
     * @tc.name   : AttributeUpdater attribute update Button constructor parameters (the 'label' parameter of updateConstructorParams is passed as undefined, the Option parameter is passed as undefined), with child nodes
     * @tc.desc   : Verify button attributeupdater interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0160 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonAttributeUpdater/UiComponentButtonButtonAttributeUpdater13')
      let driver:Driver=Driver.create();
      let button13: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonAttributeUpdater13'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button13.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0030
     * @tc.name   : AttributeUpdater attribute update Button constructor parameters (updateConstructorParams passes label parameter)
     * @tc.desc   : Verify button attributeupdater interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0030 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonAttributeUpdater/UiComponentButtonButtonAttributeUpdater14')
      let driver:Driver=Driver.create();
      let button14: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonAttributeUpdater14'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button14.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0020
     * @tc.name   : AttributeUpdater attribute update Button constructor parameters (updateConstructorParams passes undefined parameter)
     * @tc.desc   : Verify button attributeupdater interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0020 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonAttributeUpdater/UiComponentButtonButtonAttributeUpdater15')
      let driver:Driver=Driver.create();
      let button15: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonAttributeUpdater15'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button15.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0070
     * @tc.name   : AttributeUpdater attribute update Button constructor parameters (the 'label' parameter of updateConstructorParams is passed with a normal value, the Option parameter is passed with a normal value)
     * @tc.desc   : Verify button attributeupdater interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0070 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonAttributeUpdater/UiComponentButtonButtonAttributeUpdater16')
      let driver:Driver=Driver.create();
      let button16: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonAttributeUpdater16'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button16.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0100
     * @tc.name   : AttributeUpdater attribute update Button constructor parameters (updateConstructorParams passes undefined parameter), with child nodes
     * @tc.desc   : Verify button attributeupdater interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0100 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonAttributeUpdater/UiComponentButtonButtonAttributeUpdater17')
      let driver:Driver=Driver.create();
      let button17: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonAttributeUpdater17'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button17.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0060
     * @tc.name   : AttributeUpdater attribute update Button constructor parameters (the 'label' parameter of updateConstructorParams is passed with a normal value, the Option parameter is passed as undefined)
     * @tc.desc   : Verify button attributeupdater interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0060 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonAttributeUpdater/UiComponentButtonButtonAttributeUpdater18')
      let driver:Driver=Driver.create();
      let button18: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonAttributeUpdater18'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button18.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0110
     * @tc.name   : AttributeUpdater attribute update Button constructor parameters (updateConstructorParams passes label parameter), with child nodes
     * @tc.desc   : Verify button attributeupdater interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0110 start.`);
      Settings.createWindow('testability/pages/component/button/ButtonButtonAttributeUpdater/UiComponentButtonButtonAttributeUpdater19')
      let driver:Driver=Driver.create();
      let button19: Component = await driver.waitForComponent(ON.id('UiComponentButtonButtonAttributeUpdater19'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button19.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_ATTRIBUTEUPDATER_0110 finish.`);
      done()
    })
  })
}