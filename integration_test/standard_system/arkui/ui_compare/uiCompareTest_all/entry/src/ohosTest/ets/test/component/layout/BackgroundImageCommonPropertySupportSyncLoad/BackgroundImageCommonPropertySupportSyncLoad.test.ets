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

export default function backgroundImageCommonPropertySupportSyncLoad() {
  describe('backgroundImageCommonPropertySupportSyncLoad', () => {
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
     * @tc.number : SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_019
     * @tc.name   : Backgroundimage common property support sync load
     * @tc.desc   : Verify backgroundimage common property support sync load interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_019', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_019';
      let pageName = 'BackgroundImageCommonPropertySupportSyncLoad019';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/BackgroundImageCommonPropertySupportSyncLoad/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await button1.click();
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_020
     * @tc.name   : Backgroundimage common property support sync load
     * @tc.desc   : Verify backgroundimage common property support sync load interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_020', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_020';
      let pageName = 'BackgroundImageCommonPropertySupportSyncLoad020';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/BackgroundImageCommonPropertySupportSyncLoad/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await button1.click();
      await driver.waitForIdle(2000, 3000);
      await button2.click();
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_021
     * @tc.name   : Backgroundimage common property support sync load
     * @tc.desc   : Verify backgroundimage common property support sync load interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_021', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_021';
      let pageName = 'BackgroundImageCommonPropertySupportSyncLoad021';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/BackgroundImageCommonPropertySupportSyncLoad/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await button1.click();
      await driver.waitForIdle(2000, 3000);
      await button2.click();
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_022
     * @tc.name   : Backgroundimage common property support sync load
     * @tc.desc   : Verify backgroundimage common property support sync load interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_022', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_022';
      let pageName = 'BackgroundImageCommonPropertySupportSyncLoad022';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/BackgroundImageCommonPropertySupportSyncLoad/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await button1.click();
      await driver.waitForIdle(2000, 3000);
      await button2.click();
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_023
     * @tc.name   : Backgroundimage common property support sync load
     * @tc.desc   : Verify backgroundimage common property support sync load interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_023', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_023';
      let pageName = 'BackgroundImageCommonPropertySupportSyncLoad023';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/BackgroundImageCommonPropertySupportSyncLoad/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await button1.click();
      await driver.waitForIdle(2000, 3000);
      await button2.click();
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_024
     * @tc.name   : Backgroundimage common property support sync load
     * @tc.desc   : Verify backgroundimage common property support sync load interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_024', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_024';
      let pageName = 'BackgroundImageCommonPropertySupportSyncLoad024';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/BackgroundImageCommonPropertySupportSyncLoad/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await button1.click();
      await driver.waitForIdle(2000, 3000);
      await button2.click();
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_025
     * @tc.name   : Backgroundimage common property support sync load
     * @tc.desc   : Verify backgroundimage common property support sync load interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_025', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_025';
      let pageName = 'BackgroundImageCommonPropertySupportSyncLoad025';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/BackgroundImageCommonPropertySupportSyncLoad/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await button1.click();
      await driver.waitForIdle(2000, 3000);
      await button2.click();
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_026
     * @tc.name   : Backgroundimage common property support sync load
     * @tc.desc   : Verify backgroundimage common property support sync load interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_026', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_026';
      let pageName = 'BackgroundImageCommonPropertySupportSyncLoad026';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/BackgroundImageCommonPropertySupportSyncLoad/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await button1.click();
      await driver.waitForIdle(2000, 3000);
      await button2.click();
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_027
     * @tc.name   : Backgroundimage common property support sync load
     * @tc.desc   : Verify backgroundimage common property support sync load interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_027', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_027';
      let pageName = 'BackgroundImageCommonPropertySupportSyncLoad027';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/BackgroundImageCommonPropertySupportSyncLoad/' + pageName);
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button2: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await button1.click();
      await driver.waitForIdle(2000, 3000);
      await button2.click();
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_028
     * @tc.name   : Backgroundimage common property support sync load
     * @tc.desc   : Verify backgroundimage common property support sync load interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_028', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_028';
      let pageName = 'BackgroundImageCommonPropertySupportSyncLoad028';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/BackgroundImageCommonPropertySupportSyncLoad/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let scroll: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await button.click();
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_029
     * @tc.name   : Backgroundimage common property support sync load
     * @tc.desc   : Verify backgroundimage common property support sync load interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_029', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_029';
      let pageName = 'BackgroundImageCommonPropertySupportSyncLoad029';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/BackgroundImageCommonPropertySupportSyncLoad/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let scroll: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await button.click();
      await driver.waitForIdle(2000, 3000);
      await scroll.scrollToBottom(3000);
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_030
     * @tc.name   : Backgroundimage common property support sync load
     * @tc.desc   : Verify backgroundimage common property support sync load interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_030', Level.LEVEL3, async (done: Function) => {
      TAG = 'SUB_ACE_BACKGROUNDIMAGE_COMMON_PROPERTY_SUPPORT_SYNC_LOAD_030';
      let pageName = 'BackgroundImageCommonPropertySupportSyncLoad030';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/layout/BackgroundImageCommonPropertySupportSyncLoad/' + pageName);
      let driver: Driver = Driver.create();
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let scroll: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await button.click();
      await driver.waitForIdle(2000, 3000);
      await scroll.scrollToBottom(3000);
      await driver.waitForIdle(2000, 3000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

  })
}