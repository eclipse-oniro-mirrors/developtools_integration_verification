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
import { KeyCode } from '@kit.InputKit'

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

export default function uIAttributesInterfaceReconstitution() {

  describe('uIAttributesInterfaceReconstitution', () => {
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
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0410
     * @tc.name   : Static assignment for renderGroup interface
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0410', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0410 start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_02/UIAttributesInterfaceReconstitution01')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UIAttributesInterfaceReconstitution01_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UIAttributesInterfaceReconstitution01_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UIAttributesInterfaceReconstitution01_03'),1000);
      let button04: Component = await driver.waitForComponent(ON.id('UIAttributesInterfaceReconstitution01_04'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button04.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0410 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0420
     * @tc.name   : Dynamic assignment for renderGroup interface
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0420', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0420 start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_02/UIAttributesInterfaceReconstitution02')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UIAttributesInterfaceReconstitution02_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UIAttributesInterfaceReconstitution02_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      for (let i = 0; i < 2; i++) {
        await button02.click()
        windowSnap.snapShot()
        await Utils.sleep(1000)
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0420 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0510
     * @tc.name   : Static assignment for pixelStretchEffect interface
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0510', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0510 start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_02/UIAttributesInterfaceReconstitution03')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UIAttributesInterfaceReconstitution03_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UIAttributesInterfaceReconstitution03_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UIAttributesInterfaceReconstitution03_03'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0510 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0520
     * @tc.name   : Dynamic assignment for pixelStretchEffect interface
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0520', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0520 start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_02/UIAttributesInterfaceReconstitution04')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UIAttributesInterfaceReconstitution04_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UIAttributesInterfaceReconstitution04_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      for (let i = 0; i < 2; i++) {
        await button02.click()
        windowSnap.snapShot()
        await Utils.sleep(1000)
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0520 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0690
     * @tc.name   : Static assignment for clickEffect interface
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0690', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0690 start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_02/UIAttributesInterfaceReconstitution05')
      let driver:Driver=Driver.create();
      let test: Component = await driver.waitForComponent(ON.id('UIAttributesInterfaceReconstitution05'),1000);
      let button01: Component = await driver.waitForComponent(ON.id('UIAttributesInterfaceReconstitution05_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UIAttributesInterfaceReconstitution05_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UIAttributesInterfaceReconstitution05_03'),1000);
      let button04: Component = await driver.waitForComponent(ON.id('UIAttributesInterfaceReconstitution05_04'),1000);
      await button01.click()
      await test.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button02.click()
      await test.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click()
      await test.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button04.click()
      await test.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0690 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0700
     * @tc.name   : Dynamic assignment for clickEffect interface
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0700', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0700 start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_02/UIAttributesInterfaceReconstitution06')
      let driver:Driver=Driver.create();
      let test: Component = await driver.waitForComponent(ON.id('UIAttributesInterfaceReconstitution06'),1000);
      let button01: Component = await driver.waitForComponent(ON.id('UIAttributesInterfaceReconstitution06_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UIAttributesInterfaceReconstitution06_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      for (let i = 0; i < 4; i++) {
        await button02.click()
        await test.click()
        windowSnap.snapShot()
        await Utils.sleep(500)
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0700 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0770
     * @tc.name   : Static assignment for outlineStyle interface
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0770', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0770 start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_02/UIAttributesInterfaceReconstitution07')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UIAttributesInterfaceReconstitution07_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UIAttributesInterfaceReconstitution07_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UIAttributesInterfaceReconstitution07_03'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0770 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0780
     * @tc.name   : Dynamic assignment for outlineStyle interface
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0780', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0780 start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_02/UIAttributesInterfaceReconstitution08')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UIAttributesInterfaceReconstitution08_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UIAttributesInterfaceReconstitution08_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      for (let i = 0; i < 4; i++) {
        await button02.click()
        windowSnap.snapShot()
        await Utils.sleep(500)
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0780 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0850
     * @tc.name   : Static assignment for motionBlur interface
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0850', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0850 start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_02/UIAttributesInterfaceReconstitution09')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UIAttributesInterfaceReconstitution09_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UIAttributesInterfaceReconstitution09_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UIAttributesInterfaceReconstitution09_03'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button02.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button03.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0850 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0860
     * @tc.name   : Dynamic assignment for motionBlur interface
     * @tc.desc   : Verify attributes interface reconstitution interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0860', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0860 start.`);
      Settings.createWindow('testability/pages/component/common_attr/UIAttributesInterfaceReconstitution_02/UIAttributesInterfaceReconstitution10')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UIAttributesInterfaceReconstitution10_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UIAttributesInterfaceReconstitution10_02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      for (let i = 0; i < 5; i++) {
        await button02.click()
        windowSnap.snapShot()
        await Utils.sleep(500)
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0860 finish.`);
      done()
    })

  })
}