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


let TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_RESET';

function sleep(ms: number) {
  return new Promise<string>(resolve => setTimeout(resolve, ms));
}

export default function uIComponentMediaVideoReset() {
  describe('uIComponentMediaVideoReset', () => {
    beforeAll(() => {

    })
    beforeEach(async (done: Function) => {
      try {
        wifiManager.enableWifi();
      } catch (error) {
        Logger.error(`[${TAG}_beforeEach]`, 'enableWifi failed:' + JSON.stringify(error));
      }
      await Utils.sleep(5000);
      done();
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_RESET_0010
     * @tc.name   : Media video reset
     * @tc.desc   : Verify media video reset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_RESET_0010', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_RESET_0010';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/MediaVideoReset/UIComponentMediaVideoReset010');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 1000);
      let startButton: Component = await driver.findComponent(ON.id('UIComponentMediaVideoReset010_001'));
      let resetButton: Component = await driver.findComponent(ON.id('UIComponentMediaVideoReset010_002'));
      let autoPlayButton: Component = await driver.findComponent(ON.id('UIComponentMediaVideoReset010_003'));

      // 1.运行demo，点击播放视频
      await startButton.click();
      await driver.waitForIdle(2000, 2000);
      windowSnap.snapShot();

      // 2.断开网络，等待视频中断播放
      try {
        wifiManager.disableWifi();
      } catch (error) {
        Logger.error(`[${TAG}]`, 'first disableWifi failed:' + JSON.stringify(error));
      }
      let firstEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['videoError_1']
      };
      let firstSubscriber : commonEventManager.CommonEventSubscriber;
      await commonEventManager.createSubscriber(firstEventSubscribeInfo)
        .then((firstEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          firstSubscriber = firstEventSubscriber;
          Logger.info(`[${TAG}]`, `first createSubscriber succeed.`);
          commonEventManager.subscribe(firstSubscriber, async (err: BusinessError, firstEventData: commonEventManager.CommonEventPublishData) => {
            Logger.info(`[${TAG}]`, `first subscribe callback. Gained commonEventData: ${JSON.stringify(firstEventData)}`);
            await driver.waitForIdle(3000, 3000);
            windowSnap.snapShot();

            // 3.重新连接网络，点击播放视频
            try {
              wifiManager.enableWifi();
            } catch (error) {
              Logger.error(`[${TAG}]`, 'second enableWifi failed:' + JSON.stringify(error));
            }
            await driver.waitForIdle(5000, 5000);
            await startButton.click();
            await driver.waitForIdle(1000, 1000);
            windowSnap.snapShot();

            // 4.点击“reset”按钮，再点击播放视频
            await resetButton.click();
            await startButton.click();
            await driver.waitForIdle(1000, 1000);
            windowSnap.snapShot();

            // 5.点击开启autoPlay按钮
            await driver.waitForIdle(2000, 2000);
            await autoPlayButton.click();

            // 6.断开网络，等待视频中断播放
            try {
              wifiManager.disableWifi();
            } catch (error) {
              Logger.error(`[${TAG}]`, 'disableWifi failed:' + JSON.stringify(error));
            }
            let secondEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
              events: ['videoError_2']
            };
            let secondSubscriber : commonEventManager.CommonEventSubscriber;
            await commonEventManager.createSubscriber(secondEventSubscribeInfo)
              .then((secondEventSubscriber: commonEventManager.CommonEventSubscriber) => {
                secondSubscriber = secondEventSubscriber;
                Logger.info(`[${TAG}]`, `second createSubscriber succeed.`);
                commonEventManager.subscribe(secondSubscriber, async (err: BusinessError, firstEventData: commonEventManager.CommonEventPublishData) => {
                  Logger.info(`[${TAG}]`, `second subscribe callback. Gained commonEventData: ${JSON.stringify(firstEventData)}`);
                  await driver.waitForIdle(3000, 3000);
                  windowSnap.snapShot();

                  // 7.重新连接网络，点击播放视频
                  try {
                    wifiManager.enableWifi();
                  } catch (error) {
                    Logger.error(`[${TAG}]`, 'second enableWifi failed:' + JSON.stringify(error));
                  }
                  await driver.waitForIdle(5000, 5000);
                  await startButton.click();
                  await driver.waitForIdle(1000, 1000);
                  windowSnap.snapShot();

                  // 8.点击“reset”按钮
                  await resetButton.click();
                  await driver.waitForIdle(2000, 2000);
                  windowSnap.snapShot();

                  commonEventManager.unsubscribe(secondEventSubscriber, (err, data) => {
                    hilog.info(0x0000, TAG, "[%{public}s] second's unsubscribe callback. err: %{public}s, data: %{public}s", TAG, JSON.stringify(err), JSON.stringify(data));
                    done();
                  });
                })
              })
            commonEventManager.unsubscribe(firstEventSubscriber, (err, data) => {
              hilog.info(0x0000, TAG, "[%{public}s] first's unsubscribe callback. err: %{public}s, data: %{public}s", TAG, JSON.stringify(err), JSON.stringify(data));
            });
          })
        })
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_RESET_0011
     * @tc.name   : Media video reset
     * @tc.desc   : Verify media video reset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_RESET_0011', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_RESET_0011';
      Logger.info(`[${TAG}]`, `Case start.`);
      try {
        wifiManager.disableWifi();
      } catch (error) {
        Logger.error(`[${TAG}]`, 'disableWifi failed:' + JSON.stringify(error));
      }
      Settings.createWindow('testability/pages/component/canvas_media/MediaVideoReset/UIComponentMediaVideoReset011');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 1000);
      let startButton: Component = await driver.findComponent(ON.id('UIComponentMediaVideoReset011_001'));
      let resetButton: Component = await driver.findComponent(ON.id('UIComponentMediaVideoReset011_002'));
      await startButton.click();
      await driver.waitForIdle(1000, 1000);
      windowSnap.snapShot();
      try {
        wifiManager.enableWifi();
      } catch (error) {
        Logger.error(`[${TAG}]`, 'enableWifi failed:' + JSON.stringify(error));
      }
      await driver.waitForIdle(5000, 5000);
      await startButton.click();
      await driver.waitForIdle(1000, 1000);
      windowSnap.snapShot();
      await resetButton.click();
      await startButton.click();
      await driver.waitForIdle(1000, 1000);
      windowSnap.snapShot();
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_RESET_0012
     * @tc.name   : Media video reset
     * @tc.desc   : Verify media video reset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_RESET_0012', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_RESET_0012';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/MediaVideoReset/UIComponentMediaVideoReset012');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 1000);
      let startButton: Component = await driver.findComponent(ON.id('UIComponentMediaVideoReset012_001'));
      let resetButton: Component = await driver.findComponent(ON.id('UIComponentMediaVideoReset012_002'));
      await startButton.click();
      await driver.waitForIdle(2000, 2000);
      try {
        wifiManager.disableWifi();
      } catch (error) {
        Logger.error(`[${TAG}]`, 'disableWifi failed:' + JSON.stringify(error));
      }
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['videoError']
      };
      let subscriber : commonEventManager.CommonEventSubscriber;
      await commonEventManager.createSubscriber(commonEventSubscribeInfo)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          Logger.info(`[${TAG}]`, `createSubscriber succeed.`);
          commonEventManager.subscribe(subscriber,async (err: BusinessError, commonEventData: commonEventManager.CommonEventPublishData) => {
            Logger.info(`[${TAG}]`, `subscribe callback. Gained commonEventData: ${JSON.stringify(commonEventData)}`);
            await resetButton.click();
            await startButton.click();
            await driver.waitForIdle(1000, 1000);
            windowSnap.snapShot();
            try {
              wifiManager.enableWifi();
            } catch (error) {
              Logger.error(`[${TAG}]`, 'enableWifi failed:' + JSON.stringify(error));
            }
            await driver.waitForIdle(5000, 5000);
            await resetButton.click();
            await startButton.click();
            await driver.waitForIdle(3000, 3000);
            windowSnap.snapShot();
            commonEventManager.unsubscribe(commonEventSubscriber, (err, data) => {
              hilog.info(0x0000, TAG, '[%{public}s] unsubscribe callback. err: %{public}s, data: %{public}s', TAG, JSON.stringify(err), JSON.stringify(data));
              done();
            });
          })
        })
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_RESET_0024
     * @tc.name   : Media video reset
     * @tc.desc   : Verify media video reset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_RESET_0024', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_RESET_0024';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/MediaVideoReset/UIComponentMediaVideoReset024');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 1000);
      let startButton: Component = await driver.findComponent(ON.id('UIComponentMediaVideoReset024_001'));
      await startButton.click();
      await driver.waitForIdle(2000, 2000);
      let switchButton: Component = await driver.findComponent(ON.id('UIComponentMediaVideoReset024_003'));
      await switchButton.click();
      await driver.waitForIdle(1500, 1500);
      let resetButton: Component = await driver.findComponent(ON.id('UIComponentMediaVideoReset024_002'));
      await resetButton.click();
      await startButton.click();
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_RESET_0030
     * @tc.name   : Media video reset
     * @tc.desc   : Verify media video reset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_RESET_0030', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_RESET_0030';
      Logger.info(`[${TAG}]`, `Case start.`);
      Settings.createWindow('testability/pages/component/canvas_media/MediaVideoReset/UIComponentMediaVideoReset030');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 1000);
      let startButton: Component = await driver.findComponent(ON.id('UIComponentMediaVideoReset030_001'));
      await startButton.click();
      await driver.waitForIdle(2000, 2000);
      await screenLock.lock().then((data: Boolean) => {
        Logger.info(`[${TAG}]`, `Succeeded in locking the screen. result: ${data}`);
      }).catch((err: BusinessError) => {
        Logger.error(`[${TAG}]`, `Failed to lock the screen, Code: ${err.code}, message: ${err.message}`);
        done();
      });
      await driver.waitForIdle(1000, 1000);
      await driver.swipe(600, 600, 200, 200);
      await driver.waitForIdle(1000, 1000);
      let resetButton: Component = await driver.findComponent(ON.id('UIComponentMediaVideoReset030_002'));
      await resetButton.click();
      await startButton.click();
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info(`[${TAG}]`, `Case finish.`);
      done();
    })

  })
}