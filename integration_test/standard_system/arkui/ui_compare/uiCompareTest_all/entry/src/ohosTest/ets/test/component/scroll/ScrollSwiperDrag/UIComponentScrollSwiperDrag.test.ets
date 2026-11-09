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

export default function uIComponentScrollSwiperDragTest() {
  describe('uIComponentScrollSwiperDragTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0560
     * @tc.name   : Scroll swiper drag
     * @tc.desc   : Verify scroll swiper drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0560', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0560 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperDrag/UIComponentScrollSwiperDrag001');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0560');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0560 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0550
     * @tc.name   : Scroll swiper drag
     * @tc.desc   : Verify scroll swiper drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0550', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0550 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperDrag/UIComponentScrollSwiperDrag002');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0550');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0550 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0730
     * @tc.name   : Scroll swiper drag
     * @tc.desc   : Verify scroll swiper drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0730', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0730 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperDrag/UIComponentScrollSwiperDrag003');
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('switch'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0730');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0730 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0670
     * @tc.name   : Scroll swiper drag
     * @tc.desc   : Verify scroll swiper drag interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0670', Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0670';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperDrag/UIComponentScrollSwiperDrag004');
      let driver: Driver = Driver.create();
      let swipe: Component = await driver.waitForComponent(ON.id('Swipe'), 1000);
      let point = await swipe.getBoundsCenter();
      console.info(`${caseName} point of Swipe is ${JSON.stringify(point)}`);
      let rect = await swipe.getBounds();
      console.info(`${caseName} rect of Swipe is ${JSON.stringify(rect)}`);
      await driver.drag(point.x, rect.bottom - 5, point.x, rect.top, 4000);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0670');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });
  })
}