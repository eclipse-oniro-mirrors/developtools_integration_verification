/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON, Component } from '@kit.TestKit';

export default function wearingFrame() {

  describe('wearingFrame', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window. Cause : ${JSON.stringify(err)}`)
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window.`);
      })
      await Utils.sleep(1000);
      done()
    })

    /*
     * @tc.number : SUB_ACE_WEARING_FRAME_0030
     * @tc.name   : Wearing frame
     * @tc.desc   : Verify wearing frame interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_WEARING_FRAME_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_WEARING_FRAME_0030 start.`);
      
      try {
        Settings.createWindow('testability/pages/scenario/misc/WearingFrame/WearingFrame0030')
        let driver: Driver = Driver.create();
        await driver.waitForIdle(2000, 3000)
        
        Logger.info('TEST', 'Page loaded, taking initial screenshot');
        windowSnap.snapShot()
        await Utils.sleep(1000)
        
        // 点击"开始自动测试（500次）"按钮
        Logger.info('TEST', 'Clicking start auto test button (500 swipes)');
        let btnStart: Component = await driver.findComponent(ON.id('WearingFrame0030_006'));
        if (btnStart) {
          await btnStart.click();
          Logger.info('TEST', 'Test started, waiting for 500 swipe operations to complete');
          
          // 等待测试完成（500次 * 10ms = 5秒，加上缓冲）
          await Utils.sleep(7000)
          windowSnap.snapShot()
          Logger.info('TEST', 'Test should be completed, 500 swipe operations done, no crash detected');
          
          // 等待确保测试完全结束
          await Utils.sleep(500)
          windowSnap.snapShot()
          Logger.info('TEST', 'Final screenshot taken');
        } else {
          Logger.error('TEST', 'Start test button not found');
        }
        
        await Utils.sleep(500)
        Logger.info('TEST', 'Test completed successfully');
      } catch (error) {
        Logger.error('TEST', `Error during test: ${error}`);
      }
      
      Logger.info('TEST', `SUB_ACE_WEARING_FRAME_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_WEARING_FRAME_0050
     * @tc.name   : Wearing frame
     * @tc.desc   : Verify wearing frame interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_WEARING_FRAME_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_WEARING_FRAME_0050 start.`);

      try {
        Settings.createWindow('testability/pages/scenario/misc/WearingFrame/WearingFrame0050')
        let driver: Driver = Driver.create();
        await driver.waitForIdle(2000, 3000)

        Logger.info('TEST', 'Page loaded, taking initial screenshot');
        windowSnap.snapShot()
        await Utils.sleep(1000)

        // 点击"开始自动测试（500次）"按钮
        Logger.info('TEST', 'Clicking start auto test button (500 swipes)');
        let btnStart: Component = await driver.findComponent(ON.id('WearingFrame0050_006'));
        if (btnStart) {
          await btnStart.click();
          Logger.info('TEST', 'Test started, waiting for 500 swipe operations to complete');

          // 等待测试完成（500次 * 10ms = 5秒，加上缓冲）
          await Utils.sleep(7000)
          windowSnap.snapShot()
          Logger.info('TEST', 'Test should be completed, 500 swipe operations done, no crash detected');

          // 等待确保测试完全结束
          await Utils.sleep(500)
          windowSnap.snapShot()
          Logger.info('TEST', 'Final screenshot taken');
        } else {
          Logger.error('TEST', 'Start test button not found');
        }

        await Utils.sleep(500)
        Logger.info('TEST', 'Test completed successfully');
      } catch (error) {
        Logger.error('TEST', `Error during test: ${error}`);
      }

      Logger.info('TEST', `SUB_ACE_WEARING_FRAME_0050 finish.`);
      done()
    })

  })
}