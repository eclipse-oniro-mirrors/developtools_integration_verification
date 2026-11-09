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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError, commonEventManager, screenLock } from '@kit.BasicServicesKit';
import { KeyCode } from '@kit.InputKit';

import { window, uiAppearance } from '@kit.ArkUI';
import { wifiManager } from '@kit.ConnectivityKit';
import { Driver, ON ,Component, UiWindow } from '@kit.TestKit';

import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';
import Utils from '../../../model/Utils';


let TAG = 'RunTimeTest';

function sleep(ms: number) {
  return new Promise<string>(resolve => setTimeout(resolve, ms));
}

export default function uIComponentScrollToTop() {
  describe('uIComponentScrollToTop', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0040
     * @tc.name   : Scrolltotop
     * @tc.desc   : Verify scrolltotop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0040', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0040';
      let pageName = 'UIComponentScrollToTop0040';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollToTop/' + pageName);
      let driver: Driver = Driver.create();
      let scroll: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let centerPoint = await scroll.getBoundsCenter();
      await driver.waitForIdle(500, 1000);
      await scroll.scrollToBottom(3000);
      await driver.waitForIdle(500, 1000);
      await driver.mouseMoveTo({x: centerPoint.x, y: 15});
      await driver.click(centerPoint.x, 15);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0050
     * @tc.name   : Scrolltotop
     * @tc.desc   : Verify scrolltotop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0050', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0050';
      let pageName = 'UIComponentScrollToTop0050';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollToTop/' + pageName);
      let driver: Driver = Driver.create();
      let scroll: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let centerPoint = await scroll.getBoundsCenter();
      await driver.waitForIdle(500, 1000);
      await scroll.scrollToBottom(3000);
      await driver.waitForIdle(500, 1000);
      await driver.mouseMoveTo({x: centerPoint.x, y: 15});
      await driver.click(centerPoint.x, 15);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0060
     * @tc.name   : Scrolltotop
     * @tc.desc   : Verify scrolltotop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0060', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0060';
      let pageName = 'UIComponentScrollToTop0060';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollToTop/' + pageName);
      let driver: Driver = Driver.create();
      let scroll: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let centerPoint = await scroll.getBoundsCenter();
      await driver.waitForIdle(500, 1000);
      await scroll.scrollToBottom(3000);
      await driver.waitForIdle(500, 1000);
      await driver.mouseMoveTo({x: centerPoint.x, y: 15});
      await driver.click(centerPoint.x, 15);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0070
     * @tc.name   : Scrolltotop
     * @tc.desc   : Verify scrolltotop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0070', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0070';
      let pageName = 'UIComponentScrollToTop0070';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollToTop/' + pageName);
      let driver: Driver = Driver.create();
      let scroll: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let centerPoint = await scroll.getBoundsCenter();
      await driver.waitForIdle(500, 1000);
      await scroll.scrollToBottom(3000);
      await driver.waitForIdle(500, 1000);
      await driver.mouseMoveTo({x: centerPoint.x, y: 15});
      await driver.click(centerPoint.x, 15);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0120
     * @tc.name   : Scrolltotop
     * @tc.desc   : Verify scrolltotop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0120', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0120';
      let pageName = 'UIComponentScrollToTop0120';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollToTop/' + pageName);
      let driver: Driver = Driver.create();
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let centerPoint = await list.getBoundsCenter();
      await driver.waitForIdle(500, 1000);
      await list.scrollToBottom(3000);
      await driver.waitForIdle(500, 1000);
      await driver.mouseMoveTo({x: centerPoint.x, y: 15});
      await driver.click(centerPoint.x, 15);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0130
     * @tc.name   : Scrolltotop
     * @tc.desc   : Verify scrolltotop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0130', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0130';
      let pageName = 'UIComponentScrollToTop0130';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollToTop/' + pageName);
      let driver: Driver = Driver.create();
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let centerPoint = await list.getBoundsCenter();
      await driver.waitForIdle(500, 1000);
      await list.scrollToBottom(3000);
      await driver.waitForIdle(500, 1000);
      await driver.mouseMoveTo({x: centerPoint.x, y: 15});
      await driver.click(centerPoint.x, 15);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0140
     * @tc.name   : Scrolltotop
     * @tc.desc   : Verify scrolltotop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0140', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0140';
      let pageName = 'UIComponentScrollToTop0140';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollToTop/' + pageName);
      let driver: Driver = Driver.create();
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let centerPoint = await list.getBoundsCenter();
      await driver.waitForIdle(500, 1000);
      await list.scrollToBottom(3000);
      await driver.waitForIdle(500, 1000);
      await driver.mouseMoveTo({x: centerPoint.x, y: 15});
      await driver.click(centerPoint.x, 15);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0150
     * @tc.name   : Scrolltotop
     * @tc.desc   : Verify scrolltotop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0150', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0150';
      let pageName = 'UIComponentScrollToTop0150';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollToTop/' + pageName);
      let driver: Driver = Driver.create();
      let list: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let centerPoint = await list.getBoundsCenter();
      await driver.waitForIdle(500, 1000);
      await list.scrollToBottom(3000);
      await driver.waitForIdle(500, 1000);
      await driver.mouseMoveTo({x: centerPoint.x, y: 15});
      await driver.click(centerPoint.x, 15);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0220
     * @tc.name   : Scrolltotop
     * @tc.desc   : Verify scrolltotop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0220', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0220';
      let pageName = 'UIComponentScrollToTop0220';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollToTop/' + pageName);
      let driver: Driver = Driver.create();
      let waterFlow: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let centerPoint = await waterFlow.getBoundsCenter();
      await driver.waitForIdle(500, 1000);
      await waterFlow.scrollToBottom(3000);
      await driver.waitForIdle(500, 1000);
      await driver.mouseMoveTo({x: centerPoint.x, y: 15});
      await driver.click(centerPoint.x, 15);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0230
     * @tc.name   : Scrolltotop
     * @tc.desc   : Verify scrolltotop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0230', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0230';
      let pageName = 'UIComponentScrollToTop0230';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollToTop/' + pageName);
      let driver: Driver = Driver.create();
      let waterFlow: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let centerPoint = await waterFlow.getBoundsCenter();
      await driver.waitForIdle(500, 1000);
      await waterFlow.scrollToBottom(3000);
      await driver.waitForIdle(500, 1000);
      await driver.mouseMoveTo({x: centerPoint.x, y: 15});
      await driver.click(centerPoint.x, 15);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0240
     * @tc.name   : Scrolltotop
     * @tc.desc   : Verify scrolltotop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0240', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0240';
      let pageName = 'UIComponentScrollToTop0240';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollToTop/' + pageName);
      let driver: Driver = Driver.create();
      let waterFlow: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let centerPoint = await waterFlow.getBoundsCenter();
      await driver.waitForIdle(500, 1000);
      await waterFlow.scrollToBottom(3000);
      await driver.waitForIdle(500, 1000);
      await driver.mouseMoveTo({x: centerPoint.x, y: 15});
      await driver.click(centerPoint.x, 15);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0250
     * @tc.name   : Scrolltotop
     * @tc.desc   : Verify scrolltotop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0250', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0250';
      let pageName = 'UIComponentScrollToTop0250';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollToTop/' + pageName);
      let driver: Driver = Driver.create();
      let waterFlow: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let centerPoint = await waterFlow.getBoundsCenter();
      await driver.waitForIdle(500, 1000);
      await waterFlow.scrollToBottom(3000);
      await driver.waitForIdle(500, 1000);
      await driver.mouseMoveTo({x: centerPoint.x, y: 15});
      await driver.click(centerPoint.x, 15);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0290
     * @tc.name   : Scrolltotop
     * @tc.desc   : Verify scrolltotop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0290', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0290';
      let pageName = 'UIComponentScrollToTop0290';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollToTop/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let centerPoint = await grid.getBoundsCenter();
      await driver.waitForIdle(500, 1000);
      await grid.scrollToBottom(3000);
      await driver.waitForIdle(500, 1000);
      await driver.mouseMoveTo({x: centerPoint.x, y: 15});
      await driver.click(centerPoint.x, 15);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0300
     * @tc.name   : Scrolltotop
     * @tc.desc   : Verify scrolltotop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0300', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0300';
      let pageName = 'UIComponentScrollToTop0300';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollToTop/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let centerPoint = await grid.getBoundsCenter();
      await driver.waitForIdle(500, 1000);
      await grid.scrollToBottom(3000);
      await driver.waitForIdle(500, 1000);
      await driver.mouseMoveTo({x: centerPoint.x, y: 15});
      await driver.click(centerPoint.x, 15);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0310
     * @tc.name   : Scrolltotop
     * @tc.desc   : Verify scrolltotop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0310', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0310';
      let pageName = 'UIComponentScrollToTop0310';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollToTop/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let centerPoint = await grid.getBoundsCenter();
      await driver.waitForIdle(500, 1000);
      await grid.scrollToBottom(3000);
      await driver.waitForIdle(500, 1000);
      await driver.mouseMoveTo({x: centerPoint.x, y: 15});
      await driver.click(centerPoint.x, 15);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0320
     * @tc.name   : Scrolltotop
     * @tc.desc   : Verify scrolltotop interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0320', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLLTOTOP_0320';
      let pageName = 'UIComponentScrollToTop0320';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollToTop/' + pageName);
      let driver: Driver = Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let centerPoint = await grid.getBoundsCenter();
      await driver.waitForIdle(500, 1000);
      await grid.scrollToBottom(3000);
      await driver.waitForIdle(500, 1000);
      await driver.mouseMoveTo({x: centerPoint.x, y: 15});
      await driver.click(centerPoint.x, 15);
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

  })
}