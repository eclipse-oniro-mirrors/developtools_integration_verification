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

export default function actionEventCommonEventDragInterface() {

  describe('actionEventCommonEventDragInterface', () => {
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
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1190
     * @tc.name   : Interface onDragLeave obtains DisplayY
     * @tc.desc   : Verify action event commonevent drag interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1190', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1190 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventDragInterface/ActionEventCommonEventDragInterface01')
      let driver:Driver=Driver.create();
      let text: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventDragInterface01_02'),1000);
      let iamge: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventDragInterface01_01'),1000);
      let point1 = await text.getBoundsCenter()
      let point2 = await iamge.getBoundsCenter()
      await iamge.dragTo(text);
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseDrag({x:point2.x, y:point2.y},{x:point1.x, y:point1.y},600);
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1160
     * @tc.name   : Interface onDragMove obtains WindowX
     * @tc.desc   : Verify action event commonevent drag interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1160', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1160 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventDragInterface/ActionEventCommonEventDragInterface02')
      let driver:Driver=Driver.create();
      let text: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventDragInterface02_02'),1000);
      let iamge: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventDragInterface02_01'),1000);
      let point1 = await text.getBoundsCenter()
      let point2 = await iamge.getBoundsCenter()
      await iamge.dragTo(text);
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseDrag({x:point2.x, y:point2.y},{x:point1.x, y:point1.y},600);
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1210
     * @tc.name   : Interface onDragLeave obtains WindowY
     * @tc.desc   : Verify action event commonevent drag interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1210', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1210 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventDragInterface/ActionEventCommonEventDragInterface03')
      let driver:Driver=Driver.create();
      let text: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventDragInterface03_02'),1000);
      let iamge: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventDragInterface03_01'),1000);
      let point1 = await text.getBoundsCenter()
      let point2 = await iamge.getBoundsCenter()
      await iamge.dragTo(text);
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseDrag({x:point2.x, y:point2.y},{x:point1.x, y:point1.y},600);
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1100
     * @tc.name   : Interface onDragEnter obtains DisplayX
     * @tc.desc   : Verify action event commonevent drag interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1100', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1100 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventDragInterface/ActionEventCommonEventDragInterface04')
      let driver:Driver=Driver.create();
      let text: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventDragInterface04_02'),1000);
      let iamge: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventDragInterface04_01'),1000);
      let point1 = await text.getBoundsCenter()
      let point2 = await iamge.getBoundsCenter()
      await iamge.dragTo(text);
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseDrag({x:point2.x, y:point2.y},{x:point1.x, y:point1.y+50},600);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1170
     * @tc.name   : Interface onDragMove obtains WindowY
     * @tc.desc   : Verify action event commonevent drag interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1170', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1170 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventDragInterface/ActionEventCommonEventDragInterface05')
      let driver:Driver=Driver.create();
      let text: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventDragInterface05_02'),1000);
      let iamge: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventDragInterface05_01'),1000);
      let point1 = await text.getBoundsCenter()
      let point2 = await iamge.getBoundsCenter()
      await iamge.dragTo(text);
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseDrag({x:point2.x, y:point2.y},{x:point1.x, y:point1.y},600);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1150
     * @tc.name   : Interface onDragMove obtains DisplayY
     * @tc.desc   : Verify action event commonevent drag interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1150', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1150 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventDragInterface/ActionEventCommonEventDragInterface06')
      let driver:Driver=Driver.create();
      let text: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventDragInterface06_02'),1000);
      let iamge: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventDragInterface06_01'),1000);
      let point1 = await text.getBoundsCenter()
      let point2 = await iamge.getBoundsCenter()
      await iamge.dragTo(text);
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseDrag({x:point2.x, y:point2.y},{x:point1.x, y:point1.y},600);
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1180
     * @tc.name   : Interface onDragLeave obtains DisplayX
     * @tc.desc   : Verify action event commonevent drag interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1180', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1180 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventDragInterface/ActionEventCommonEventDragInterface07')
      let driver:Driver=Driver.create();
      let text: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventDragInterface07_02'),1000);
      let iamge: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventDragInterface07_01'),1000);
      let point1 = await text.getBoundsCenter()
      let point2 = await iamge.getBoundsCenter()
      await iamge.dragTo(text);
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseDrag({x:point2.x, y:point2.y},{x:point1.x, y:point1.y},600);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1110
     * @tc.name   : Interface onDragEnter obtains DisplayY
     * @tc.desc   : Verify action event commonevent drag interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1110', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1110 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventDragInterface/ActionEventCommonEventDragInterface08')
      let driver:Driver=Driver.create();
      let text: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventDragInterface08_02'),1000);
      let iamge: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventDragInterface08_01'),1000);
      let point1 = await text.getBoundsCenter()
      let point2 = await iamge.getBoundsCenter()
      await iamge.dragTo(text);
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseDrag({x:point2.x, y:point2.y},{x:point1.x, y:point1.y},600);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1140
     * @tc.name   : Interface onDragMove obtains DisplayX
     * @tc.desc   : Verify action event commonevent drag interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1140', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1140 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventDragInterface/ActionEventCommonEventDragInterface09')
      let driver:Driver=Driver.create();
      let text: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventDragInterface09_02'),1000);
      let iamge: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventDragInterface09_01'),1000);
      let point1 = await text.getBoundsCenter()
      let point2 = await iamge.getBoundsCenter()
      await iamge.dragTo(text);
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseDrag({x:point2.x, y:point2.y},{x:point1.x, y:point1.y},600);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1130
     * @tc.name   : Interface onDragEnter obtains WindowY
     * @tc.desc   : Verify action event commonevent drag interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1130', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1130 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventDragInterface/ActionEventCommonEventDragInterface10')
      let driver:Driver=Driver.create();
      let text: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventDragInterface10_02'),1000);
      let iamge: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventDragInterface10_01'),1000);
      let point1 = await text.getBoundsCenter()
      let point2 = await iamge.getBoundsCenter()
      await iamge.dragTo(text);
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseDrag({x:point2.x, y:point2.y},{x:point1.x, y:point1.y},600);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1120
     * @tc.name   : Interface onDragEnter obtains WindowX
     * @tc.desc   : Verify action event commonevent drag interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1120', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1120 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventDragInterface/ActionEventCommonEventDragInterface11')
      let driver:Driver=Driver.create();
      let text: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventDragInterface11_02'),1000);
      let iamge: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventDragInterface11_01'),1000);
      let point1 = await text.getBoundsCenter()
      let point2 = await iamge.getBoundsCenter()
      await iamge.dragTo(text);
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseDrag({x:point2.x, y:point2.y},{x:point1.x, y:point1.y},600);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1200
     * @tc.name   : Interface onDragLeave obtains WindowX
     * @tc.desc   : Verify action event commonevent drag interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1200', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1200 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventDragInterface/ActionEventCommonEventDragInterface12')
      let driver:Driver=Driver.create();
      let text: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventDragInterface12_02'),1000);
      let iamge: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventDragInterface12_01'),1000);
      let point1 = await text.getBoundsCenter()
      let point2 = await iamge.getBoundsCenter()
      await iamge.dragTo(text);
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseDrag({x:point2.x, y:point2.y},{x:point1.x, y:point1.y},600);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1080
     * @tc.name   : Interface onDragStart sets setResult to DRAG_FAILED
     * @tc.desc   : Verify action event commonevent drag interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1080', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1080 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventDragInterface/ActionEventCommonEventDragInterface13')
      let driver:Driver=Driver.create();
      let text: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventDragInterface13_02'),1000);
      let iamge: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventDragInterface13_01'),1000);
      let point1 = await text.getBoundsCenter()
      let point2 = await iamge.getBoundsCenter()
      await iamge.dragTo(text);
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseDrag({x:point2.x, y:point2.y},{x:point1.x, y:point1.y},600);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1070
     * @tc.name   : Interface onDragStart sets setResult to DRAG_SUCCESSFUL
     * @tc.desc   : Verify action event commonevent drag interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1070', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1070 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventDragInterface/ActionEventCommonEventDragInterface14')
      let driver:Driver=Driver.create();
      let text: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventDragInterface14_02'),1000);
      let iamge: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventDragInterface14_01'),1000);
      let point1 = await text.getBoundsCenter()
      let point2 = await iamge.getBoundsCenter()
      await iamge.dragTo(text);
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseDrag({x:point2.x, y:point2.y},{x:point1.x, y:point1.y},600);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1090
     * @tc.name   : Interface onDragStart sets setResult to DRAG_CANCELED
     * @tc.desc   : Verify action event commonevent drag interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1090', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1090 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventDragInterface/ActionEventCommonEventDragInterface15')
      let driver:Driver=Driver.create();
      let text: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventDragInterface15_02'),1000);
      let iamge: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventDragInterface15_01'),1000);
      let point1 = await text.getBoundsCenter()
      let point2 = await iamge.getBoundsCenter()
      await iamge.dragTo(text);
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseDrag({x:point2.x, y:point2.y},{x:point1.x, y:point1.y},600);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INTERFACE_1090 finish.`);
      done()
    })

  })
}