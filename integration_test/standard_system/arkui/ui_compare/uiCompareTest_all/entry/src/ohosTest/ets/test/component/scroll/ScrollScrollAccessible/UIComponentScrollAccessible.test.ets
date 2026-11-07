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
import { Driver, ON, Component } from '@kit.TestKit'

export default function uIComponentScrollScrollAccessible() {
  describe('uIComponentScrollScrollAccessible', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0290
     * @tc.name   : Scroll: Use the scroll controller to scroll and obtain the scroll offset
     * @tc.desc   : Verify scroll accessible interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0290', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0290';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollAccessible/UIComponentScrollScrollAccessible001');
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('scroll'), 1000);
      await button1.click();
      let button2: Component = await driver.waitForComponent(ON.id('getScrollOffSet'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0290');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0310
     * @tc.name   : Scroll: Slide the scrollbar to obtain the scrolling offset
     * @tc.desc   : Verify scroll accessible interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0310', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0310';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollAccessible/UIComponentScrollScrollAccessible002');
      let driver: Driver = Driver.create();
      let scroll: Component = await driver.waitForComponent(ON.type('Scroll'), 1000);
      let rect = await scroll.getBounds();
      console.log(`${caseName} rect of Grid is ${JSON.stringify(rect)}`);
      await driver.mouseDrag({x: rect.right - 10, y: rect.top + 120}, {x: rect.right - 10, y: rect.top + 150});
      await driver.waitForIdle(500, 1000);
      let button: Component = await driver.waitForComponent(ON.id('getScrollOffSet'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0310');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0280
     * @tc.name   : Scroll: Use the mouse wheel to scroll and obtain the scrolling offset
     * @tc.desc   : Verify scroll accessible interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0280', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0280';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollAccessible/UIComponentScrollScrollAccessible003');
      let driver: Driver = Driver.create();
      let scroll: Component = await driver.waitForComponent(ON.type('Scroll'), 1000);
      let point = await scroll.getBoundsCenter();
      console.log(`${caseName} point of Scroll is ${JSON.stringify(point)}`);
      await driver.mouseScroll(point, true, 2);
      let button: Component = await driver.waitForComponent(ON.id('getScrollOffSet'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0280');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0300
     * @tc.name   : Scroll uses keyboard focus to obtain scrolling offset
     * @tc.desc   : Verify scroll accessible interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0300', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0300';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollAccessible/UIComponentScrollScrollAccessible004');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 1000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 1000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 1000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0300');
      await driver.waitForIdle(500, 1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0120
     * @tc.name   : Slide the scroll bar on the List to obtain the scroll offset
     * @tc.desc   : Verify scroll accessible interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0120', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0120';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollAccessible/UIComponentScrollScrollAccessible005');
      let driver: Driver = Driver.create();
      let list: Component = await driver.waitForComponent(ON.type('List'), 1000);
      let rect = await list.getBounds();
      console.log(`${caseName} rect of List is ${JSON.stringify(rect)}`);
      await driver.mouseDrag({x: rect.right - 10, y: rect.top + 120}, {x: rect.right - 10, y: rect.top + 150});
      await driver.waitForIdle(500, 3000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0120');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0050
     * @tc.name   : List dynamically switches the number of items and obtains the offset
     * @tc.desc   : Verify scroll accessible interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0050', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0050';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollAccessible/UIComponentScrollScrollAccessible006');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('change'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0050');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0110
     * @tc.name   : List dynamically switches the number of items and obtains the offset
     * @tc.desc   : Verify scroll accessible interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0110', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0110';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollAccessible/UIComponentScrollScrollAccessible007');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 1000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 1000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 1000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0110');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0020
     * @tc.name   : List dynamically switches the width and height of items to obtain the offset
     * @tc.desc   : Verify scroll accessible interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0020', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0020';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollAccessible/UIComponentScrollScrollAccessible008');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('change'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0020');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0090
     * @tc.name   : List: Use the mouse wheel to scroll and obtain the scrolling offset
     * @tc.desc   : Verify scroll accessible interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0090', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0090';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollAccessible/UIComponentScrollScrollAccessible009');
      let driver: Driver = Driver.create();
      let list: Component = await driver.waitForComponent(ON.type('List'), 1000);
      let point = await list.getBoundsCenter();
      console.log(`${caseName} point of List is ${JSON.stringify(point)}`);
      await driver.mouseScroll(point, true, 2);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0090');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0100
     * @tc.name   : List: Use the mouse wheel to scroll and obtain the scrolling offset
     * @tc.desc   : Verify scroll accessible interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0100', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0100';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollAccessible/UIComponentScrollScrollAccessible010');
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('scroll'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0100');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0360
     * @tc.name   : Waterflow uses keyboard autofocus to obtain scrolling offset
     * @tc.desc   : Verify scroll accessible interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0360', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0360';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollAccessible/UIComponentScrollScrollAccessible011');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 1000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 1000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 1000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 1000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 1000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 1000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 1000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0360');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0350
     * @tc.name   : Waterflow uses a scrolling controller to scroll and obtain the scrolling offset
     * @tc.desc   : Verify scroll accessible interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0350', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0350';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollAccessible/UIComponentScrollScrollAccessible012');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('scroll'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0350');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0370
     * @tc.name   : Waterflow uses a scrolling controller to scroll and obtain the scrolling offset
     * @tc.desc   : Verify scroll accessible interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0370', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0370';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollAccessible/UIComponentScrollScrollAccessible013');
      let driver: Driver = Driver.create();
      let wanterFlow: Component = await driver.waitForComponent(ON.type('WaterFlow'), 1000);
      let rect = await wanterFlow.getBounds();
      console.log(`${caseName} rect of WaterFlow is ${JSON.stringify(rect)}`);
      await driver.mouseDrag({x: rect.right - 10, y: rect.top + 120}, {x: rect.right - 10, y: rect.top + 150});
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0370');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0230
     * @tc.name   : Grid uses a rolling controller to scroll and obtain the rolling offset
     * @tc.desc   : Verify scroll accessible interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0230', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0230';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollAccessible/UIComponentScrollScrollAccessible014');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('scroll'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0230');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0250
     * @tc.name   : Grid sliding scrollbar to obtain scrolling offset
     * @tc.desc   : Verify scroll accessible interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0250', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0250';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollAccessible/UIComponentScrollScrollAccessible015');
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.type('Grid'), 1000);
      let rect = await grid.getBounds();
      console.log(`${caseName} rect of Grid is ${JSON.stringify(rect)}`);
      await driver.mouseDrag({x: rect.right - 10, y: rect.top + 120}, {x: rect.right - 10, y: rect.top + 150});
      await driver.waitForIdle(500, 3000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0250');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0140
     * @tc.name   : Grid dynamically switches spacing to obtain offset
     * @tc.desc   : Verify scroll accessible interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0140', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0140';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollAccessible/UIComponentScrollScrollAccessible016');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('change'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0140');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0150
     * @tc.name   : Grid dynamically switches item width and height to obtain offset
     * @tc.desc   : Verify scroll accessible interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0150', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0150';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollAccessible/UIComponentScrollScrollAccessible017');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('change'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0150');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0160
     * @tc.name   : Grid dynamically switches the number of items to obtain the offset
     * @tc.desc   : Verify scroll accessible interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0160', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0160';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollAccessible/UIComponentScrollScrollAccessible018');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('change'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0160');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0170
     * @tc.name   : Obtain offset after dynamically switching the number of grid rows and columns
     * @tc.desc   : Verify scroll accessible interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0170', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0170';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollAccessible/UIComponentScrollScrollAccessible019');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('change'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0170');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0240
     * @tc.name   : Grid uses keyboard focusing to obtain scrolling offset
     * @tc.desc   : Verify scroll accessible interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0240', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0240';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollAccessible/UIComponentScrollScrollAccessible020');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 1000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 1000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 1000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 1000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 1000);
      await driver.triggerKey(2049);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0240');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0220
     * @tc.name   : Grid uses the mouse wheel to scroll and obtain the scrolling offset
     * @tc.desc   : Verify scroll accessible interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0220', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0220';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollAccessible/UIComponentScrollScrollAccessible021');
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.type('Grid'), 1000);
      let point = await grid.getBoundsCenter();
      console.log(`${caseName} point of Grid is ${JSON.stringify(point)}`);
      await driver.mouseScroll(point, true, 2);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0220');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0340
     * @tc.name   : Waterflow uses the mouse wheel to scroll and obtain the scrolling offset
     * @tc.desc   : Verify scroll accessible interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0340', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0340';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollAccessible/UIComponentScrollScrollAccessible022');
      let driver: Driver = Driver.create();
      let waterflow: Component = await driver.waitForComponent(ON.type('WaterFlow'), 1000);
      let point = await waterflow.getBoundsCenter();
      console.log(`${caseName} point of WaterFlow is ${JSON.stringify(point)}`);
      await driver.mouseScroll(point, true, 2);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0340');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0040
     * @tc.name   : Dynamically switch the number of rows and columns in the List to obtain the offset
     * @tc.desc   : Verify scroll accessible interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0040', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0040';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollAccessible/UIComponentScrollScrollAccessible023');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('change'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0040');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0030
     * @tc.name   : List dynamically switches between rows and columns to obtain offset
     * @tc.desc   : Verify scroll accessible interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0030', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0030';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollAccessible/UIComponentScrollScrollAccessible024');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('change'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0030');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0060
     * @tc.name   : List dynamically switches horizontally, vertically, and backward to obtain offset
     * @tc.desc   : Verify scroll accessible interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0060', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0060';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollAccessible/UIComponentScrollScrollAccessible025');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('change'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0060');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0070
     * @tc.name   : Combining ListGroup and ListItem scenarios to obtain offset
     * @tc.desc   : Verify scroll accessible interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0070', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0070';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollAccessible/UIComponentScrollScrollAccessible026');
      let driver: Driver = Driver.create();
      let listGroup: Component = await driver.waitForComponent(ON.type('List'), 1000);
      let point = await listGroup.getBoundsCenter();
      console.log(`${caseName} point of ListGroup is ${JSON.stringify(point)}`);
      await driver.mouseScroll(point, true, 2);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0070');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0200
     * @tc.name   : Grid uses layoutDirection layout to obtain rolling offset
     * @tc.desc   : Verify scroll accessible interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0200', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0200';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollAccessible/UIComponentScrollScrollAccessible027');
      let driver: Driver = Driver.create();
      let listGroup: Component = await driver.waitForComponent(ON.type('Grid'), 1000);
      let point = await listGroup.getBoundsCenter();
      console.log(`${caseName} point of ListGroup is ${JSON.stringify(point)}`);
      await driver.mouseScroll(point, true, 2);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0200');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0190
     * @tc.name   : Grid uses LayoutOptions layout to obtain rolling offset
     * @tc.desc   : Verify scroll accessible interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0190', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0190';
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0190 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollScrollAccessible/UIComponentScrollScrollAccessible028');
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.type('Grid'), 1000);
      let point = await grid.getBoundsCenter();
      console.log(`${caseName} point of ListGroup is ${JSON.stringify(point)}`);
      await driver.mouseScroll(point, true, 2);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SCROLL_ACCESSIBLE_0190');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });
  })
}