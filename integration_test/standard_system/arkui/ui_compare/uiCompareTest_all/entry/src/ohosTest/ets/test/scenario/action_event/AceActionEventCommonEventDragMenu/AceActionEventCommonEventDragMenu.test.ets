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

export default function aceActionEventCommonEventDragMenu() {

  describe('aceActionEventCommonEventDragMenu', () => {
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
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0010
     * @tc.name   : Set the image component's bindContextMenu to long-press mode and set preview to NONE
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0010 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu01')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu01'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu01_02'),1000);
      let point1 = await image.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0020
     * @tc.name   : Set the image component's bindContextMenu to long-press mode and preview not set
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0020', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0020 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu02')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu02'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu02_02'),1000);
      let point1 = await image.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0030
     * @tc.name   : Set the image component's bindContextMenu to long-press mode and set preview to IMAGE
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0030', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0030 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu03')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu03'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu03_02'),1000);
      let point1 = await image.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0040
     * @tc.name   : Set the image component's bindContextMenu to long-press mode and set preview to customBuilder
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0040', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0040 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu04')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu04'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu04_02'),1000);
      let point1 = await image.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0050
     * @tc.name   : Set the image component's bindContextMenu to isShow mode and set preview to NONE
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0050', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0050 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu05')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu05'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu05_02'),1000);
      let point1 = await image.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0060
     * @tc.name   : Set the image component's bindContextMenu to isShow mode and preview not set
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0060', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0060 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu06')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu06'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu06_02'),1000);
      let point1 = await image.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0070
     * @tc.name   : Set the image component's bindContextMenu to isShow mode and set preview to IMAGE
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0070', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0070 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu07')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu07'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu07_02'),1000);
      let point1 = await image.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0080
     * @tc.name   : Set the image component's bindContextMenu to isShow mode and set preview to customBuilder
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0080', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0080 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu08')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu08'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu08_02'),1000);
      let point1 = await image.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0090
     * @tc.name   : Set the video component's bindContextMenu to long-press mode and set preview to NONE
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0090', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0090 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu09')
      let driver:Driver=Driver.create();
      let video: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu09'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu09_02'),1000);
      let point1 = await video.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0100
     * @tc.name   : Set the video component's bindContextMenu to long-press mode and preview not set
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0100', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0100 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu10')
      let driver:Driver=Driver.create();
      let video: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu10'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu10_02'),1000);
      let point1 = await video.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0110
     * @tc.name   : Set the video component's bindContextMenu to long-press mode and set preview to IMAGE
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0110', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0110 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu11')
      let driver:Driver=Driver.create();
      let video: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu11'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu11_02'),1000);
      let point1 = await video.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0120
     * @tc.name   : Set the video component's bindContextMenu to long-press mode and set preview to customBuilder
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0120', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0120 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu12')
      let driver:Driver=Driver.create();
      let video: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu12'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu12_02'),1000);
      let point1 = await video.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0130
     * @tc.name   : Set the video component's bindContextMenu to isShow mode and set preview to NONE
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0130', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0130 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu13')
      let driver:Driver=Driver.create();
      let video: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu13'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu13_02'),1000);
      let point1 = await video.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0140
     * @tc.name   : Set the video component's bindContextMenu to isShow mode and preview not set
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0140', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0140 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu14')
      let driver:Driver=Driver.create();
      let video: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu14'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu14_02'),1000);
      let point1 = await video.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0150
     * @tc.name   : Set the video component's bindContextMenu to isShow mode and set preview to IMAGE
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0150', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0150 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu15')
      let driver:Driver=Driver.create();
      let video: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu15'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu15_02'),1000);
      let point1 = await video.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0160
     * @tc.name   : Set the video component's bindContextMenu to isShow mode and set preview to customBuilder
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0160', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0160 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu16')
      let driver:Driver=Driver.create();
      let video: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu16'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu16_02'),1000);
      let point1 = await video.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0170
     * @tc.name   : Set the grid component's bindContextMenu to long-press mode and set preview to NONE
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0170', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0170 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu17')
      let driver:Driver=Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu17'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu17_02'),1000);
      let point1 = await grid.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0180
     * @tc.name   : Set the grid component's bindContextMenu to long-press mode and preview not set
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0180', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0180 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu18')
      let driver:Driver=Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu18'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu18_02'),1000);
      let point1 = await grid.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0190
     * @tc.name   : Set the grid component's bindContextMenu to long-press mode and set preview to IMAGE
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0190', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0190 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu19')
      let driver:Driver=Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu19'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu19_02'),1000);
      let point1 = await grid.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0200
     * @tc.name   : Set the grid component's bindContextMenu to long-press mode and set preview to customBuilder
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0200', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0200 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu20')
      let driver:Driver=Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu20'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu20_02'),1000);
      let point1 = await grid.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0210
     * @tc.name   : Set the grid component's bindContextMenu to isShow mode and set preview to NONE
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0210', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0210 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu21')
      let driver:Driver=Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu21'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu21_02'),1000);
      let point1 = await grid.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0220
     * @tc.name   : Set the grid component's bindContextMenu to isShow mode and preview not set
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0220', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0220 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu22')
      let driver:Driver=Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu22'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu22_02'),1000);
      let point1 = await grid.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0230
     * @tc.name   : Set the grid component's bindContextMenu to isShow mode and set preview to IMAGE
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0230', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0230 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu23')
      let driver:Driver=Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu23'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu23_02'),1000);
      let point1 = await grid.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0240
     * @tc.name   : Set the grid component's bindContextMenu to isShow mode and set preview to customBuilder
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0240', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0240 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu24')
      let driver:Driver=Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu24'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu24_02'),1000);
      let point1 = await grid.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0250
     * @tc.name   : Set the list component's bindContextMenu to long-press mode and set preview to NONE
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0250', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0250 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu25')
      let driver:Driver=Driver.create();
      let list: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu25'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu25_02'),1000);
      let point1 = await list.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0260
     * @tc.name   : Set the list component's bindContextMenu to long-press mode and preview not set
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0260', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0260 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu26')
      let driver:Driver=Driver.create();
      let list: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu26'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu26_02'),1000);
      let point1 = await list.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0270
     * @tc.name   : Set the list component's bindContextMenu to long-press mode and set preview to IMAGE
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0270', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0270 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu27')
      let driver:Driver=Driver.create();
      let list: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu27'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu27_02'),1000);
      let point1 = await list.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0280
     * @tc.name   : Set the list component's bindContextMenu to long-press mode and set preview to customBuilder
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0280', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0280 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu28')
      let driver:Driver=Driver.create();
      let list: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu28'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu28_02'),1000);
      let point1 = await list.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0290
     * @tc.name   : Set the list component's bindContextMenu to isShow mode and set preview to NONE
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0290', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0290 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu29')
      let driver:Driver=Driver.create();
      let list: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu29'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu29_02'),1000);
      let point1 = await list.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0290 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0300
     * @tc.name   : Set the list component's bindContextMenu to isShow mode and preview not set
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0300', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0300 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu30')
      let driver:Driver=Driver.create();
      let list: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu30'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu30_02'),1000);
      let point1 = await list.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0310
     * @tc.name   : Set the list component's bindContextMenu to isShow mode and set preview to IMAGE
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0310', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0310 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu31')
      let driver:Driver=Driver.create();
      let list: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu31'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu31_02'),1000);
      let point1 = await list.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0320
     * @tc.name   : Set the list component's bindContextMenu to isShow mode and set preview to customBuilder
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0320', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0320 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu32')
      let driver:Driver=Driver.create();
      let list: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu32'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu32_02'),1000);
      let point1 = await list.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0410
     * @tc.name   : Set the custom component's bindContextMenu to long-press mode and set preview to NONE
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0410', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0410 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu33')
      let driver:Driver=Driver.create();
      let custom: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu33'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu33_02'),1000);
      let point1 = await custom.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0410 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0420
     * @tc.name   : Set the custom component's bindContextMenu to long-press mode and preview not set
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0420', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0420 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu34')
      let driver:Driver=Driver.create();
      let custom: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu34'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu34_02'),1000);
      let point1 = await custom.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0420 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0430
     * @tc.name   : Set the custom component's bindContextMenu to long-press mode and set preview to IMAGE
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0430', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0430 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu35')
      let driver:Driver=Driver.create();
      let custom: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu35'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu35_02'),1000);
      let point1 = await custom.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0430 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0440
     * @tc.name   : Set the custom component's bindContextMenu to long-press mode and set preview to customBuilder
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0440', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0440 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu36')
      let driver:Driver=Driver.create();
      let custom: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu36'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu36_02'),1000);
      let point1 = await custom.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0440 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0450
     * @tc.name   : Set the custom component's bindContextMenu to isShow mode and set preview to NONE
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0450', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0450 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu37')
      let driver:Driver=Driver.create();
      let custom: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu37'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu37_02'),1000);
      let point1 = await custom.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0450 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0460
     * @tc.name   : Set the custom component's bindContextMenu to isShow mode and preview not set
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0460', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0460 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu38')
      let driver:Driver=Driver.create();
      let custom: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu38'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu38_02'),1000);
      let point1 = await custom.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0460 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0470
     * @tc.name   : Set the custom component's bindContextMenu to isShow mode and set preview to IMAGE
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0470', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0470 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu39')
      let driver:Driver=Driver.create();
      let custom: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu39'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu39_02'),1000);
      let point1 = await custom.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0470 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0480
     * @tc.name   : Set the custom component's bindContextMenu to isShow mode and set preview to customBuilder
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0480', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0480 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu40')
      let driver:Driver=Driver.create();
      let custom: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu40'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu40_02'),1000);
      let point1 = await custom.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0480 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0570
     * @tc.name   : Grid component multi-selection drag, set bindContextMenu to long press mode, preview set to NONE
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0570', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0570 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu41')
      let driver:Driver=Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu41'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu41_02'),1000);
      let point1 = await grid.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0570 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0580
     * @tc.name   : Grid component multi-selection drag, set bindContextMenu to long press mode, preview not set
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0580', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0580 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu42')
      let driver:Driver=Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu42'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu42_02'),1000);
      let point1 = await grid.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0580 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0590
     * @tc.name   : Grid component multi-selection drag, set bindContextMenu to long press mode, preview set to IMAGE
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0590', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0590 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu43')
      let driver:Driver=Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu43'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu43_02'),1000);
      let point1 = await grid.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0590 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0600
     * @tc.name   : Grid component multi-selection drag, set bindContextMenu to long press mode, preview set to customBuilder
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0600', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0600 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu44')
      let driver:Driver=Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu44'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu44_02'),1000);
      let point1 = await grid.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0600 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0610
     * @tc.name   : Grid component multi-selection drag, set bindContextMenu to isShow mode, preview set to NONE
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0610', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0610 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu45')
      let driver:Driver=Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu45'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu45_02'),1000);
      let point1 = await grid.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0610 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0620
     * @tc.name   : Grid component multi-selection drag, set bindContextMenu to isShow mode, preview not set
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0620', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0620 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu46')
      let driver:Driver=Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu46'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu46_02'),1000);
      let point1 = await grid.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0620 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0630
     * @tc.name   : Grid component multi-selection drag, set bindContextMenu to isShow mode, preview set to IMAGE
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0630', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0630 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu47')
      let driver:Driver=Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu47'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu47_02'),1000);
      let point1 = await grid.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0630 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0640
     * @tc.name   : Grid component multi-selection drag, set bindContextMenu to isShow mode, preview set to customBuilder
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0640', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0640 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu48')
      let driver:Driver=Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu48'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu48_02'),1000);
      let point1 = await grid.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0640 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0490
     * @tc.name   : List component multi-selection drag, set bindContextMenu to long press mode, preview set to NONE
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0490 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu49')
      let driver:Driver=Driver.create();
      let list: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu49'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu49_02'),1000);
      let point1 = await list.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0490 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0500
     * @tc.name   : List component multi-selection drag, set bindContextMenu to long press mode, preview not set
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0500 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu50')
      let driver:Driver=Driver.create();
      let list: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu50'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu50_02'),1000);
      let point1 = await list.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0500 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0510
     * @tc.name   : List component multi-selection drag, set bindContextMenu to long press mode, preview set to IMAGE
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0510', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0510 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu51')
      let driver:Driver=Driver.create();
      let list: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu51'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu51_02'),1000);
      let point1 = await list.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0510 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0520
     * @tc.name   : List component multi-selection drag, set bindContextMenu to long press mode, preview set to customBuilder
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0520', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0520 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu52')
      let driver:Driver=Driver.create();
      let list: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu52'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu52_02'),1000);
      let point1 = await list.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0520 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0530
     * @tc.name   : List component multi-selection drag, set bindContextMenu to isShow mode, preview set to NONE
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0530', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0530 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu53')
      let driver:Driver=Driver.create();
      let list: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu53'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu53_02'),1000);
      let point1 = await list.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0530 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0540
     * @tc.name   : List component multi-selection drag, set bindContextMenu to isShow mode, preview not set
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0540', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0540 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu54')
      let driver:Driver=Driver.create();
      let list: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu54'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu54_02'),1000);
      let point1 = await list.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0540 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0550
     * @tc.name   : List component multi-selection drag, set bindContextMenu to isShow mode, preview set to IMAGE
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0550', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0550 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu55')
      let driver:Driver=Driver.create();
      let list: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu55'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu55_02'),1000);
      let point1 = await list.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0550 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0560
     * @tc.name   : List component multi-selection drag, set bindContextMenu to isShow mode, preview set to customBuilder
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0560', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0560 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu56')
      let driver:Driver=Driver.create();
      let list: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu56'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu56_02'),1000);
      let point1 = await list.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0560 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0330
     * @tc.name   : Hyperlink component set bindContextMenu to long press mode, preview set to NONE
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0330 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu57')
      let driver:Driver=Driver.create();
      let hyperlink: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu57'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu57_02'),1000);
      let point1 = await hyperlink.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0340
     * @tc.name   : Hyperlink component set bindContextMenu to long press mode, preview not set
     * @tc.desc   : Verify action event commonevent drag menu interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0340 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/AceActionEventCommonEventDragMenu/AceActionEventCommonEventDragMenu58')
      let driver:Driver=Driver.create();
      let hyperlink: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu58'),1000);
      let text: Component = await driver.waitForComponent(ON.id('AceActionEventCommonEventDragMenu58_02'),1000);
      let point1 = await hyperlink.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.mouseDrag({x:point1.x, y:point1.y},{x:point2.x, y:point2.y}, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 600);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MENU_0340 finish.`);
      done()
    })
  })
}