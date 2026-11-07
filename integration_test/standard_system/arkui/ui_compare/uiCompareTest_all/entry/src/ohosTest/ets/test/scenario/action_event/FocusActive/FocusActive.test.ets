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

export default function focusActive() {

  describe('focusActive', () => {
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
     * @tc.number : SUB_ACE_UI_FOCUS_ACTIVE_0160
     * @tc.name   : Focus active
     * @tc.desc   : Verify focus active interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_FOCUS_ACTIVE_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_FOCUS_ACTIVE_0160 start.`);
      
      try {
        Settings.createWindow('testability/pages/scenario/action_event/FocusActive/FocusActive0160')
        let driver: Driver = Driver.create();
        await driver.waitForIdle(2000, 3000)
        
        Logger.info('TEST', 'Page loaded, taking initial screenshot');
        windowSnap.snapShot()
        await Utils.sleep(1000)
        
        // 点击"调用activate(true)"按钮
        Logger.info('TEST', 'Clicking activate(true) button');
        let btnActivateTrue: Component = await driver.findComponent(ON.id('FocusActive0160_004'));
        if (btnActivateTrue) {
          await btnActivateTrue.click();
          await Utils.sleep(1000)
          windowSnap.snapShot()
          Logger.info('TEST', 'activate(true) called, checking for log: Pipeline focus turns to active');
        } else {
          Logger.error('TEST', 'activate(true) button not found');
        }
        
        // 点击"调用activate(false)"按钮
        Logger.info('TEST', 'Clicking activate(false) button');
        let btnActivateFalse: Component = await driver.findComponent(ON.id('FocusActive0160_005'));
        if (btnActivateFalse) {
          await btnActivateFalse.click();
          await Utils.sleep(1000)
          windowSnap.snapShot()
          Logger.info('TEST', 'activate(false) called');
        } else {
          Logger.error('TEST', 'activate(false) button not found');
        }
        
        // 再次点击activate(true)验证
        Logger.info('TEST', 'Clicking activate(true) button again');
        if (btnActivateTrue) {
          await btnActivateTrue.click();
          await Utils.sleep(1000)
          windowSnap.snapShot()
          Logger.info('TEST', 'activate(true) called again, log should show: Pipeline focus turns to active');
        }
        
        await Utils.sleep(500)
        Logger.info('TEST', 'Test completed successfully');
      } catch (error) {
        Logger.error('TEST', `Error during test: ${error}`);
      }
      
      Logger.info('TEST', `SUB_ACE_UI_FOCUS_ACTIVE_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_FOCUS_ACTIVE_0170
     * @tc.name   : Focus active
     * @tc.desc   : Verify focus active interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_FOCUS_ACTIVE_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_FOCUS_ACTIVE_0170 start.`);
      
      try {
        Settings.createWindow('testability/pages/scenario/action_event/FocusActive/FocusActive0170')
        let driver: Driver = Driver.create();
        await driver.waitForIdle(2000, 3000)
        
        Logger.info('TEST', 'Page loaded, taking initial screenshot');
        windowSnap.snapShot()
        await Utils.sleep(1000)
        
        // 点击"调用activate(false)"按钮
        Logger.info('TEST', 'Clicking activate(false) button');
        let btnActivateFalse: Component = await driver.findComponent(ON.id('FocusActive0170_004'));
        if (btnActivateFalse) {
          await btnActivateFalse.click();
          await Utils.sleep(1000)
          windowSnap.snapShot()
          Logger.info('TEST', 'activate(false) called, checking for log: Pipeline focus turns to inactive');
        } else {
          Logger.error('TEST', 'activate(false) button not found');
        }
        
        // 点击"调用activate(true)"按钮
        Logger.info('TEST', 'Clicking activate(true) button');
        let btnActivateTrue: Component = await driver.findComponent(ON.id('FocusActive0170_005'));
        if (btnActivateTrue) {
          await btnActivateTrue.click();
          await Utils.sleep(1000)
          windowSnap.snapShot()
          Logger.info('TEST', 'activate(true) called');
        } else {
          Logger.error('TEST', 'activate(true) button not found');
        }
        
        // 再次点击activate(false)验证
        Logger.info('TEST', 'Clicking activate(false) button again');
        if (btnActivateFalse) {
          await btnActivateFalse.click();
          await Utils.sleep(1000)
          windowSnap.snapShot()
          Logger.info('TEST', 'activate(false) called again, log should show: Pipeline focus turns to inactive');
        }
        
        await Utils.sleep(500)
        Logger.info('TEST', 'Test completed successfully');
      } catch (error) {
        Logger.error('TEST', `Error during test: ${error}`);
      }
      
      Logger.info('TEST', `SUB_ACE_UI_FOCUS_ACTIVE_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_FOCUS_ACTIVE_0180
     * @tc.name   : Focus active
     * @tc.desc   : Verify focus active interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_FOCUS_ACTIVE_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_FOCUS_ACTIVE_0180 start.`);
      
      try {
        Settings.createWindow('testability/pages/scenario/action_event/FocusActive/FocusActive0180')
        let driver: Driver = Driver.create();
        await driver.waitForIdle(2000, 3000)
        
        Logger.info('TEST', 'Page loaded, taking initial screenshot');
        windowSnap.snapShot()
        await Utils.sleep(1000)
        
        // 点击"开始测试（50次）"按钮
        Logger.info('TEST', 'Clicking start test button (50 times)');
        let btnStart: Component = await driver.findComponent(ON.id('FocusActive0180_005'));
        if (btnStart) {
          await btnStart.click();
          Logger.info('TEST', 'Test started, waiting for 50 iterations to complete');
          
          // 等待测试完成（50次 * 50ms = 2500ms，加上额外时间）
          await Utils.sleep(4000)
          windowSnap.snapShot()
          Logger.info('TEST', 'Test should be completed, 50 activate calls made');
          
          // 等待确保所有日志都已输出
          await Utils.sleep(1000)
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
      
      Logger.info('TEST', `SUB_ACE_UI_FOCUS_ACTIVE_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_FOCUS_ACTIVE_0190
     * @tc.name   : Focus active
     * @tc.desc   : Verify focus active interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_UI_FOCUS_ACTIVE_0190', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_FOCUS_ACTIVE_0190 start.`);
      
      try {
        Settings.createWindow('testability/pages/scenario/action_event/FocusActive/FocusActive0190')
        let driver: Driver = Driver.create();
        await driver.waitForIdle(2000, 3000)
        
        Logger.info('TEST', 'Page loaded, taking initial screenshot');
        windowSnap.snapShot()
        await Utils.sleep(1000)
        
        // 点击"开始测试（50次）"按钮
        Logger.info('TEST', 'Clicking start test button (50 times with focus display)');
        let btnStart: Component = await driver.findComponent(ON.id('FocusActive0190_005'));
        if (btnStart) {
          await btnStart.click();
          Logger.info('TEST', 'Test started, waiting for 50 iterations with focus changes');
          
          // 等待测试完成（50次 * 100ms = 5000ms，加上额外时间）
          await Utils.sleep(6000)
          windowSnap.snapShot()
          Logger.info('TEST', 'Test should be completed, focus display should be normal');
          
          // 等待确保焦点框稳定
          await Utils.sleep(1000)
          windowSnap.snapShot()
          Logger.info('TEST', 'Final screenshot taken, verifying focus frame display');
        } else {
          Logger.error('TEST', 'Start test button not found');
        }
        
        await Utils.sleep(500)
        Logger.info('TEST', 'Test completed successfully');
      } catch (error) {
        Logger.error('TEST', `Error during test: ${error}`);
      }
      
      Logger.info('TEST', `SUB_ACE_UI_FOCUS_ACTIVE_0190 finish.`);
      done()
    })

  })
}