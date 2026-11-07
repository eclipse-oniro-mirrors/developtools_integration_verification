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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON, Component } from '@kit.TestKit';



export default function componentTextTextInterface() {

  describe('componentTextTextInterface', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_0070
     * @tc.name   : Text组件，decoration属性设置ResourceColor为#0000ff
     * @tc.desc   : Verify text interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_0070', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_0070 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTextInterface/ComponentTextTextInterface0070')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_0070 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_0460
     * @tc.name   : text组件，单行文本align属性设置为Alignment.Start
     * @tc.desc   : Verify text interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_0460', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_0460 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTextInterface/ComponentTextTextInterface0460')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_0460 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_0480
     * @tc.name   : text组件，单行文本align属性设置为Alignment.TopEnd
     * @tc.desc   : Verify text interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_0480', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_0480 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTextInterface/ComponentTextTextInterface0480')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_0480 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_0630
     * @tc.name   : Text组件，设置heightAdaptivePolicy为MAX_LINES_FIRST
     * @tc.desc   : Verify text interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_0630', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_0630 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTextInterface/ComponentTextTextInterface0630')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_0630 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_0750
     * @tc.name   : Text组件，设置maxFontSize($r("app.string.string_value_5"))
     * @tc.desc   : Verify text interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_0750', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_0750 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTextInterface/ComponentTextTextInterface0750')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_0750 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_0920
     * @tc.name   : Text组件，设置minFontSize($r("app.float.float_value_10"))
     * @tc.desc   : Verify text interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_0920', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_0920 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTextInterface/ComponentTextTextInterface0920')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_0920 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1000
     * @tc.name   : Text组件，设置minFontSize($r("app.string.string_value_5"))
     * @tc.desc   : Verify text interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1000', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1000 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTextInterface/ComponentTextTextInterface1000')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1000 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1030
     * @tc.name   : Text组件，设置minFontSize(-5)
     * @tc.desc   : Verify text interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1030', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1030 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTextInterface/ComponentTextTextInterface1030')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1030 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1280
     * @tc.name   : Text组件，设置textIndent("40fp")
     * @tc.desc   : Verify text interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1280', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1280 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTextInterface/ComponentTextTextInterface1280')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1280 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1310
     * @tc.name   : Text组件，设置textIndent(40)
     * @tc.desc   : Verify text interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1310', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1310 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTextInterface/ComponentTextTextInterface1310')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1310 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1340
     * @tc.name   : Text组件，设置textOverflow为Clip，maxLines为0
     * @tc.desc   : Verify text interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1340', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1340 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTextInterface/ComponentTextTextInterface1340')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1340 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1350
     * @tc.name   : Text组件，设置textOverflow为Clip，maxLines为1
     * @tc.desc   : Verify text interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1350', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1350 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTextInterface/ComponentTextTextInterface1350')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1350 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1700
     * @tc.name   : 设置Text多行文本在水平方向的对齐方式为Start
     * @tc.desc   : Verify text interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1700', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1700 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTextInterface/ComponentTextTextInterface1700')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1700 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1760
     * @tc.name   : 设置Text的参数：fontColor为0xff0000
     * @tc.desc   : Verify text interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1760', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1760 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTextInterface/ComponentTextTextInterface1760')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1760 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1780
     * @tc.name   : 设置Text的参数：fontColor为rgb(0,0,255)
     * @tc.desc   : Verify text interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1780', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1780 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTextInterface/ComponentTextTextInterface1780')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1780 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1910
     * @tc.name   : 设置Text的参数：fontStyle为Normal
     * @tc.desc   : Verify text interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1910', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1910 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTextInterface/ComponentTextTextInterface1910')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1910 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1990
     * @tc.name   : 设置Text的参数：fontWeight为FontWeight.Lighter
     * @tc.desc   : Verify text interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1990', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1990 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextTextInterface/ComponentTextTextInterface1990')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXT_INTERFACE_1990 finish.`);
      done()
    })
  })
}