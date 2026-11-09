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

import { window } from '@kit.ArkUI';
import { wifiManager } from '@kit.ConnectivityKit';
import { Driver, ON ,Component, UiWindow } from '@kit.TestKit';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';
import Utils from '../../../model/Utils';


let TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI';

function sleep(ms: number) {
  return new Promise<string>(resolve => setTimeout(resolve, ms));
}

export default function uIComponentMediaVideoAI() {
  describe('uIComponentMediaVideoAI', () => {
    beforeAll(async (done: Function) => {
      try {
        wifiManager.enableWifi();
      } catch (error) {
        Logger.error(`[${TAG}_beforeAll]`, 'enableWifi failed:' + JSON.stringify(error));
      }
      await Utils.sleep(5000);
      done();
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
      done()
    })

    afterAll(() => {

    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0150
     * @tc.name   : Media video ai
     * @tc.desc   : Verify media video ai interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0150', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0150';
      let pageName = 'UIComponentMediaVideoAI015';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/MediaVideoAI/' + pageName);
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 1000);
      let startButton: Component = await driver.findComponent(ON.id(pageName + '_003'));
      let pauseButton: Component = await driver.findComponent(ON.id(pageName + '_004'));
      let video: Component = await driver.findComponent(ON.id(pageName + '_005'));
      await startButton.click();
      let videoCenter = await video.getBoundsCenter();
      Logger.info(`[${TAG}]`, `videoCenter: X = ${videoCenter.x}, Y = ${videoCenter.y}`);
      await driver.waitForIdle(3000, 3000);
      await pauseButton.click();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y});
      await driver.longClick(videoCenter.x, videoCenter.y);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y + 180});
      await driver.longClick(videoCenter.x, videoCenter.y + 180);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0160
     * @tc.name   : Media video ai
     * @tc.desc   : Verify media video ai interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0160', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0160';
      let pageName = 'UIComponentMediaVideoAI016';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/MediaVideoAI/' + pageName);
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 1000);
      let startButton: Component = await driver.findComponent(ON.id(pageName + '_003'));
      let pauseButton: Component = await driver.findComponent(ON.id(pageName + '_004'));
      let video: Component = await driver.findComponent(ON.id(pageName + '_005'));
      await startButton.click();
      let videoCenter = await video.getBoundsCenter();
      Logger.info(`[${TAG}]`, `videoCenter: X = ${videoCenter.x}, Y = ${videoCenter.y}`);
      await driver.waitForIdle(3000, 3000);
      await pauseButton.click();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y});
      await driver.longClick(videoCenter.x, videoCenter.y);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y + 180});
      await driver.longClick(videoCenter.x, videoCenter.y + 180);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0170
     * @tc.name   : Media video ai
     * @tc.desc   : Verify media video ai interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0170', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0170';
      let pageName = 'UIComponentMediaVideoAI017';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/MediaVideoAI/' + pageName);
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 1000);
      let startButton: Component = await driver.findComponent(ON.id(pageName + '_003'));
      let pauseButton: Component = await driver.findComponent(ON.id(pageName + '_004'));
      let video: Component = await driver.findComponent(ON.id(pageName + '_005'));
      await startButton.click();
      let videoCenter = await video.getBoundsCenter();
      Logger.info(`[${TAG}]`, `videoCenter: X = ${videoCenter.x}, Y = ${videoCenter.y}`);
      await driver.waitForIdle(3000, 3000);
      await pauseButton.click();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y});
      await driver.longClick(videoCenter.x, videoCenter.y);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y + 180});
      await driver.longClick(videoCenter.x, videoCenter.y + 180);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0180
     * @tc.name   : Media video ai
     * @tc.desc   : Verify media video ai interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0180', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0180';
      let pageName = 'UIComponentMediaVideoAI018';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/MediaVideoAI/' + pageName);
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 1000);
      let startButton: Component = await driver.findComponent(ON.id(pageName + '_003'));
      let pauseButton: Component = await driver.findComponent(ON.id(pageName + '_004'));
      let video: Component = await driver.findComponent(ON.id(pageName + '_005'));
      await startButton.click();
      let videoCenter = await video.getBoundsCenter();
      Logger.info(`[${TAG}]`, `videoCenter: X = ${videoCenter.x}, Y = ${videoCenter.y}`);
      await driver.waitForIdle(3000, 3000);
      await pauseButton.click();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y});
      await driver.longClick(videoCenter.x, videoCenter.y);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y + 180});
      await driver.longClick(videoCenter.x, videoCenter.y + 180);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0190
     * @tc.name   : Media video ai
     * @tc.desc   : Verify media video ai interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0190', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0190';
      let pageName = 'UIComponentMediaVideoAI019';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/MediaVideoAI/' + pageName);
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 1000);
      let startButton: Component = await driver.findComponent(ON.id(pageName + '_003'));
      let pauseButton: Component = await driver.findComponent(ON.id(pageName + '_004'));
      let video: Component = await driver.findComponent(ON.id(pageName + '_005'));
      await startButton.click();
      let videoCenter = await video.getBoundsCenter();
      Logger.info(`[${TAG}]`, `videoCenter: X = ${videoCenter.x}, Y = ${videoCenter.y}`);
      await driver.waitForIdle(3000, 3000);
      await pauseButton.click();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y});
      await driver.longClick(videoCenter.x, videoCenter.y);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y + 180});
      await driver.longClick(videoCenter.x, videoCenter.y + 180);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();

      let indexAddButton: Component = await driver.findComponent(ON.id(pageName + '_001'));
      let indexSubButton: Component = await driver.findComponent(ON.id(pageName + '_002'));
      await indexAddButton.click();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y});
      await driver.longClick(videoCenter.x, videoCenter.y);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y + 180});
      await driver.longClick(videoCenter.x, videoCenter.y + 180);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();

      await indexSubButton.click();
      await startButton.click();
      await driver.waitForIdle(2000, 2000);
      await pauseButton.click();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y});
      await driver.longClick(videoCenter.x, videoCenter.y);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y + 180});
      await driver.longClick(videoCenter.x, videoCenter.y + 180);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();

      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0200
     * @tc.name   : Media video ai
     * @tc.desc   : Verify media video ai interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0200', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0200';
      let pageName = 'UIComponentMediaVideoAI020';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/MediaVideoAI/' + pageName);
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 1000);
      let startButton: Component = await driver.findComponent(ON.id(pageName + '_003'));
      let pauseButton: Component = await driver.findComponent(ON.id(pageName + '_004'));
      let video: Component = await driver.findComponent(ON.id(pageName + '_005'));
      await startButton.click();
      let videoCenter = await video.getBoundsCenter();
      Logger.info(`[${TAG}]`, `videoCenter: X = ${videoCenter.x}, Y = ${videoCenter.y}`);
      await driver.waitForIdle(3000, 3000);
      await pauseButton.click();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y});
      await driver.longClick(videoCenter.x, videoCenter.y);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y + 180});
      await driver.longClick(videoCenter.x, videoCenter.y + 180);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0210
     * @tc.name   : Media video ai
     * @tc.desc   : Verify media video ai interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0210', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0210';
      let pageName = 'UIComponentMediaVideoAI021';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/MediaVideoAI/' + pageName);
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 1000);
      let startButton: Component = await driver.findComponent(ON.id(pageName + '_003'));
      let pauseButton: Component = await driver.findComponent(ON.id(pageName + '_004'));
      let video: Component = await driver.findComponent(ON.id(pageName + '_005'));
      await startButton.click();
      let videoCenter = await video.getBoundsCenter();
      Logger.info(`[${TAG}]`, `videoCenter: X = ${videoCenter.x}, Y = ${videoCenter.y}`);
      await driver.waitForIdle(3000, 3000);
      await pauseButton.click();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y});
      await driver.longClick(videoCenter.x, videoCenter.y);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y + 180});
      await driver.longClick(videoCenter.x, videoCenter.y + 180);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0220
     * @tc.name   : Media video ai
     * @tc.desc   : Verify media video ai interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0220', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0220';
      let pageName = 'UIComponentMediaVideoAI022';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/MediaVideoAI/' + pageName);
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 1000);
      let startButton: Component = await driver.findComponent(ON.id(pageName + '_003'));
      let pauseButton: Component = await driver.findComponent(ON.id(pageName + '_004'));
      let video: Component = await driver.findComponent(ON.id(pageName + '_005'));
      await startButton.click();
      let videoCenter = await video.getBoundsCenter();
      Logger.info(`[${TAG}]`, `videoCenter: X = ${videoCenter.x}, Y = ${videoCenter.y}`);
      await driver.waitForIdle(3000, 3000);
      await pauseButton.click();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y});
      await driver.longClick(videoCenter.x, videoCenter.y);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y + 180});
      await driver.longClick(videoCenter.x, videoCenter.y + 180);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0230
     * @tc.name   : Media video ai
     * @tc.desc   : Verify media video ai interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0230', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0230';
      let pageName = 'UIComponentMediaVideoAI023';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/MediaVideoAI/' + pageName);
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 1000);
      let startButton: Component = await driver.findComponent(ON.id(pageName + '_003'));
      let pauseButton: Component = await driver.findComponent(ON.id(pageName + '_004'));
      let video: Component = await driver.findComponent(ON.id(pageName + '_005'));
      await startButton.click();
      let videoCenter = await video.getBoundsCenter();
      Logger.info(`[${TAG}]`, `videoCenter: X = ${videoCenter.x}, Y = ${videoCenter.y}`);
      await driver.waitForIdle(3000, 3000);
      await pauseButton.click();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y});
      await driver.longClick(videoCenter.x, videoCenter.y);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y + 180});
      await driver.longClick(videoCenter.x, videoCenter.y + 180);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0240
     * @tc.name   : Media video ai
     * @tc.desc   : Verify media video ai interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0240', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0240';
      let pageName = 'UIComponentMediaVideoAI024';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/MediaVideoAI/' + pageName);
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 1000);
      let startButton: Component = await driver.findComponent(ON.id(pageName + '_003'));
      let pauseButton: Component = await driver.findComponent(ON.id(pageName + '_004'));
      let video: Component = await driver.findComponent(ON.id(pageName + '_005'));
      await startButton.click();
      let videoCenter = await video.getBoundsCenter();
      Logger.info(`[${TAG}]`, `videoCenter: X = ${videoCenter.x}, Y = ${videoCenter.y}`);
      await driver.waitForIdle(3000, 3000);
      await pauseButton.click();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y});
      await driver.longClick(videoCenter.x, videoCenter.y);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y + 180});
      await driver.longClick(videoCenter.x, videoCenter.y + 180);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0250
     * @tc.name   : Media video ai
     * @tc.desc   : Verify media video ai interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0250', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0250';
      let pageName = 'UIComponentMediaVideoAI025';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/MediaVideoAI/' + pageName);
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 1000);
      let startButton: Component = await driver.findComponent(ON.id(pageName + '_003'));
      let pauseButton: Component = await driver.findComponent(ON.id(pageName + '_004'));
      let video: Component = await driver.findComponent(ON.id(pageName + '_005'));
      await startButton.click();
      let videoCenter = await video.getBoundsCenter();
      Logger.info(`[${TAG}]`, `videoCenter: X = ${videoCenter.x}, Y = ${videoCenter.y}`);
      await driver.waitForIdle(3000, 3000);
      await pauseButton.click();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y});
      await driver.longClick(videoCenter.x, videoCenter.y);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y + 180});
      await driver.longClick(videoCenter.x, videoCenter.y + 180);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0270
     * @tc.name   : Media video ai
     * @tc.desc   : Verify media video ai interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0270', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0270';
      let pageName = 'UIComponentMediaVideoAI027';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/MediaVideoAI/' + pageName);
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 1000);
      let startButton: Component = await driver.findComponent(ON.id(pageName + '_003'));
      let pauseButton: Component = await driver.findComponent(ON.id(pageName + '_004'));
      let video: Component = await driver.findComponent(ON.id(pageName + '_005'));
      let dragButton: Component = await driver.findComponent(ON.id(pageName + '_006'));
      await startButton.click();
      let videoCenter = await video.getBoundsCenter();
      Logger.info(`[${TAG}]`, `videoCenter: X = ${videoCenter.x}, Y = ${videoCenter.y}`);
      await driver.waitForIdle(3000, 3000);
      await pauseButton.click();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y});
      await driver.longClick(videoCenter.x, videoCenter.y);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y + 180});
      await driver.longClick(videoCenter.x, videoCenter.y + 180);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await dragButton.click();
      await driver.waitForIdle(1000, 1000);
      await startButton.click();
      await driver.waitForIdle(1000, 1000);
      await pauseButton.click();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y});
      await driver.longClick(videoCenter.x, videoCenter.y);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y + 180});
      await driver.longClick(videoCenter.x, videoCenter.y + 180);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0280
     * @tc.name   : Media video ai
     * @tc.desc   : Verify media video ai interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0280', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0280';
      let pageName = 'UIComponentMediaVideoAI027';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/MediaVideoAI/' + pageName);
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 1000);
      let startButton: Component = await driver.findComponent(ON.id(pageName + '_003'));
      let pauseButton: Component = await driver.findComponent(ON.id(pageName + '_004'));
      let video: Component = await driver.findComponent(ON.id(pageName + '_005'));
      let dragButton: Component = await driver.findComponent(ON.id(pageName + '_006'));
      let videoCenter = await video.getBoundsCenter();
      Logger.info(`[${TAG}]`, `videoCenter: X = ${videoCenter.x}, Y = ${videoCenter.y}`);
      await dragButton.click();
      await driver.waitForIdle(1000, 1000);
      await startButton.click();
      await driver.waitForIdle(1000, 1000);
      await pauseButton.click();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y});
      await driver.longClick(videoCenter.x, videoCenter.y);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y + 180});
      await driver.longClick(videoCenter.x, videoCenter.y + 180);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0290
     * @tc.name   : Media video ai
     * @tc.desc   : Verify media video ai interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0290', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0290';
      let pageName = 'UIComponentMediaVideoAI029';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/MediaVideoAI/' + pageName);
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 1000);
      let changeSrcButton: Component = await driver.findComponent(ON.id(pageName + '_006'));
      await changeSrcButton.click();
      let startButton: Component = await driver.findComponent(ON.id(pageName + '_003'));
      let pauseButton: Component = await driver.findComponent(ON.id(pageName + '_004'));
      let video: Component = await driver.findComponent(ON.id(pageName + '_005'));
      let videoCenter = await video.getBoundsCenter();
      Logger.info(`[${TAG}]`, `videoCenter: X = ${videoCenter.x}, Y = ${videoCenter.y}`);
      await driver.waitForIdle(1000, 1000);
      await startButton.click();
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['videoFinish']
      };
      let subscriber : commonEventManager.CommonEventSubscriber;
      await commonEventManager.createSubscriber(commonEventSubscribeInfo)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          Logger.info(`[${TAG}]`, `createSubscriber succeed.`);
          commonEventManager.subscribe(subscriber,async (err: BusinessError, commonEventData: commonEventManager.CommonEventPublishData) => {
            Logger.info(`[${TAG}]`, `subscribe callback. Gained commonEventData: ${JSON.stringify(commonEventData)}`);
            await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y});
            await driver.longClick(videoCenter.x, videoCenter.y);
            await driver.waitForIdle(1000, 1000);
            await windowSnap.snapShot();
            await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y + 180});
            await driver.longClick(videoCenter.x, videoCenter.y + 180);
            await driver.waitForIdle(1000, 1000);
            await windowSnap.snapShot();
            commonEventManager.unsubscribe(commonEventSubscriber, (err, data) => {
              hilog.info(0x0000, TAG, '[%{public}s] unsubscribe callback. err: %{public}s, data: %{public}s', TAG, JSON.stringify(err), JSON.stringify(data));
              done();
            });
          })
        })
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0300
     * @tc.name   : Media video ai
     * @tc.desc   : Verify media video ai interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0300', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0300';
      let pageName = 'UIComponentMediaVideoAI030';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/MediaVideoAI/' + pageName);
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 1000);
      let startButton: Component = await driver.findComponent(ON.id(pageName + '_003'));
      let pauseButton: Component = await driver.findComponent(ON.id(pageName + '_004'));
      let video: Component = await driver.findComponent(ON.id(pageName + '_005'));
      let containButton: Component = await driver.findComponent(ON.id(pageName + '_006'));
      let coverButton: Component = await driver.findComponent(ON.id(pageName + '_007'));
      let autoButton: Component = await driver.findComponent(ON.id(pageName + '_008'));
      let fillButton: Component = await driver.findComponent(ON.id(pageName + '_009'));
      let scaleDownButton: Component = await driver.findComponent(ON.id(pageName + '_010'));
      let noneButton: Component = await driver.findComponent(ON.id(pageName + '_011'));
      let videoCenter = await video.getBoundsCenter();
      Logger.info(`[${TAG}]`, `videoCenter: X = ${videoCenter.x}, Y = ${videoCenter.y}`);
      await startButton.click();
      await driver.waitForIdle(3000, 3000);
      await pauseButton.click();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y});
      await driver.longClick(videoCenter.x, videoCenter.y);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y + 180});
      await driver.longClick(videoCenter.x, videoCenter.y + 180);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await containButton.click();
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await coverButton.click();
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await autoButton.click();
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await fillButton.click();
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await scaleDownButton.click();
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await noneButton.click();
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await coverButton.click();
      await driver.waitForIdle(1000, 1000);
      await startButton.click();
      await driver.waitForIdle(1000, 1000);
      await pauseButton.click();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y});
      await driver.longClick(videoCenter.x, videoCenter.y);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y + 180});
      await driver.longClick(videoCenter.x, videoCenter.y + 180);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0310
     * @tc.name   : Media video ai
     * @tc.desc   : Verify media video ai interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0310', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0310';
      let pageName = 'UIComponentMediaVideoAI031';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/MediaVideoAI/' + pageName);
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 1000);
      let startButton: Component = await driver.findComponent(ON.id(pageName + '_003'));
      let pauseButton: Component = await driver.findComponent(ON.id(pageName + '_004'));
      let video: Component = await driver.findComponent(ON.id(pageName + '_005'));
      let fullScreenButton: Component = await driver.findComponent(ON.id(pageName + '_006'));
      let videoCenter = await video.getBoundsCenter();
      Logger.info(`[${TAG}]`, `videoCenter: X = ${videoCenter.x}, Y = ${videoCenter.y}`);
      await startButton.click();
      await driver.waitForIdle(3000, 3000);
      await pauseButton.click();
      await fullScreenButton.click();
      await driver.waitForIdle(1000, 1000);
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y});
      await driver.longClick(videoCenter.x, videoCenter.y);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y + 300});
      await driver.longClick(videoCenter.x, videoCenter.y + 300);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0320
     * @tc.name   : Media video ai
     * @tc.desc   : Verify media video ai interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0320', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_AI_0320';
      let pageName = 'UIComponentMediaVideoAI032';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/MediaVideoAI/' + pageName);
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 1000);
      let startButton: Component = await driver.findComponent(ON.id(pageName + '_003'));
      let pauseButton: Component = await driver.findComponent(ON.id(pageName + '_004'));
      let video: Component = await driver.findComponent(ON.id(pageName + '_005'));
      let SlowSwitchFullScreenButton: Component = await driver.findComponent(ON.id(pageName + '_006'));
      let switchFullScreenButton: Component = await driver.findComponent(ON.id(pageName + '_007'));
      let videoCenter = await video.getBoundsCenter();
      Logger.info(`[${TAG}]`, `videoCenter: X = ${videoCenter.x}, Y = ${videoCenter.y}`);
      await startButton.click();
      await driver.waitForIdle(3000, 3000);
      await pauseButton.click();
      await SlowSwitchFullScreenButton.click();
      await driver.waitForIdle(1000, 1000);
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y});
      await driver.longClick(videoCenter.x, videoCenter.y);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y + 300});
      await driver.longClick(videoCenter.x, videoCenter.y + 300);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await driver.waitForIdle(3000, 3000);
      await switchFullScreenButton.click();
      await driver.waitForIdle(1500, 1500);
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y});
      await driver.longClick(videoCenter.x, videoCenter.y);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await driver.mouseMoveTo({x: videoCenter.x, y: videoCenter.y + 180});
      await driver.longClick(videoCenter.x, videoCenter.y + 180);
      await driver.waitForIdle(1000, 1000);
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

  })
}