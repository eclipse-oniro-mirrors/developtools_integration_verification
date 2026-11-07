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

export default function uIComponentMediaImageReset() {
  describe('uIComponentMediaImageReset', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0034
     * @tc.name   : Media Image reset
     * @tc.desc   : Verify media Image reset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0034', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0034';
      let pageName = 'UIComponentMediaImageReset0034';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/image/MediaImageReset/' + pageName);
      let driver: Driver = Driver.create();
      let image: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let imageCenter = await image.getBoundsCenter();
      await button.click();
      await driver.waitForIdle(500, 1000);
      await driver.drag(imageCenter.x, imageCenter.y, imageCenter.x, imageCenter.y + 300, 300);
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot();
      await driver.waitForIdle(500, 3000);
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0035
     * @tc.name   : Media Image reset
     * @tc.desc   : Verify media Image reset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0035', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0035';
      let pageName = 'UIComponentMediaImageReset0035';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/image/MediaImageReset/' + pageName);
      let driver: Driver = Driver.create();
      let image: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let imageCenter = await image.getBoundsCenter();
      await button.click();
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0039
     * @tc.name   : Media Image reset
     * @tc.desc   : Verify media Image reset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0039', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_RESET_0039';
      let pageName = 'UIComponentMediaImageReset0039';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/image/MediaImageReset/' + pageName);
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      try {
        await uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT)
          .then(() => {
            console.info(`[${TAG}] Set light-mode successfully.`);
          })
          .catch((error: BusinessError) => {
            console.error(`[${TAG}] error setting light-mode: ${JSON.stringify(error)}`);
          })
        await uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_DARK)
          .then(() => {
            Logger.info(`[${TAG}] Set dark-mode successfully.`);
          })
          .catch((error: BusinessError) => {
            Logger.error(`[${TAG}] error setting dark-mode: ${JSON.stringify(error)}`);
          })
      } catch (error) {
        let message = (error as BusinessError).message;
        Logger.error(`[${TAG}]`, 'Set dark-mode failed, ' + message);
      }
      let image: Component = await driver.waitForComponent(ON.id(pageName + '_01'), 1000);
      let button: Component = await driver.waitForComponent(ON.id(pageName + '_02'), 1000);
      let imageCenter = await image.getBoundsCenter();
      await button.click();
      await driver.waitForIdle(500, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

  })
}