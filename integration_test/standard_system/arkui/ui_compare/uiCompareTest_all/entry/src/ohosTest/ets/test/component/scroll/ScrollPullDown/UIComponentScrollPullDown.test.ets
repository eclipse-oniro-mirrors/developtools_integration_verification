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

export default function uIComponentScrollPullDown() {
  describe('uIComponentScrollPullDown', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0010
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0010', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0010';
      let pageName = 'UIComponentScrollPullDown0010';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let switchButton: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let scrollComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let scrollCenter = await scrollComponent.getBoundsCenter();
      await driver.swipe(scrollCenter.x, scrollCenter.y + 400, scrollCenter.x, scrollCenter.y - 400, 3000);
      await driver.waitForIdle(500, 2000)
      await windowSnap.snapShot(TAG + '_01');
      await switchButton.click();
      await scrollComponent.scrollToTop(20000);
      await driver.waitForIdle(500, 500);
      await driver.swipe(scrollCenter.x, scrollCenter.y + 400, scrollCenter.x, scrollCenter.y - 400, 3000);
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0020
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0020', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0020';
      let pageName = 'UIComponentScrollPullDown0020';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let switchButton: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let scrollComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let scrollCenter = await scrollComponent.getBoundsCenter();
      await scrollComponent.scrollToBottom(20000);
      await driver.waitForIdle(500, 500);
      await driver.swipe(scrollCenter.x, scrollCenter.y - 400, scrollCenter.x, scrollCenter.y + 400, 3000);
      await driver.waitForIdle(500, 2000)
      await windowSnap.snapShot(TAG + '_01');
      await switchButton.click();
      await scrollComponent.scrollToBottom(20000);
      await driver.waitForIdle(500, 500);
      await driver.swipe(scrollCenter.x, scrollCenter.y - 400, scrollCenter.x, scrollCenter.y + 400, 3000);
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0030
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0030', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0030';
      let pageName = 'UIComponentScrollPullDown0030';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let switchButton: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let scrollComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let scrollCenter = await scrollComponent.getBoundsCenter();
      await driver.swipe(scrollCenter.x, scrollCenter.y + 400, scrollCenter.x, scrollCenter.y - 400, 3000);
      await driver.waitForIdle(500, 2000)
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0090
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0090', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0090';
      let pageName = 'UIComponentScrollPullDown0090';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let switchButton: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let scrollComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let scrollCenter = await scrollComponent.getBoundsCenter();
      await scrollComponent.scrollToBottom(20000);
      await driver.waitForIdle(500, 500);
      await driver.swipe(scrollCenter.x, scrollCenter.y - 400, scrollCenter.x, scrollCenter.y + 400, 3000);
      await driver.waitForIdle(500, 2000)
      await windowSnap.snapShot(TAG + '_01');
      await switchButton.click();
      await scrollComponent.scrollToBottom(20000);
      await driver.waitForIdle(500, 500);
      await driver.swipe(scrollCenter.x, scrollCenter.y - 400, scrollCenter.x, scrollCenter.y + 400, 3000);
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0100
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0100', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0100';
      let pageName = 'UIComponentScrollPullDown0100';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let switchButton: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let scrollComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let scrollCenter = await scrollComponent.getBoundsCenter();
      await driver.swipe(scrollCenter.x, scrollCenter.y + 400, scrollCenter.x, scrollCenter.y - 400, 3000);
      await driver.waitForIdle(500, 2000)
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0080
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0080', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0080';
      let pageName = 'UIComponentScrollPullDown0080';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let switchButton: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let scrollComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let scrollCenter = await scrollComponent.getBoundsCenter();
      await driver.swipe(scrollCenter.x, scrollCenter.y + 400, scrollCenter.x, scrollCenter.y - 400, 3000);
      await driver.waitForIdle(500, 2000)
      await windowSnap.snapShot(TAG + '_01');
      await switchButton.click();
      await scrollComponent.scrollToTop(20000);
      await driver.waitForIdle(500, 500);
      await driver.swipe(scrollCenter.x, scrollCenter.y + 400, scrollCenter.x, scrollCenter.y - 400, 3000);
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0150
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0150', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0150';
      let pageName = 'UIComponentScrollPullDown0150';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let switchButton: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let scrollComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let scrollCenter = await scrollComponent.getBoundsCenter();
      await driver.swipe(scrollCenter.x, scrollCenter.y + 400, scrollCenter.x, scrollCenter.y - 400, 3000);
      await driver.waitForIdle(500, 2000)
      await windowSnap.snapShot(TAG + '_01');
      await switchButton.click();
      await scrollComponent.scrollToTop(20000);
      await driver.waitForIdle(500, 500);
      await driver.swipe(scrollCenter.x, scrollCenter.y + 400, scrollCenter.x, scrollCenter.y - 400, 3000);
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0160
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0160', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0160';
      let pageName = 'UIComponentScrollPullDown0160';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let switchButton: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let scrollComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let scrollCenter = await scrollComponent.getBoundsCenter();
      await scrollComponent.scrollToBottom(20000);
      await driver.waitForIdle(500, 500);
      await driver.swipe(scrollCenter.x, scrollCenter.y - 400, scrollCenter.x, scrollCenter.y + 400, 3000);
      await driver.waitForIdle(500, 2000)
      await windowSnap.snapShot(TAG + '_01');
      await switchButton.click();
      await scrollComponent.scrollToBottom(20000);
      await driver.waitForIdle(500, 500);
      await driver.swipe(scrollCenter.x, scrollCenter.y - 400, scrollCenter.x, scrollCenter.y + 400, 3000);
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0170
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0170', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0170';
      let pageName = 'UIComponentScrollPullDown0170';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let switchButton: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let scrollComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let scrollCenter = await scrollComponent.getBoundsCenter();
      await driver.swipe(scrollCenter.x, scrollCenter.y + 400, scrollCenter.x, scrollCenter.y - 400, 3000);
      await driver.waitForIdle(500, 2000)
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0230
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0230', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0230';
      let pageName = 'UIComponentScrollPullDown0230';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let switchButton: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let scrollComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let scrollCenter = await scrollComponent.getBoundsCenter();
      await driver.swipe(scrollCenter.x, scrollCenter.y + 400, scrollCenter.x, scrollCenter.y - 400, 3000);
      await driver.waitForIdle(500, 2000)
      await windowSnap.snapShot(TAG + '_01');
      await switchButton.click();
      await scrollComponent.scrollToTop(20000);
      await driver.waitForIdle(500, 500);
      await driver.swipe(scrollCenter.x, scrollCenter.y + 400, scrollCenter.x, scrollCenter.y - 400, 3000);
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0240
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0240', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0240';
      let pageName = 'UIComponentScrollPullDown0240';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let switchButton: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let scrollComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let scrollCenter = await scrollComponent.getBoundsCenter();
      await scrollComponent.scrollToBottom(20000);
      await driver.waitForIdle(500, 500);
      await driver.swipe(scrollCenter.x, scrollCenter.y - 400, scrollCenter.x, scrollCenter.y + 400, 3000);
      await driver.waitForIdle(500, 2000)
      await windowSnap.snapShot(TAG + '_01');
      await switchButton.click();
      await scrollComponent.scrollToBottom(20000);
      await driver.waitForIdle(500, 500);
      await driver.swipe(scrollCenter.x, scrollCenter.y - 400, scrollCenter.x, scrollCenter.y + 400, 3000);
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0250
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0250', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0250';
      let pageName = 'UIComponentScrollPullDown0250';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let switchButton: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let scrollComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let scrollCenter = await scrollComponent.getBoundsCenter();
      await driver.swipe(scrollCenter.x, scrollCenter.y + 400, scrollCenter.x, scrollCenter.y - 400, 3000);
      await driver.waitForIdle(500, 2000)
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0040
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0040', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0040';
      let pageName = 'UIComponentScrollPullDown0040';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await targetComponent.scrollToTop(6000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0050
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0050', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0050';
      let pageName = 'UIComponentScrollPullDown0050';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await targetComponent.scrollToTop(6000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0060
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0060', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0060';
      let pageName = 'UIComponentScrollPullDown0060';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await targetComponent.scrollToTop(6000);
      await driver.waitForIdle(1000, 2000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0070
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0070', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0070';
      let pageName = 'UIComponentScrollPullDown0070';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, bounds.left, center.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.swipe(center.x, center.y, bounds.right, center.y, 6000);
      await Utils.sleep(1000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, bounds.left, center.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0110
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0110', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0110';
      let pageName = 'UIComponentScrollPullDown0110';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.swipe(center.x, center.y, center.x, bounds.bottom, 6000);
      await Utils.sleep(1000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0120
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0120', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0120';
      let pageName = 'UIComponentScrollPullDown0120';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.swipe(center.x, center.y, center.x, bounds.bottom, 6000);
      await Utils.sleep(1000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0130
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0130', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0130';
      let pageName = 'UIComponentScrollPullDown0130';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.swipe(center.x, center.y, center.x, bounds.bottom, 6000);
      await Utils.sleep(1000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0140
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0140', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0140';
      let pageName = 'UIComponentScrollPullDown0140';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, bounds.left, center.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.swipe(center.x, center.y, bounds.right, center.y, 6000);
      await Utils.sleep(1000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, bounds.left, center.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0180
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0180', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0180';
      let pageName = 'UIComponentScrollPullDown0180';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.swipe(center.x, center.y, center.x, bounds.bottom, 6000);
      await Utils.sleep(1000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0190
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0190', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0190';
      let pageName = 'UIComponentScrollPullDown0190';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.swipe(center.x, center.y, center.x, bounds.bottom, 6000);
      await Utils.sleep(1000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0200
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0200', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0200';
      let pageName = 'UIComponentScrollPullDown0200';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.swipe(center.x, center.y, center.x, bounds.bottom, 6000);
      await Utils.sleep(1000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0210
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0210', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0210';
      let pageName = 'UIComponentScrollPullDown0210';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, bounds.left, center.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.swipe(center.x, center.y, bounds.right, center.y, 6000);
      await Utils.sleep(1000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, bounds.left, center.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0220
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0220', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0220';
      let pageName = 'UIComponentScrollPullDown0220';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, bounds.left, center.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.swipe(center.x, center.y, bounds.right, center.y, 6000);
      await Utils.sleep(1000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, bounds.left, center.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0260
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0260', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0260';
      let pageName = 'UIComponentScrollPullDown0260';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.swipe(center.x, center.y, center.x, bounds.bottom, 6000);
      await Utils.sleep(1000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0270
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0270', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0270';
      let pageName = 'UIComponentScrollPullDown0270';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.swipe(center.x, center.y, center.x, bounds.bottom, 6000);
      await Utils.sleep(1000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0280
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0280', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0280';
      let pageName = 'UIComponentScrollPullDown0280';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.swipe(center.x, center.y, center.x, bounds.bottom, 6000);
      await Utils.sleep(1000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0290
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0290', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0290';
      let pageName = 'UIComponentScrollPullDown0290';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, bounds.left, center.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.swipe(center.x, center.y, bounds.right, center.y, 6000);
      await Utils.sleep(1000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, bounds.left, center.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0300
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0300', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0300';
      let pageName = 'UIComponentScrollPullDown0300';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01_1'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_01_2'), 1000);
      let button3: Component = await driver.waitForComponent(ON.id(pageName + '_01_3'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await button1.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await button3.click();
      await driver.waitForIdle(1000, 2000);
      await button2.click();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0350
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0350', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0350';
      let pageName = 'UIComponentScrollPullDown0350';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await targetComponent.scrollToTop(8000);
      await Utils.sleep(1000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0360
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0360', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0360';
      let pageName = 'UIComponentScrollPullDown0360';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await targetComponent.scrollToTop(8000);
      await Utils.sleep(1000);
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0370
     * @tc.name   : Scroll pulldown
     * @tc.desc   : Verify scroll pulldown interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0370', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_PULLDOWN_0370';
      let pageName = 'UIComponentScrollPullDown0370';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollPullDown/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01_1'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_01_2'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await button2.click();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await driver.swipe(center.x, center.y, center.x, bounds.bottom, 6000);
      await Utils.sleep(1000);
      await button1.click();
      await driver.waitForIdle(1000, 2000);
      await button2.click();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_03');
      await driver.waitForIdle(1000, 2000);
      await button2.click();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, center.y, center.x, bounds.top, 1000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_04');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

  })
}