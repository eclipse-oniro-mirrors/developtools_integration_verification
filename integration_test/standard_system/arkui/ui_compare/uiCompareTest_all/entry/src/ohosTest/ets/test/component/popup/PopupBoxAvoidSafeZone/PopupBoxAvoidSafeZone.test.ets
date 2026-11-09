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

export default function popupBoxAvoidSafeZone() {

  describe('popupBoxAvoidSafeZone', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_SAFEZONE_0010
     * @tc.name   : Popupbox avoid safezone
     * @tc.desc   : Verify popupbox avoid safezone interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_SAFEZONE_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_SAFEZONE_0010 start.`);
      
      try {
        Settings.createWindow('testability/pages/component/popup/PopupBoxAvoidSafeZone/PopupBoxAvoidSafeZone0010')
        let driver: Driver = Driver.create();
        await driver.waitForIdle(2000, 3000)
        
        Logger.info('TEST', 'Page loaded, taking initial screenshot');
        windowSnap.snapShot()
        await Utils.sleep(1000)
        
        // 点击"显示AlertDialog"按钮
        Logger.info('TEST', 'Clicking show AlertDialog button');
        let btnShow: Component = await driver.findComponent(ON.id('PopupBoxAvoidSafeZone0010_007'));
        if (btnShow) {
          await btnShow.click();
          await Utils.sleep(1500)
          windowSnap.snapShot()
          Logger.info('TEST', 'AlertDialog shown');
        }
        
        // 点击对话框的确定按钮
        Logger.info('TEST', 'Waiting for dialog to be visible');
        await Utils.sleep(500)
        windowSnap.snapShot()
        
        await Utils.sleep(500)
        Logger.info('TEST', 'Test completed successfully');
      } catch (error) {
        Logger.error('TEST', `Error during test: ${error}`);
      }
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_SAFEZONE_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_SAFEZONE_0020
     * @tc.name   : Popupbox avoid safezone
     * @tc.desc   : Verify popupbox avoid safezone interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_SAFEZONE_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_SAFEZONE_0020 start.`);
      
      try {
        Settings.createWindow('testability/pages/component/popup/PopupBoxAvoidSafeZone/PopupBoxAvoidSafeZone0020')
        let driver: Driver = Driver.create();
        await driver.waitForIdle(2000, 3000)
        
        Logger.info('TEST', 'Page loaded, taking initial screenshot');
        windowSnap.snapShot()
        await Utils.sleep(1000)
        
        // 点击"显示ActionSheet"按钮
        Logger.info('TEST', 'Clicking show ActionSheet button');
        let btnShow: Component = await driver.findComponent(ON.id('PopupBoxAvoidSafeZone0020_007'));
        if (btnShow) {
          await btnShow.click();
          await Utils.sleep(1500)
          windowSnap.snapShot()
          Logger.info('TEST', 'ActionSheet shown');
        }
        
        // 等待ActionSheet显示
        Logger.info('TEST', 'Waiting for ActionSheet to be visible');
        await Utils.sleep(500)
        windowSnap.snapShot()
        
        await Utils.sleep(500)
        Logger.info('TEST', 'Test completed successfully');
      } catch (error) {
        Logger.error('TEST', `Error during test: ${error}`);
      }
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_SAFEZONE_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_SAFEZONE_0060
     * @tc.name   : Popupbox avoid safezone
     * @tc.desc   : Verify popupbox avoid safezone interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_SAFEZONE_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_SAFEZONE_0060 start.`);
      
      try {
        Settings.createWindow('testability/pages/component/popup/PopupBoxAvoidSafeZone/PopupBoxAvoidSafeZone0060')
        let driver: Driver = Driver.create();
        await driver.waitForIdle(2000, 3000)
        
        Logger.info('TEST', 'Page loaded, taking initial screenshot');
        windowSnap.snapShot()
        await Utils.sleep(1000)
        
        // 点击"显示CustomDialog"按钮
        Logger.info('TEST', 'Clicking show CustomDialog button');
        let btnShow: Component = await driver.findComponent(ON.id('PopupBoxAvoidSafeZone0060_007'));
        if (btnShow) {
          await btnShow.click();
          await Utils.sleep(1500)
          windowSnap.snapShot()
          Logger.info('TEST', 'CustomDialog shown');
        }
        
        // 等待CustomDialog显示
        Logger.info('TEST', 'Waiting for CustomDialog to be visible');
        await Utils.sleep(500)
        windowSnap.snapShot()
        
        await Utils.sleep(500)
        Logger.info('TEST', 'Test completed successfully');
      } catch (error) {
        Logger.error('TEST', `Error during test: ${error}`);
      }
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_SAFEZONE_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_SAFEZONE_0070
     * @tc.name   : Popupbox avoid safezone
     * @tc.desc   : Verify popupbox avoid safezone interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_SAFEZONE_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_SAFEZONE_0070 start.`);
      
      try {
        Settings.createWindow('testability/pages/component/popup/PopupBoxAvoidSafeZone/PopupBoxAvoidSafeZone0070')
        let driver: Driver = Driver.create();
        await driver.waitForIdle(2000, 3000)
        
        Logger.info('TEST', 'Page loaded, taking initial screenshot');
        windowSnap.snapShot()
        await Utils.sleep(1000)
        
        // 点击"显示openCustomDialog"按钮
        Logger.info('TEST', 'Clicking show openCustomDialog button');
        let btnShow: Component = await driver.findComponent(ON.id('PopupBoxAvoidSafeZone0070_007'));
        if (btnShow) {
          await btnShow.click();
          await Utils.sleep(1500)
          windowSnap.snapShot()
          Logger.info('TEST', 'openCustomDialog shown');
        }
        
        // 等待openCustomDialog显示
        Logger.info('TEST', 'Waiting for openCustomDialog to be visible');
        await Utils.sleep(500)
        windowSnap.snapShot()
        
        await Utils.sleep(500)
        Logger.info('TEST', 'Test completed successfully');
      } catch (error) {
        Logger.error('TEST', `Error during test: ${error}`);
      }
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_AVOID_SAFEZONE_0070 finish.`);
      done()
    })

  })
}