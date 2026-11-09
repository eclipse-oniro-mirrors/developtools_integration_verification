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

export default function uIComponentOtherScrollableAnimation() {
  describe('uIComponentOtherScrollableAnimation', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0010
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0010', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0010';
      let pageName = 'UIComponentOtherScrollableAnimation0010';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0020
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0020', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0020';
      let pageName = 'UIComponentOtherScrollableAnimation0020';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.drag(bounds.right - 10, bounds.top + 40, bounds.right - 10, bounds.bottom - 40, 1000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0030
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0030', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0030';
      let pageName = 'UIComponentOtherScrollableAnimation0030';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0040
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0040', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0040';
      let pageName = 'UIComponentOtherScrollableAnimation0040';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.mouseDrag({x: bounds.right - 10, y: bounds.top + 40}, {x: bounds.right - 10, y: bounds.bottom - 40}, 1000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0050
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0050', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0050';
      let pageName = 'UIComponentOtherScrollableAnimation0050';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0060
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0060', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0060';
      let pageName = 'UIComponentOtherScrollableAnimation0060';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let item1: Component = await driver.waitForComponent(ON.id(pageName + '_02_0'), 1000);
      let item2: Component = await driver.waitForComponent(ON.id(pageName + '_02_1'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      let item1Center = await item1.getBoundsCenter();
      let item2Center = await item2.getBoundsCenter();
      await driver.waitForIdle(1000, 2000);
      await driver.drag(item1Center.x, item1Center.y, item2Center.x, item2Center.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0070
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0070', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0070';
      let pageName = 'UIComponentOtherScrollableAnimation0070';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let item1: Component = await driver.waitForComponent(ON.id(pageName + '_02_0'), 1000);
      let item2: Component = await driver.waitForComponent(ON.id(pageName + '_02_1'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      let item1Center = await item1.getBoundsCenter();
      let item2Center = await item2.getBoundsCenter();
      await driver.waitForIdle(1000, 2000);
      await driver.mouseDrag({x: item1Center.x, y: item1Center.y}, {x: item2Center.x, y: item2Center.y}, 1000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0080
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0080', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0080';
      let pageName = 'UIComponentOtherScrollableAnimation0080';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0090
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0090', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0090';
      let pageName = 'UIComponentOtherScrollableAnimation0090';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0100
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0100', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0100';
      let pageName = 'UIComponentOtherScrollableAnimation0100';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(bounds.right - 20, center.y, bounds.left + 20, center.y, 6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0110
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0110', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0110';
      let pageName = 'UIComponentOtherScrollableAnimation0110';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.drag(bounds.left + 50, bounds.bottom - 10, bounds.right - 50, bounds.bottom - 10, 6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0120
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0120', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0120';
      let pageName = 'UIComponentOtherScrollableAnimation0120';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(bounds.right - 20, center.y, bounds.left + 20, center.y, 6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0130
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0130', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0130';
      let pageName = 'UIComponentOtherScrollableAnimation0130';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.mouseDrag({x: bounds.left + 50, y: bounds.bottom - 10}, {x: bounds.right - 50, y: bounds.bottom - 10}, 6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0140
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0140', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0140';
      let pageName = 'UIComponentOtherScrollableAnimation0140';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let scrollBar: Component = await driver.waitForComponent(ON.id(pageName + '_04'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      let barCenter = await scrollBar.getBoundsCenter();
      let barBounds = await scrollBar.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.drag(barBounds.left + 50, barCenter.y, barBounds.right - 50, barCenter.y, 6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0150
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0150', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0150';
      let pageName = 'UIComponentOtherScrollableAnimation0150';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let item1: Component = await driver.waitForComponent(ON.id(pageName + '_02_0'), 1000);
      let item2: Component = await driver.waitForComponent(ON.id(pageName + '_02_1'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      let item1Center = await item1.getBoundsCenter();
      let item2Center = await item2.getBoundsCenter();
      await driver.waitForIdle(1000, 2000);
      await driver.drag(item1Center.x, item1Center.y, item2Center.x, item2Center.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0160
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0160', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0160';
      let pageName = 'UIComponentOtherScrollableAnimation0160';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let item1: Component = await driver.waitForComponent(ON.id(pageName + '_02_0'), 1000);
      let item2: Component = await driver.waitForComponent(ON.id(pageName + '_02_1'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      let item1Center = await item1.getBoundsCenter();
      let item2Center = await item2.getBoundsCenter();
      await driver.waitForIdle(1000, 2000);
      await driver.mouseDrag({x: item1Center.x, y: item1Center.y}, {x: item2Center.x, y: item2Center.y}, 1000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0170
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0170', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0170';
      let pageName = 'UIComponentOtherScrollableAnimation0170';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(bounds.right - 20, center.y, bounds.left + 20, center.y, 6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0180
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0180', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0180';
      let pageName = 'UIComponentOtherScrollableAnimation0180';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(bounds.right - 20, center.y, bounds.left + 20, center.y, 6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0190
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0190', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0190';
      let pageName = 'UIComponentOtherScrollableAnimation0190';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0200
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0200', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0200';
      let pageName = 'UIComponentOtherScrollableAnimation0200';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(bounds.right - 15, bounds.top + 50, bounds.right - 15, bounds.bottom - 50, 2000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0210
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0210', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0210';
      let pageName = 'UIComponentOtherScrollableAnimation0210';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.mouseDrag({x: bounds.right - 15, y: bounds.top + 50}, {x: bounds.right - 15, y: bounds.bottom - 50}, 2000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0220
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0220', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0220';
      let pageName = 'UIComponentOtherScrollableAnimation0220';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let scrollbar: Component = await driver.waitForComponent(ON.id(pageName + '_04'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      let barCenter = await scrollbar.getBoundsCenter();
      let barBounds = await scrollbar.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.drag(barCenter.x, barBounds.top + 50, barCenter.x, barBounds.bottom - 50, 6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0230
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0230', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0230';
      let pageName = 'UIComponentOtherScrollableAnimation0230';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let item1: Component = await driver.waitForComponent(ON.id(pageName + '_02_0'), 1000);
      let item2: Component = await driver.waitForComponent(ON.id(pageName + '_02_1'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      let item1Center = await item1.getBoundsCenter();
      let item2Center = await item2.getBoundsCenter();
      await driver.waitForIdle(1000, 2000);
      await driver.drag(item1Center.x, item1Center.y, item2Center.x, item2Center.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0240
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0240', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0240';
      let pageName = 'UIComponentOtherScrollableAnimation0240';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let item1: Component = await driver.waitForComponent(ON.id(pageName + '_02_0'), 1000);
      let item2: Component = await driver.waitForComponent(ON.id(pageName + '_02_1'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      let item1Center = await item1.getBoundsCenter();
      let item2Center = await item2.getBoundsCenter();
      await driver.waitForIdle(1000, 2000);
      await driver.mouseDrag({x: item1Center.x, y: item1Center.y}, {x: item2Center.x, y: item2Center.y}, 1000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0250
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0250', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0250';
      let pageName = 'UIComponentOtherScrollableAnimation0250';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0260
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0260', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0260';
      let pageName = 'UIComponentOtherScrollableAnimation0260';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0270
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0270', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0270';
      let pageName = 'UIComponentOtherScrollableAnimation0270';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(bounds.right - 20, center.y, bounds.left + 20, center.y, 6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0280
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0280', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0280';
      let pageName = 'UIComponentOtherScrollableAnimation0280';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(bounds.left + 50, bounds.bottom - 10, bounds.right - 50, bounds.bottom - 10, 6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0290
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0290', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0290';
      let pageName = 'UIComponentOtherScrollableAnimation0290';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.mouseDrag({x: bounds.left + 50, y: bounds.bottom - 10}, {x: bounds.right - 50, y: bounds.bottom - 10}, 6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0300
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0300', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0300';
      let pageName = 'UIComponentOtherScrollableAnimation0300';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let scrollbar: Component = await driver.waitForComponent(ON.id(pageName + '_04'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      let barCenter = await scrollbar.getBoundsCenter();
      let barBounds = await scrollbar.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(barBounds.left + 50, barCenter.y, barBounds.right - 50, barCenter.y, 6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0310
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0310', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0310';
      let pageName = 'UIComponentOtherScrollableAnimation0310';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let item1: Component = await driver.waitForComponent(ON.id(pageName + '_02_0'), 1000);
      let item2: Component = await driver.waitForComponent(ON.id(pageName + '_02_1'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      let item1Center = await item1.getBoundsCenter();
      let item2Center = await item2.getBoundsCenter();
      await driver.waitForIdle(1000, 2000);
      await driver.drag(item1Center.x, item1Center.y, item2Center.x, item2Center.y, 1000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0320
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0320', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0320';
      let pageName = 'UIComponentOtherScrollableAnimation0320';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let item1: Component = await driver.waitForComponent(ON.id(pageName + '_02_0'), 1000);
      let item2: Component = await driver.waitForComponent(ON.id(pageName + '_02_1'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      let item1Center = await item1.getBoundsCenter();
      let item2Center = await item2.getBoundsCenter();
      await driver.waitForIdle(1000, 2000);
      await driver.mouseDrag({x: item1Center.x, y: item1Center.y}, {x: item2Center.x, y: item2Center.y}, 1000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0330
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0330', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0330';
      let pageName = 'UIComponentOtherScrollableAnimation0330';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(bounds.right - 20, center.y, bounds.left + 20, center.y, 6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0340
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0340', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0340';
      let pageName = 'UIComponentOtherScrollableAnimation0340';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(bounds.right - 20, center.y, bounds.left + 20, center.y, 6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0350
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0350', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0350';
      let pageName = 'UIComponentOtherScrollableAnimation0350';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0360
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0360', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0360';
      let pageName = 'UIComponentOtherScrollableAnimation0360';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(bounds.right - 10, bounds.top + 50, bounds.right - 10, bounds.bottom - 50, 6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0370
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0370', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0370';
      let pageName = 'UIComponentOtherScrollableAnimation0370';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.mouseDrag({x: bounds.right - 10, y: bounds.top + 50}, {x: bounds.right - 10, y: bounds.bottom - 50}, 6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0380
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0380', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0380';
      let pageName = 'UIComponentOtherScrollableAnimation0380';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0400
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0400', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0400';
      let pageName = 'UIComponentOtherScrollableAnimation0400';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0410
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0410', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0410';
      let pageName = 'UIComponentOtherScrollableAnimation0410';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(bounds.right - 50, center.y, bounds.left + 50, center.y, 6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0420
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0420', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0420';
      let pageName = 'UIComponentOtherScrollableAnimation0420';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(bounds.left + 50, bounds.bottom - 10, bounds.right - 50, bounds.bottom - 10, 6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0430
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0430', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0430';
      let pageName = 'UIComponentOtherScrollableAnimation0430';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.mouseDrag({x: bounds.left + 50, y: bounds.bottom - 10}, {x: bounds.right - 50, y: bounds.bottom - 10}, 6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0440
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0440', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0440';
      let pageName = 'UIComponentOtherScrollableAnimation0440';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(bounds.right - 50, center.y, bounds.left + 50, center.y, 6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0460
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0460', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0460';
      let pageName = 'UIComponentOtherScrollableAnimation0460';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(bounds.right - 50, center.y, bounds.left + 50, center.y, 6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0590
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0590', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0590';
      let pageName = 'UIComponentOtherScrollableAnimation0590';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(bounds.right - 10, bounds.top + 50, bounds.right - 10, bounds.bottom - 50, 6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0600
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0600', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0600';
      let pageName = 'UIComponentOtherScrollableAnimation0600';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.mouseMoveTo({x: bounds.right - 12, y: bounds.top + 50});
      await driver.waitForIdle(1000, 2000);
      await driver.mouseDrag({x: bounds.right - 12, y: bounds.top + 50}, {x: bounds.right - 12, y: bounds.bottom - 50}, 6000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0610
     * @tc.name   : Other scrollable animation
     * @tc.desc   : Verify other scrollable animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0610', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_OTHER_SCROLLABLE_ANIMATION_0610';
      let pageName = 'UIComponentOtherScrollableAnimation0610';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/OtherScrollableAnimation/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let item: Component = await driver.waitForComponent(ON.id(pageName + '_02_1'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      let itemBounds = await item.getBounds();
      let itemCenter = await item.getBoundsCenter();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(itemBounds.right - 50, itemCenter.y, itemBounds.left + 50, itemCenter.y, 2000);
      await driver.waitForIdle(1000, 2000);
      await logComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

  })
}