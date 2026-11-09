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
import { BusinessError } from '@kit.BasicServicesKit'

export default function xComponentSurfaceRectTest() {

  describe('xComponentSurfaceRectTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err: BusinessError) => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0170
     * @tc.name   : Xcomponent ai
     * @tc.desc   : Verify xcomponent ai interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0170 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/xcomponent/xcomponent01');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      
      // 等待XComponent组件出现
      let xComponent: Component = await driver.waitForComponent(ON.id('surface_xcomponent'), 1000);
      expect(xComponent).not().assertNull();
      
      // 点击不同的offsetX按钮进行测试
      let button1: Component = await driver.waitForComponent(ON.id('xcomponent01_button1'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0170_01')
      await Utils.sleep(1000)
      
      let button2: Component = await driver.waitForComponent(ON.id('xcomponent01_button2'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0170_02')
      await Utils.sleep(1000)
      
      let button3: Component = await driver.waitForComponent(ON.id('xcomponent01_button3'), 1000);
      await button3.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0170_03')
      await Utils.sleep(1000)
      
      let button6: Component = await driver.waitForComponent(ON.id('xcomponent01_button6'), 1000);
      await button6.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0170_04')
      await Utils.sleep(1000)
      
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0180
     * @tc.name   : Xcomponent ai
     * @tc.desc   : Verify xcomponent ai interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0180 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/xcomponent/xcomponent02')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      
      // 等待XComponent组件出现
      let xComponent: Component = await driver.waitForComponent(ON.id('surface_xcomponent'), 1000);
      expect(xComponent).not().assertNull();
      
      // 点击不同的offsetY按钮进行测试
      let button1: Component = await driver.waitForComponent(ON.id('xcomponent02_button1'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0180_01')
      await Utils.sleep(1000)
      
      let button2: Component = await driver.waitForComponent(ON.id('xcomponent02_button2'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0180_02')
      await Utils.sleep(1000)

      let button3: Component = await driver.waitForComponent(ON.id('xcomponent02_button3'), 1000);
      await button3.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0180_03')
      await Utils.sleep(1000)

      let button6: Component = await driver.waitForComponent(ON.id('xcomponent02_button6'), 1000);
      await button6.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0180_04')
      await Utils.sleep(1000)
      
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0190
     * @tc.name   : Xcomponent ai
     * @tc.desc   : Verify xcomponent ai interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0190 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/xcomponent/xcomponent03')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      
      // 等待XComponent组件出现
      let xComponent: Component = await driver.waitForComponent(ON.id('surface_xcomponent'), 1000);
      expect(xComponent).not().assertNull();
      
      // 点击不同的surfaceWidth按钮进行测试
      let button1: Component = await driver.waitForComponent(ON.id('xcomponent03_button1'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0190_01')
      await Utils.sleep(1000)
      
      let button3: Component = await driver.waitForComponent(ON.id('xcomponent03_button3'), 1000);
      await button3.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0190_02')
      await Utils.sleep(1000)
      
      let button6: Component = await driver.waitForComponent(ON.id('xcomponent03_button6'), 1000);
      await button6.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0190_03')
      await Utils.sleep(1000)
      
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0200
     * @tc.name   : Xcomponent ai
     * @tc.desc   : Verify xcomponent ai interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0200 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/xcomponent/xcomponent04')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      
      // 等待XComponent组件出现
      let xComponent: Component = await driver.waitForComponent(ON.id('surface_xcomponent'), 1000);
      expect(xComponent).not().assertNull();
      
      // 点击不同的surfaceHeight按钮进行测试
      let button1: Component = await driver.waitForComponent(ON.id('xcomponent04_button1'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0200_01')
      await Utils.sleep(1000)
      
      let button3: Component = await driver.waitForComponent(ON.id('xcomponent04_button3'), 1000);
      await button3.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0200_02')
      await Utils.sleep(1000)
      
      let button6: Component = await driver.waitForComponent(ON.id('xcomponent04_button6'), 1000);
      await button6.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0200_03')
      await Utils.sleep(1000)
      
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0210
     * @tc.name   : Xcomponent ai
     * @tc.desc   : Verify xcomponent ai interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0210 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/xcomponent/xcomponent05')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      
      // 等待XComponent组件出现
      let xComponent: Component = await driver.waitForComponent(ON.id('surface_xcomponent'), 1000);
      expect(xComponent).not().assertNull();
      
      // 点击按钮重新设置Surface区域
      let button1: Component = await driver.waitForComponent(ON.id('xcomponent05_button1'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0210_01')
      await Utils.sleep(1000)
      
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0220
     * @tc.name   : Xcomponent ai
     * @tc.desc   : Verify xcomponent ai interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0220 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/xcomponent/xcomponent06')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      
      // 等待XComponent组件出现
      let xComponent: Component = await driver.waitForComponent(ON.id('surface_xcomponent'), 1000);
      expect(xComponent).not().assertNull();
      
      // 点击按钮重新设置Surface区域
      let button1: Component = await driver.waitForComponent(ON.id('xcomponent06_button1'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0220_01')
      await Utils.sleep(1000)
      
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0240
     * @tc.name   : Xcomponent ai
     * @tc.desc   : Verify xcomponent ai interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0240 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/xcomponent/xcomponent07')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      
      // 等待XComponent组件出现
      let xComponent: Component = await driver.waitForComponent(ON.id('surface_xcomponent'), 1000);
      expect(xComponent).not().assertNull();
      
      // 测试异常值
      let button1: Component = await driver.waitForComponent(ON.id('xcomponent07_button1'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0240_01')
      
      let button2: Component = await driver.waitForComponent(ON.id('xcomponent07_button2'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0240_02')
      
      let button3: Component = await driver.waitForComponent(ON.id('xcomponent07_button3'), 1000);
      await button3.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0240_03')
      
      let button7: Component = await driver.waitForComponent(ON.id('xcomponent07_button7'), 1000);
      await button7.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0240_04')
      
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0250
     * @tc.name   : Xcomponent ai
     * @tc.desc   : Verify xcomponent ai interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0250 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/xcomponent/xcomponent08')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      
      // 等待XComponent组件出现
      let xComponent: Component = await driver.waitForComponent(ON.id('texture_xcomponent'), 1000);
      expect(xComponent).not().assertNull();
      
      // 点击不同的offsetX按钮进行测试
      let button1: Component = await driver.waitForComponent(ON.id('xcomponent08_button1'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0250_01')
      
      let button2: Component = await driver.waitForComponent(ON.id('xcomponent08_button2'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0250_02')
      
      let button3: Component = await driver.waitForComponent(ON.id('xcomponent08_button3'), 1000);
      await button3.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0250_03')
      
      let button6: Component = await driver.waitForComponent(ON.id('xcomponent08_button6'), 1000);
      await button6.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0250_04')
      
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0260
     * @tc.name   : Xcomponent ai
     * @tc.desc   : Verify xcomponent ai interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0260 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/xcomponent/xcomponent09')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      
      // 等待XComponent组件出现
      let xComponent: Component = await driver.waitForComponent(ON.id('texture_xcomponent'), 1000);
      expect(xComponent).not().assertNull();
      
      // 点击不同的offsetY按钮进行测试
      let button1: Component = await driver.waitForComponent(ON.id('xcomponent09_button1'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0260_01')
      
      let button2: Component = await driver.waitForComponent(ON.id('xcomponent09_button2'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0260_02')
      
      let button3: Component = await driver.waitForComponent(ON.id('xcomponent09_button3'), 1000);
      await button3.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0260_03')
      
      let button6: Component = await driver.waitForComponent(ON.id('xcomponent09_button6'), 1000);
      await button6.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0260_04')
      
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0270
     * @tc.name   : Xcomponent ai
     * @tc.desc   : Verify xcomponent ai interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0270 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/xcomponent/xcomponent10')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      
      // 等待XComponent组件出现
      let xComponent: Component = await driver.waitForComponent(ON.id('texture_xcomponent'), 1000);
      expect(xComponent).not().assertNull();
      
      // 点击不同的surfaceWidth按钮进行测试
      let button1: Component = await driver.waitForComponent(ON.id('xcomponent10_button1'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0270_01')
      
      let button3: Component = await driver.waitForComponent(ON.id('xcomponent10_button3'), 1000);
      await button3.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0270_02')
      
      let button6: Component = await driver.waitForComponent(ON.id('xcomponent10_button6'), 1000);
      await button6.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0270_03')
      
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0280
     * @tc.name   : Xcomponent ai
     * @tc.desc   : Verify xcomponent ai interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0280 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/xcomponent/xcomponent11')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      
      // 等待XComponent组件出现
      let xComponent: Component = await driver.waitForComponent(ON.id('texture_xcomponent'), 1000);
      expect(xComponent).not().assertNull();
      
      // 点击不同的surfaceHeight按钮进行测试
      let button1: Component = await driver.waitForComponent(ON.id('xcomponent11_button1'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0280_01')
      
      let button3: Component = await driver.waitForComponent(ON.id('xcomponent11_button3'), 1000);
      await button3.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0280_02')
      
      let button6: Component = await driver.waitForComponent(ON.id('xcomponent11_button6'), 1000);
      await button6.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0280_03')
      
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0290
     * @tc.name   : Xcomponent ai
     * @tc.desc   : Verify xcomponent ai interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0290 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/xcomponent/xcomponent12')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      
      // 等待XComponent组件出现
      let xComponent: Component = await driver.waitForComponent(ON.id('texture_xcomponent'), 1000);
      expect(xComponent).not().assertNull();
      
      // 点击按钮重新设置Surface区域
      let button1: Component = await driver.waitForComponent(ON.id('xcomponent12_button1'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0290_01')
      
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0290 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0300
     * @tc.name   : Xcomponent ai
     * @tc.desc   : Verify xcomponent ai interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0300 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/xcomponent/xcomponent13')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      
      // 等待XComponent组件出现
      let xComponent: Component = await driver.waitForComponent(ON.id('texture_xcomponent'), 1000);
      expect(xComponent).not().assertNull();
      
      // 点击按钮重新设置Surface区域
      let button1: Component = await driver.waitForComponent(ON.id('xcomponent13_button1'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0300_01')
      
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_XCOMPONENT_AI_0300 finish.`);
      done()
    })

  })
}