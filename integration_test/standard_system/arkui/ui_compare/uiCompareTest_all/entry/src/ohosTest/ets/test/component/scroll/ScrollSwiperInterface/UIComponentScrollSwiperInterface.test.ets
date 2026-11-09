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
import { Point } from '@kit.TestKit';

export default function uIComponentScrollSwiperInterfaceTest() {
  describe('uIComponentScrollSwiperInterfaceTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return;
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
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1460
     * @tc.name   : Scroll swiper interface
     * @tc.desc   : Verify scroll swiper interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1460', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1460 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperInterface/UIComponentScrollSwiperInterface001');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1460');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1460 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2170
     * @tc.name   : Scroll swiper interface
     * @tc.desc   : Verify scroll swiper interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2170 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperInterface/UIComponentScrollSwiperInterface002');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2170');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2170 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2800
     * @tc.name   : Scroll swiper interface
     * @tc.desc   : Verify scroll swiper interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2800', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2800';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperInterface/UIComponentScrollSwiperInterface003');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2800');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1560
     * @tc.name   : Scroll swiper interface
     * @tc.desc   : Verify scroll swiper interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1560', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1560 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperInterface/UIComponentScrollSwiperInterface004');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1560');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1560 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2810
     * @tc.name   : Scroll swiper interface
     * @tc.desc   : Verify scroll swiper interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2810', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2810 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperInterface/UIComponentScrollSwiperInterface005');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2810');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2810 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1650
     * @tc.name   : Scroll swiper interface
     * @tc.desc   : Verify scroll swiper interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1650', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1650 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperInterface/UIComponentScrollSwiperInterface006');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1650');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1650 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1640
     * @tc.name   : Scroll swiper interface
     * @tc.desc   : Verify scroll swiper interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1640', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1640 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperInterface/UIComponentScrollSwiperInterface007');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1640');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1640 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2850
     * @tc.name   : Scroll swiper interface
     * @tc.desc   : Verify scroll swiper interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2850', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2850 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperInterface/UIComponentScrollSwiperInterface008');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2850');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2850 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2890
     * @tc.name   : Scroll swiper interface
     * @tc.desc   : Verify scroll swiper interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2890', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2890 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperInterface/UIComponentScrollSwiperInterface009');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2890');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2890 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2900
     * @tc.name   : Scroll swiper interface
     * @tc.desc   : Verify scroll swiper interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2900', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2900 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperInterface/UIComponentScrollSwiperInterface010');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2900');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2900 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2830
     * @tc.name   : Scroll swiper interface
     * @tc.desc   : Verify scroll swiper interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2830', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2830 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperInterface/UIComponentScrollSwiperInterface011');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2830');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2830 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2870
     * @tc.name   : Scroll swiper interface
     * @tc.desc   : Verify scroll swiper interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2870', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2870 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperInterface/UIComponentScrollSwiperInterface012');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2870');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2870 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2880
     * @tc.name   : Scroll swiper interface
     * @tc.desc   : Verify scroll swiper interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2880', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2880 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperInterface/UIComponentScrollSwiperInterface013');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2880');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2880 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2820
     * @tc.name   : Scroll swiper interface
     * @tc.desc   : Verify scroll swiper interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2820', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2820 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperInterface/UIComponentScrollSwiperInterface014');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2820');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2820 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2860
     * @tc.name   : Scroll swiper interface
     * @tc.desc   : Verify scroll swiper interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2860', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2860 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperInterface/UIComponentScrollSwiperInterface015');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2860');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2860 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2840
     * @tc.name   : Scroll swiper interface
     * @tc.desc   : Verify scroll swiper interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2840', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2840 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperInterface/UIComponentScrollSwiperInterface016');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2840');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_2840 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_3620
     * @tc.name   : Scroll swiper interface
     * @tc.desc   : Verify scroll swiper interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_3620', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_3620';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperInterface/UIComponentScrollSwiperInterface017');
      let driver: Driver = Driver.create();
      let swipe: Component = await driver.waitForComponent(ON.id('Swipe'), 1000);
      let point = await swipe.getBoundsCenter();
      console.info(`${caseName} point of Swipe is ${JSON.stringify(point)}`);
      let rect = await swipe.getBounds();
      console.info(`${caseName} rect of Swipe is ${JSON.stringify(rect)}`);
      await driver.drag(point.x, rect.bottom - 5, point.x, rect.top, 2000);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_3620');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1140
     * @tc.name   : Scroll swiper interface
     * @tc.desc   : Verify scroll swiper interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1140', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1140';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperInterface/UIComponentScrollSwiperInterface018');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(3000, 3000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1140');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_0720
     * @tc.name   : Scroll swiper interface
     * @tc.desc   : Verify scroll swiper interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_0720', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_0720';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperInterface/UIComponentScrollSwiperInterface019');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_0720');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_0730
     * @tc.name   : Scroll swiper interface
     * @tc.desc   : Verify scroll swiper interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_0730', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_0730';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperInterface/UIComponentScrollSwiperInterface020');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_0730');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1590
     * @tc.name   : Scroll swiper interface
     * @tc.desc   : Verify scroll swiper interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1590', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1590';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperInterface/UIComponentScrollSwiperInterface021');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('time'), 1000);
      await button.click();
      await driver.waitForIdle(5000, 5000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1590');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });
  })
}