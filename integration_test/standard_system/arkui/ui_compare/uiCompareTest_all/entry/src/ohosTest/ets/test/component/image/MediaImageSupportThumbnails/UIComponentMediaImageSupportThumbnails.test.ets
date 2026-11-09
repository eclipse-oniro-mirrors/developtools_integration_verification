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

export default function uIComponentMediaImageSupportThumbnails() {
  describe('uIComponentMediaImageSupportThumbnails', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0013
     * @tc.name   : Media Image support thumbnails
     * @tc.desc   : Verify media Image support thumbnails interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0013', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0013';
      let pageName = 'UIComponentMediaImageSupportThumbnails0013';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/image/MediaImageSupportThumbnails/' + pageName);
      let driver: Driver = Driver.create();
      let translateXButton: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let translateYButton: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      await translateXButton.click();
      await driver.waitForIdle(500, 1000);
      await translateYButton.click();
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0014
     * @tc.name   : Media Image support thumbnails
     * @tc.desc   : Verify media Image support thumbnails interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0014', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0014';
      let pageName = 'UIComponentMediaImageSupportThumbnails0014';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/image/MediaImageSupportThumbnails/' + pageName);
      let driver: Driver = Driver.create();
      let scaleXButton: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let scaleYButton: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let centerXButton: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let centerYButton: Component = await driver.waitForComponent(ON.id(pageName + '_04'), 1000);
      await scaleXButton.click();
      await driver.waitForIdle(500, 1000);
      await scaleYButton.click();
      await driver.waitForIdle(500, 1000);
      await centerXButton.click();
      await driver.waitForIdle(500, 1000);
      await centerYButton.click();
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0016
     * @tc.name   : Media Image support thumbnails
     * @tc.desc   : Verify media Image support thumbnails interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0016', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SUPPORT_THUMBNAILS_0016';
      let pageName = 'UIComponentMediaImageSupportThumbnails0016';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/image/MediaImageSupportThumbnails/' + pageName);
      let driver: Driver = Driver.create();
      let rotateXButton: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let rotateYButton: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let centerXButton: Component = await driver.waitForComponent(ON.id(pageName + '_03'), 1000);
      let centerYButton: Component = await driver.waitForComponent(ON.id(pageName + '_04'), 1000);
      let angleButton: Component = await driver.waitForComponent(ON.id(pageName + '_05'), 1000);
      await angleButton.click();
      await driver.waitForIdle(500, 1000);
      await rotateXButton.click();
      await driver.waitForIdle(500, 1000);
      await rotateYButton.click();
      await driver.waitForIdle(500, 1000);
      await centerXButton.click();
      await driver.waitForIdle(500, 1000);
      await centerYButton.click();
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

  })
}