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


export default function componentTextSpanInterface() {

  describe('componentTextSpanInterface', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0010
     * @tc.name   : Span组件布局测试，组件大小
     * @tc.desc   : Verify text span interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0010', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0010 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextSpanInterface/ComponentTextSpanInterface0010')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0010 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0016
     * @tc.name   : 设置Span的属性，设置textFont的weight为FontWeight.Regular
     * @tc.desc   : Verify text span interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0016', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0016 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextSpanInterface/ComponentTextSpanInterface0016')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0016 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0017
     * @tc.name   : 设置Span的属性：fontColor为#ff0000
     * @tc.desc   : Verify text span interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0017', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0017 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextSpanInterface/ComponentTextSpanInterface0017')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0017 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0028
     * @tc.name   : 设置Span的属性：fontSize(9)
     * @tc.desc   : Verify text span interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0028', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0028 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextSpanInterface/ComponentTextSpanInterface0028')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0028 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0039
     * @tc.name   : 设置Span的属性：fontWeight为450
     * @tc.desc   : Verify text span interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0039', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0039 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextSpanInterface/ComponentTextSpanInterface0039')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0039 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0042
     * @tc.name   : 设置Span的属性：fontWeight为FontWeight.Lighter
     * @tc.desc   : Verify text span interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0042', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0042 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextSpanInterface/ComponentTextSpanInterface0042')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0042 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0050
     * @tc.name   : 设置Span的属性：textCase(TextCase.UpperCase)，文本内容全大写
     * @tc.desc   : Verify text span interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0050', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0050 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextSpanInterface/ComponentTextSpanInterface0050')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0050 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0052
     * @tc.name   : 设置Span组件：decoration属性不设置ResourceColor
     * @tc.desc   : Verify text span interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0052', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0052 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextSpanInterface/ComponentTextSpanInterface0052')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0052 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0066
     * @tc.name   : 设置Span组件：letterSpacing("10fp")
     * @tc.desc   : Verify text span interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0066', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0066 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextSpanInterface/ComponentTextSpanInterface0066')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0066 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0075
     * @tc.name   : 设置Span组件：lineHeight属性为0
     * @tc.desc   : Verify text span interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0075', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0075 start.`);
      Settings.createWindow('testability/pages/component/text/ComponentTextSpanInterface/ComponentTextSpanInterface0075')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_INTERFACE_0075 finish.`);
      done()
    })
  })
}