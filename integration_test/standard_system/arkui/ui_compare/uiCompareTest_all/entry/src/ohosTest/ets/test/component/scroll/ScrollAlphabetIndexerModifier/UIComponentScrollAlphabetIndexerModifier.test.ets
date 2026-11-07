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

export default function uIComponentScrollAlphabetIndexerModifier() {
  describe('uIComponentScrollAlphabetIndexerModifier', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_0970
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_0970', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_0970';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier0970';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_0980
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_0980', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_0980';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier0980';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_0990
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_0990', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_0990';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier0990';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1000
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1000', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1000';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1000';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1010
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1010', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1010';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1010';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1020
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1020', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1020';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1020';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await button.click();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1080
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1080', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1080';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1080';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(10000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1090
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1090', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1090';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1090';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1100
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1100', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1100';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1100';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1110
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1110', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1110';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1110';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1170
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1170', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1170';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1170';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top + 20, 6000);
      await Utils.sleep(1500);
      targetComponent = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      center = await targetComponent.getBoundsCenter();
      bounds = await targetComponent.getBounds();
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top + 20, 6000);
      await Utils.sleep(1500);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.top + 20, center.x, bounds.bottom - 20, 6000);
      await Utils.sleep(1500);
      targetComponent = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      center = await targetComponent.getBoundsCenter();
      bounds = await targetComponent.getBounds();
      await driver.swipe(center.x, bounds.top + 20, center.x, bounds.bottom - 20, 6000);
      await Utils.sleep(1500);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1180
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1180', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1180';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1180';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top + 20, 6000);
      await Utils.sleep(1500);
      targetComponent = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      center = await targetComponent.getBoundsCenter();
      bounds = await targetComponent.getBounds();
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top + 20, 6000);
      await Utils.sleep(1500);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.top + 20, center.x, bounds.bottom - 20, 6000);
      await Utils.sleep(1500);
      targetComponent = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      center = await targetComponent.getBoundsCenter();
      bounds = await targetComponent.getBounds();
      await driver.swipe(center.x, bounds.top + 20, center.x, bounds.bottom - 20, 6000);
      await Utils.sleep(1500);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1190
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1190', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1190';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1190';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top + 20, 6000);
      await Utils.sleep(1500);
      targetComponent = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      center = await targetComponent.getBoundsCenter();
      bounds = await targetComponent.getBounds();
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top + 20, 6000);
      await Utils.sleep(1500);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.top + 20, center.x, bounds.bottom - 20, 6000);
      await Utils.sleep(1500);
      targetComponent = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      center = await targetComponent.getBoundsCenter();
      bounds = await targetComponent.getBounds();
      await driver.swipe(center.x, bounds.top + 20, center.x, bounds.bottom - 20, 6000);
      await Utils.sleep(1500);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1200
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1200', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1200';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1200';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top + 20, 6000);
      await Utils.sleep(1500);
      targetComponent = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      center = await targetComponent.getBoundsCenter();
      bounds = await targetComponent.getBounds();
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top + 20, 6000);
      await Utils.sleep(1500);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.top + 20, center.x, bounds.bottom - 20, 6000);
      await Utils.sleep(1500);
      targetComponent = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      center = await targetComponent.getBoundsCenter();
      bounds = await targetComponent.getBounds();
      await driver.swipe(center.x, bounds.top + 20, center.x, bounds.bottom - 20, 6000);
      await Utils.sleep(1500);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1210
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1210', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1210';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1210';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top + 20, 6000);
      await Utils.sleep(1500);
      targetComponent = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      center = await targetComponent.getBoundsCenter();
      bounds = await targetComponent.getBounds();
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top + 20, 6000);
      await Utils.sleep(1500);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.top + 20, center.x, bounds.bottom - 20, 6000);
      await Utils.sleep(1500);
      targetComponent = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      center = await targetComponent.getBoundsCenter();
      bounds = await targetComponent.getBounds();
      await driver.swipe(center.x, bounds.top + 20, center.x, bounds.bottom - 20, 6000);
      await Utils.sleep(1500);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1220
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1220', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1220';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1220';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top + 20, 6000);
      await Utils.sleep(1500);
      targetComponent = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      center = await targetComponent.getBoundsCenter();
      bounds = await targetComponent.getBounds();
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top + 20, 6000);
      await Utils.sleep(1500);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.top + 20, center.x, bounds.bottom - 20, 6000);
      await Utils.sleep(1500);
      targetComponent = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      center = await targetComponent.getBoundsCenter();
      bounds = await targetComponent.getBounds();
      await driver.swipe(center.x, bounds.top + 20, center.x, bounds.bottom - 20, 6000);
      await Utils.sleep(1500);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1230
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1230', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1230';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1230';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top + 20, 6000);
      await Utils.sleep(1500);
      targetComponent = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      center = await targetComponent.getBoundsCenter();
      bounds = await targetComponent.getBounds();
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top + 20, 6000);
      await Utils.sleep(1500);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.top + 20, center.x, bounds.bottom - 20, 6000);
      await Utils.sleep(1500);
      targetComponent = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      center = await targetComponent.getBoundsCenter();
      bounds = await targetComponent.getBounds();
      await driver.swipe(center.x, bounds.top + 20, center.x, bounds.bottom - 20, 6000);
      await Utils.sleep(1500);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1240
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1240', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1240';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1240';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top + 20, 6000);
      await Utils.sleep(1500);
      targetComponent = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      center = await targetComponent.getBoundsCenter();
      bounds = await targetComponent.getBounds();
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top + 20, 6000);
      await Utils.sleep(1500);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.top + 20, center.x, bounds.bottom - 20, 6000);
      await Utils.sleep(1500);
      targetComponent = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      center = await targetComponent.getBoundsCenter();
      bounds = await targetComponent.getBounds();
      await driver.swipe(center.x, bounds.top + 20, center.x, bounds.bottom - 20, 6000);
      await Utils.sleep(1500);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1250
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1250', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1250';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1250';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top + 20, 6000);
      await Utils.sleep(1500);
      targetComponent = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      center = await targetComponent.getBoundsCenter();
      bounds = await targetComponent.getBounds();
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top + 20, 6000);
      await Utils.sleep(1500);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.top + 20, center.x, bounds.bottom - 20, 6000);
      await Utils.sleep(1500);
      targetComponent = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      center = await targetComponent.getBoundsCenter();
      bounds = await targetComponent.getBounds();
      await driver.swipe(center.x, bounds.top + 20, center.x, bounds.bottom - 20, 6000);
      await Utils.sleep(1500);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1260
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1260', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1260';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1260';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top + 20, 6000);
      await Utils.sleep(1500);
      targetComponent = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      center = await targetComponent.getBoundsCenter();
      bounds = await targetComponent.getBounds();
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top + 20, 6000);
      await Utils.sleep(1500);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.top + 20, center.x, bounds.bottom - 20, 6000);
      await Utils.sleep(1500);
      targetComponent = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      center = await targetComponent.getBoundsCenter();
      bounds = await targetComponent.getBounds();
      await driver.swipe(center.x, bounds.top + 20, center.x, bounds.bottom - 20, 6000);
      await Utils.sleep(1500);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1270
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1270', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1270';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1270';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top + 20, 6000);
      await Utils.sleep(1500);
      targetComponent = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      center = await targetComponent.getBoundsCenter();
      bounds = await targetComponent.getBounds();
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top + 20, 6000);
      await Utils.sleep(1500);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.top + 20, center.x, bounds.bottom - 20, 6000);
      await Utils.sleep(1500);
      targetComponent = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      center = await targetComponent.getBoundsCenter();
      bounds = await targetComponent.getBounds();
      await driver.swipe(center.x, bounds.top + 20, center.x, bounds.bottom - 20, 6000);
      await Utils.sleep(1500);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1280
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1280', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1280';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1280';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top + 20, 6000);
      await Utils.sleep(1500);
      targetComponent = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      center = await targetComponent.getBoundsCenter();
      bounds = await targetComponent.getBounds();
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top + 20, 6000);
      await Utils.sleep(1500);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.top + 20, center.x, bounds.bottom - 20, 6000);
      await Utils.sleep(1500);
      targetComponent = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      center = await targetComponent.getBoundsCenter();
      bounds = await targetComponent.getBounds();
      await driver.swipe(center.x, bounds.top + 20, center.x, bounds.bottom - 20, 6000);
      await Utils.sleep(1500);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1290
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1290', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1290';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1290';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top + 20, 6000);
      await Utils.sleep(1500);
      targetComponent = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      center = await targetComponent.getBoundsCenter();
      bounds = await targetComponent.getBounds();
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top + 20, 6000);
      await Utils.sleep(1500);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.top + 20, center.x, bounds.bottom - 20, 6000);
      await Utils.sleep(1500);
      targetComponent = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      center = await targetComponent.getBoundsCenter();
      bounds = await targetComponent.getBounds();
      await driver.swipe(center.x, bounds.top + 20, center.x, bounds.bottom - 20, 6000);
      await Utils.sleep(1500);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1300
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1300', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1300';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1300';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top + 20, 6000);
      await Utils.sleep(1500);
      targetComponent = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      center = await targetComponent.getBoundsCenter();
      bounds = await targetComponent.getBounds();
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top + 20, 6000);
      await Utils.sleep(1500);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.top + 20, center.x, bounds.bottom - 20, 6000);
      await Utils.sleep(1500);
      targetComponent = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      center = await targetComponent.getBoundsCenter();
      bounds = await targetComponent.getBounds();
      await driver.swipe(center.x, bounds.top + 20, center.x, bounds.bottom - 20, 6000);
      await Utils.sleep(1500);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1310
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1310', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1310';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1310';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top + 20, 6000);
      await Utils.sleep(1500);
      targetComponent = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      center = await targetComponent.getBoundsCenter();
      bounds = await targetComponent.getBounds();
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top + 20, 6000);
      await Utils.sleep(1500);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.top + 20, center.x, bounds.bottom - 20, 6000);
      await Utils.sleep(1500);
      targetComponent = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      center = await targetComponent.getBoundsCenter();
      bounds = await targetComponent.getBounds();
      await driver.swipe(center.x, bounds.top + 20, center.x, bounds.bottom - 20, 6000);
      await Utils.sleep(1500);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1320
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1320', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1320';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1320';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top + 20, 6000);
      await Utils.sleep(1500);
      targetComponent = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      center = await targetComponent.getBoundsCenter();
      bounds = await targetComponent.getBounds();
      await driver.swipe(center.x, bounds.bottom - 20, center.x, bounds.top + 20, 6000);
      await Utils.sleep(1500);
      await windowSnap.snapShot(TAG + '_01');
      await driver.waitForIdle(1000, 2000);
      await driver.swipe(center.x, bounds.top + 20, center.x, bounds.bottom - 20, 6000);
      await Utils.sleep(1500);
      targetComponent = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      center = await targetComponent.getBoundsCenter();
      bounds = await targetComponent.getBounds();
      await driver.swipe(center.x, bounds.top + 20, center.x, bounds.bottom - 20, 6000);
      await Utils.sleep(1500);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1500
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1500', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1500';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1500';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await Utils.sleep(3000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1510
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1510', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1510';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1510';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await Utils.sleep(3000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1520
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1520', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1520';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1520';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await Utils.sleep(3000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1530
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1530', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1530';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1530';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot(TAG + '_01');
      await Utils.sleep(3000);
      await windowSnap.snapShot(TAG + '_02');
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1540
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1540', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1540';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1540';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1570
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1570', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1570';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1570';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1580
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1580', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1580';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1580';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1590
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1590', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1590';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1590';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1600
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1600', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1600';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1600';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1610
     * @tc.name   : Scroll alphabetindexermodifier
     * @tc.desc   : Verify scroll alphabetindexermodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1610', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_SCROLL_ALPHABETINDEXERMODIFIER_1610';
      let pageName = 'UIComponentScrollAlphabetIndexerModifier1610';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollAlphabetIndexerModifier/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let targetComponent: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let logComponent: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let center = await targetComponent.getBoundsCenter();
      let bounds = await targetComponent.getBounds();
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await targetComponent.scrollToBottom(6000);
      await driver.waitForIdle(1000, 2000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

  })
}