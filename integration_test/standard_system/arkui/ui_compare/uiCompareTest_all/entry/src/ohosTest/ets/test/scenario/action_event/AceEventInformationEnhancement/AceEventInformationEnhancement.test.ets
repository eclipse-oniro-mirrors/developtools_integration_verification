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
import { Driver, ON, Component, MouseButton, PointerMatrix } from '@kit.TestKit'
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

export default function aceEventInformationEnhancement() {

  describe('aceEventInformationEnhancement', () => {
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
     * @tc.number : SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_001
     * @tc.name   : Check if the current finger press duration is displayed correctly
     * @tc.desc   : Verify event information enhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_001', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_001 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceEventInformationEnhancement/AceEventInformationEnhancement01')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('AceEventInformationEnhancement01'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_001 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_002
     * @tc.name   : Check if the current finger pressure value is displayed correctly
     * @tc.desc   : Verify event information enhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_002', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_002 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceEventInformationEnhancement/AceEventInformationEnhancement02')
      let driver:Driver=Driver.create();
      let button02: Component = await driver.waitForComponent(ON.id('AceEventInformationEnhancement02'),1000);
      await button02.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_002 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_003
     * @tc.name   : Check if the current finger press area width is displayed correctly
     * @tc.desc   : Verify event information enhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_003', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_003 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceEventInformationEnhancement/AceEventInformationEnhancement03')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('AceEventInformationEnhancement03'),1000);
      await button03.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_003 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_004
     * @tc.name   : Check if the current finger press area height is displayed correctly
     * @tc.desc   : Verify event information enhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_004', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_004 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceEventInformationEnhancement/AceEventInformationEnhancement04')
      let driver:Driver=Driver.create();
      let button04: Component = await driver.waitForComponent(ON.id('AceEventInformationEnhancement04'),1000);
      await button04.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_004 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_005
     * @tc.name   : Check if the X-axis offset is displayed correctly
     * @tc.desc   : Verify event information enhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_005', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_005 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceEventInformationEnhancement/AceEventInformationEnhancement05')
      let driver:Driver=Driver.create();
      let button05: Component = await driver.waitForComponent(ON.id('AceEventInformationEnhancement05'),1000);
      let point = await button05.getBoundsCenter()
      await driver.mouseMoveTo({x:point.x,y:point.y})
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_005 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_006
     * @tc.name   : Check if the Y-axis offset is displayed correctly
     * @tc.desc   : Verify event information enhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_006', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_006 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceEventInformationEnhancement/AceEventInformationEnhancement06')
      let driver:Driver=Driver.create();
      let button06: Component = await driver.waitForComponent(ON.id('AceEventInformationEnhancement06'),1000);
      let point = await button06.getBoundsCenter()
      await driver.mouseMoveTo({x:point.x,y:point.y})
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_006 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_007
     * @tc.name   : Check if the left mouse button state is displayed correctly
     * @tc.desc   : Verify event information enhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_007', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_007 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceEventInformationEnhancement/AceEventInformationEnhancement07')
      let driver:Driver=Driver.create();
      let button07: Component = await driver.waitForComponent(ON.id('AceEventInformationEnhancement07'),1000);
      let point = await button07.getBoundsCenter()
      await driver.mouseClick({x:point.x,y:point.y},MouseButton.MOUSE_BUTTON_LEFT)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_007 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_008
     * @tc.name   : Check if the right mouse button state is displayed correctly
     * @tc.desc   : Verify event information enhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_008', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_008 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceEventInformationEnhancement/AceEventInformationEnhancement08')
      let driver:Driver=Driver.create();
      let button08: Component = await driver.waitForComponent(ON.id('AceEventInformationEnhancement08'),1000);
      let point = await button08.getBoundsCenter()
      await driver.mouseClick({x:point.x,y:point.y},MouseButton.MOUSE_BUTTON_RIGHT)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_008 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_009
     * @tc.name   : Check if the middle mouse button state is displayed correctly
     * @tc.desc   : Verify event information enhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_009', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_009 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceEventInformationEnhancement/AceEventInformationEnhancement09')
      let driver:Driver=Driver.create();
      let button09: Component = await driver.waitForComponent(ON.id('AceEventInformationEnhancement09'),1000);
      let point = await button09.getBoundsCenter()
      await driver.mouseClick({x:point.x,y:point.y},MouseButton.MOUSE_BUTTON_MIDDLE)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_009 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_014
     * @tc.name   : Check if LongPressGesture press targetDisplayId is displayed correctly
     * @tc.desc   : Verify event information enhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_014', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_014 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceEventInformationEnhancement/AceEventInformationEnhancement14')
      let driver:Driver=Driver.create();
      let button14: Component = await driver.waitForComponent(ON.id('AceEventInformationEnhancement14'),1000);
      await button14.longClick()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_014 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_015
     * @tc.name   : Check if LongPressGesture release targetDisplayId is displayed correctly
     * @tc.desc   : Verify event information enhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_015', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_015 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceEventInformationEnhancement/AceEventInformationEnhancement15')
      let driver:Driver=Driver.create();
      let button15: Component = await driver.waitForComponent(ON.id('AceEventInformationEnhancement15'),1000);
      await button15.longClick()
      await Utils.sleep(2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_015 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_017
     * @tc.name   : Check if SwiperGesture targetDisplayId is displayed correctly
     * @tc.desc   : Verify event information enhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_017', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_017 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceEventInformationEnhancement/AceEventInformationEnhancement17')
      let driver:Driver=Driver.create();
      let button17: Component = await driver.waitForComponent(ON.id('AceEventInformationEnhancement17'),1000);
      let point = await button17.getBoundsCenter()
      await driver.swipe(point.x-100,point.y,point.x+100,point.y,600);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_017 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_018
     * @tc.name   : Check if PanGesture targetDisplayId is displayed correctly
     * @tc.desc   : Verify event information enhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_018', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_018 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceEventInformationEnhancement/AceEventInformationEnhancement18')
      let driver:Driver=Driver.create();
      let button18: Component = await driver.waitForComponent(ON.id('AceEventInformationEnhancement18'),1000);
      let point = await button18.getBoundsCenter()
      await driver.drag(point.x-100,point.y,point.x+100,point.y,600);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_018 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_019
     * @tc.name   : Check if rotationGesture targetDisplayId is displayed correctly
     * @tc.desc   : Verify event information enhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_019', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_019 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceEventInformationEnhancement/AceEventInformationEnhancement19')
      let driver:Driver=Driver.create();
      let button19: Component = await driver.waitForComponent(ON.id('AceEventInformationEnhancement19'),1000);
      let point = await button19.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x+20,y:point.y});
      pointers.setPoint(0,1,{x:point.x+20,y:point.y+20});
      pointers.setPoint(1,0,{x:point.x-20,y:point.y});
      pointers.setPoint(1,1,{x:point.x-20,y:point.y-20});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_019 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_021
     * @tc.name   : Check if Mouse Modifier button, action, rawDelta are displayed correctly
     * @tc.desc   : Verify event information enhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_021', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_021 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceEventInformationEnhancement/AceEventInformationEnhancement21')
      let driver:Driver=Driver.create();
      let button21: Component = await driver.waitForComponent(ON.id('AceEventInformationEnhancement21'),1000);
      let point = await button21.getBoundsCenter()
      await driver.mouseClick({x:point.x,y:point.y},MouseButton.MOUSE_BUTTON_LEFT)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_021 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_023
     * @tc.name   : Check if PinchGesture targetDisplayId is displayed correctly
     * @tc.desc   : Verify event information enhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_023', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_023 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceEventInformationEnhancement/AceEventInformationEnhancement23')
      let driver:Driver=Driver.create();
      let button23: Component = await driver.waitForComponent(ON.id('AceEventInformationEnhancement23'),1000);
      let point = await button23.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x-100,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x+100,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_EVENT_INFORMATION_ENHANCEMENT_023 finish.`);
      done()
    })

  })
}