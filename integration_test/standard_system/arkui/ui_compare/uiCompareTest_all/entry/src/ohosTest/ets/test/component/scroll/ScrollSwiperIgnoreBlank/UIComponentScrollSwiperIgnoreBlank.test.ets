/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { Driver, ON ,Component, UiWindow } from '@kit.TestKit';
import { uiAppearance } from '@kit.ArkUI';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';
import Utils from '../../../model/Utils';


let TAG = 'RunTimeTest';

function sleep(ms: number) {
  return new Promise<string>(resolve => setTimeout(resolve, ms));
}

export default function uIComponentScrollSwiperIgnoreBlank() {
  describe('uIComponentScrollSwiperIgnoreBlank', () => {
    beforeAll(() => {

    })
    beforeEach(() => {

    })

    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }
      Settings.windowClass.destroyWindow((err) => {
        if (err.code) {
          Logger.error(`[${TAG}_afterEach]`, `Failed to destroy the window. Cause : ${JSON.stringify(err)}`);
          return;
        }
        Logger.info(`[${TAG}_afterEach]`, `Succeeded in destroy the window.`);
      })
      await Utils.sleep(1000);
      done();
    })

    afterAll(() => {

    })

    
    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0010
     * @tc.name   : Scroll swiper ignoreblank
     * @tc.desc   : Verify scroll swiper ignoreblank interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0010', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0010';
      let pageName = 'UIComponentScrollSwiperIgnoreBlank0010';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperIgnoreBlank/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0020
     * @tc.name   : Scroll swiper ignoreblank
     * @tc.desc   : Verify scroll swiper ignoreblank interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0020', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0020';
      let pageName = 'UIComponentScrollSwiperIgnoreBlank0020';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperIgnoreBlank/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0030
     * @tc.name   : Scroll swiper ignoreblank
     * @tc.desc   : Verify scroll swiper ignoreblank interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0030', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0030';
      let pageName = 'UIComponentScrollSwiperIgnoreBlank0030';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperIgnoreBlank/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0040
     * @tc.name   : Scroll swiper ignoreblank
     * @tc.desc   : Verify scroll swiper ignoreblank interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0040', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0040';
      let pageName = 'UIComponentScrollSwiperIgnoreBlank0040';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperIgnoreBlank/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0050
     * @tc.name   : Scroll swiper ignoreblank
     * @tc.desc   : Verify scroll swiper ignoreblank interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0050', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0050';
      let pageName = 'UIComponentScrollSwiperIgnoreBlank0050';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperIgnoreBlank/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0060
     * @tc.name   : Scroll swiper ignoreblank
     * @tc.desc   : Verify scroll swiper ignoreblank interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0060', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0060';
      let pageName = 'UIComponentScrollSwiperIgnoreBlank0060';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperIgnoreBlank/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0070
     * @tc.name   : Scroll swiper ignoreblank
     * @tc.desc   : Verify scroll swiper ignoreblank interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0070', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0070';
      let pageName = 'UIComponentScrollSwiperIgnoreBlank0070';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperIgnoreBlank/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0080
     * @tc.name   : Scroll swiper ignoreblank
     * @tc.desc   : Verify scroll swiper ignoreblank interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0080', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0080';
      let pageName = 'UIComponentScrollSwiperIgnoreBlank0080';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperIgnoreBlank/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0090
     * @tc.name   : Scroll swiper ignoreblank
     * @tc.desc   : Verify scroll swiper ignoreblank interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0090', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0090';
      let pageName = 'UIComponentScrollSwiperIgnoreBlank0090';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperIgnoreBlank/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0100
     * @tc.name   : Scroll swiper ignoreblank
     * @tc.desc   : Verify scroll swiper ignoreblank interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0100', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0100';
      let pageName = 'UIComponentScrollSwiperIgnoreBlank0100';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperIgnoreBlank/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0110
     * @tc.name   : Scroll swiper ignoreblank
     * @tc.desc   : Verify scroll swiper ignoreblank interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0110', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0110';
      let pageName = 'UIComponentScrollSwiperIgnoreBlank0110';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperIgnoreBlank/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0120
     * @tc.name   : Scroll swiper ignoreblank
     * @tc.desc   : Verify scroll swiper ignoreblank interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0120', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0120';
      let pageName = 'UIComponentScrollSwiperIgnoreBlank0120';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperIgnoreBlank/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(500, 1000);
      await button.click();
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0130
     * @tc.name   : Scroll swiper ignoreblank
     * @tc.desc   : Verify scroll swiper ignoreblank interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0130', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0130';
      let pageName = 'UIComponentScrollSwiperIgnoreBlank0130';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperIgnoreBlank/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0140
     * @tc.name   : Scroll swiper ignoreblank
     * @tc.desc   : Verify scroll swiper ignoreblank interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0140', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0140';
      let pageName = 'UIComponentScrollSwiperIgnoreBlank0140';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperIgnoreBlank/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0150
     * @tc.name   : Scroll swiper ignoreblank
     * @tc.desc   : Verify scroll swiper ignoreblank interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0150', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0150';
      let pageName = 'UIComponentScrollSwiperIgnoreBlank0150';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperIgnoreBlank/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0160
     * @tc.name   : Scroll swiper ignoreblank
     * @tc.desc   : Verify scroll swiper ignoreblank interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0160', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0160';
      let pageName = 'UIComponentScrollSwiperIgnoreBlank0160';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperIgnoreBlank/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0170
     * @tc.name   : Scroll swiper ignoreblank
     * @tc.desc   : Verify scroll swiper ignoreblank interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0170', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0170';
      let pageName = 'UIComponentScrollSwiperIgnoreBlank0170';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperIgnoreBlank/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0180
     * @tc.name   : Scroll swiper ignoreblank
     * @tc.desc   : Verify scroll swiper ignoreblank interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0180', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0180';
      let pageName = 'UIComponentScrollSwiperIgnoreBlank0180';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperIgnoreBlank/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0190
     * @tc.name   : Scroll swiper ignoreblank
     * @tc.desc   : Verify scroll swiper ignoreblank interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0190', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0190';
      let pageName = 'UIComponentScrollSwiperIgnoreBlank0190';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperIgnoreBlank/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0200
     * @tc.name   : Scroll swiper ignoreblank
     * @tc.desc   : Verify scroll swiper ignoreblank interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0200', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0200';
      let pageName = 'UIComponentScrollSwiperIgnoreBlank0200';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperIgnoreBlank/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0210
     * @tc.name   : Scroll swiper ignoreblank
     * @tc.desc   : Verify scroll swiper ignoreblank interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0210', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0210';
      let pageName = 'UIComponentScrollSwiperIgnoreBlank0210';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperIgnoreBlank/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0220
     * @tc.name   : Scroll swiper ignoreblank
     * @tc.desc   : Verify scroll swiper ignoreblank interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0220', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0220';
      let pageName = 'UIComponentScrollSwiperIgnoreBlank0220';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperIgnoreBlank/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0230
     * @tc.name   : Scroll swiper ignoreblank
     * @tc.desc   : Verify scroll swiper ignoreblank interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0230', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0230';
      let pageName = 'UIComponentScrollSwiperIgnoreBlank0230';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperIgnoreBlank/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0240
     * @tc.name   : Scroll swiper ignoreblank
     * @tc.desc   : Verify scroll swiper ignoreblank interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0240', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0240';
      let pageName = 'UIComponentScrollSwiperIgnoreBlank0240';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperIgnoreBlank/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      await driver.waitForIdle(500, 1000);
      await button.click();
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0250
     * @tc.name   : Scroll swiper ignoreblank
     * @tc.desc   : Verify scroll swiper ignoreblank interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0250', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0250';
      let pageName = 'UIComponentScrollSwiperIgnoreBlank0250';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperIgnoreBlank/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot(TAG + '_01');
      await button.click();
      await driver.waitForIdle(500, 1000);
      await button.click();
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0260
     * @tc.name   : Scroll swiper ignoreblank
     * @tc.desc   : Verify scroll swiper ignoreblank interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0260', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0260';
      let pageName = 'UIComponentScrollSwiperIgnoreBlank0260';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperIgnoreBlank/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot(TAG + '_01');
      await button.click();
      await driver.waitForIdle(500, 1000);
      await button.click();
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0270
     * @tc.name   : Scroll swiper ignoreblank
     * @tc.desc   : Verify scroll swiper ignoreblank interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0270', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0270';
      let pageName = 'UIComponentScrollSwiperIgnoreBlank0270';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperIgnoreBlank/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0280
     * @tc.name   : Scroll swiper ignoreblank
     * @tc.desc   : Verify scroll swiper ignoreblank interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0280', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0280';
      let pageName = 'UIComponentScrollSwiperIgnoreBlank0280';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperIgnoreBlank/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0290
     * @tc.name   : Scroll swiper ignoreblank
     * @tc.desc   : Verify scroll swiper ignoreblank interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0290', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0290';
      let pageName = 'UIComponentScrollSwiperIgnoreBlank0290';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperIgnoreBlank/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot(TAG + '_01');
      await button.click();
      await driver.waitForIdle(500, 1000);
      await button.click();
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0300
     * @tc.name   : Scroll swiper ignoreblank
     * @tc.desc   : Verify scroll swiper ignoreblank interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0300', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IGNOREBLANK_0300';
      let pageName = 'UIComponentScrollSwiperIgnoreBlank0300';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperIgnoreBlank/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot(TAG + '_01');
      await button.click();
      await driver.waitForIdle(500, 1000);
      await button.click();
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

  })
}