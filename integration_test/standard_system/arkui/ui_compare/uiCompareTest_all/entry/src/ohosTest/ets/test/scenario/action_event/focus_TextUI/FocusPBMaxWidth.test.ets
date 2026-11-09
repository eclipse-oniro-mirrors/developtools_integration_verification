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

import { describe, afterEach, it, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON, Component } from '@kit.TestKit';

export default function focusPBMaxWidthTest() {

  describe('focusPBMaxWidthTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0010
     * @tc.name   : Popupbox popup maxwidth
     * @tc.desc   : Verify popupbox popup maxwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0010 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PBMaxWidth/PopupMaxWidth0010');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);
        await windowSnap.snapShot();
        await Utils.sleep(1000)
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0010 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0010 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0020
     * @tc.name   : Popupbox popup maxwidth
     * @tc.desc   : Verify popupbox popup maxwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0020 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PBMaxWidth/PopupMaxWidth0020');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);
        await windowSnap.snapShot();
        await Utils.sleep(1000)
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0020 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0020 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0030
     * @tc.name   : Popupbox popup maxwidth
     * @tc.desc   : Verify popupbox popup maxwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0030 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PBMaxWidth/PopupMaxWidth0030');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);
 
        
        // 点击切换按钮，切换到maxWidth = 300vp
        Logger.info('TEST', `Switching to maxWidth 300vp`);
        let switchButton = await driver.findComponent(ON.id('switchMaxWidthButton0030'));
        await switchButton.click();
        await driver.waitForIdle(1000, 2000);
        
        // 截图切换后的状态（maxWidth = 300vp）
        Logger.info('TEST', `Capturing state after switching to 300vp`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);
        
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0030 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0030 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0040
     * @tc.name   : Popupbox popup maxwidth
     * @tc.desc   : Verify popupbox popup maxwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0040 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PBMaxWidth/PopupMaxWidth0040');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);
        
        // 点击切换按钮，切换到maxWidth = undefined
        Logger.info('TEST', `Switching to maxWidth undefined`);
        let switchButton = await driver.findComponent(ON.id('switchMaxWidthButton0040'));
        await switchButton.click();
        await driver.waitForIdle(1000, 2000);
        
        // 截图切换后的状态（maxWidth = undefined，应保持400vp宽度）
        Logger.info('TEST', `Capturing state after switching to undefined`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);
        
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0040 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0040 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0050
     * @tc.name   : Popupbox popup maxwidth
     * @tc.desc   : Verify popupbox popup maxwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0050 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PBMaxWidth/PopupMaxWidth0050');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);
        
        // 点击切换按钮，切换到maxWidth = '300px'
        Logger.info('TEST', `Switching to maxWidth 300px`);
        let switchButton = await driver.findComponent(ON.id('switchMaxWidthButton0050'));
        await switchButton.click();
        await driver.waitForIdle(1000, 2000);
        
        // 截图切换后的状态（maxWidth = 300px）
        Logger.info('TEST', `Capturing state after switching to 300px`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);
        
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0050 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0050 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0060
     * @tc.name   : Popupbox popup maxwidth
     * @tc.desc   : Verify popupbox popup maxwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0060 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PBMaxWidth/PopupMaxWidth0060');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);
        
        // 点击切换按钮，切换到maxWidth = undefined
        Logger.info('TEST', `Switching to maxWidth undefined`);
        let switchButton = await driver.findComponent(ON.id('switchMaxWidthButton0060'));
        await switchButton.click();
        await driver.waitForIdle(1000, 2000);
        
        // 截图切换后的状态（maxWidth = undefined，宽度应从300vp变为400vp）
        Logger.info('TEST', `Capturing state after switching to undefined`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);
        
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0060 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0060 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0070
     * @tc.name   : Popupbox popup maxwidth
     * @tc.desc   : Verify popupbox popup maxwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0070 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PBMaxWidth/PopupMaxWidth0070');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);
        await windowSnap.snapShot();
        await Utils.sleep(1000)
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0070 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0070 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0080
     * @tc.name   : Popupbox popup maxwidth
     * @tc.desc   : Verify popupbox popup maxwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0080 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PBMaxWidth/PopupMaxWidth0080');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);
        await windowSnap.snapShot();
        await Utils.sleep(1000)
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0080 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0080 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0090
     * @tc.name   : Popupbox popup maxwidth
     * @tc.desc   : Verify popupbox popup maxwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0090 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PBMaxWidth/PopupMaxWidth0090');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);
        await windowSnap.snapShot();
        await Utils.sleep(1000)
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0090 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0090 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0100
     * @tc.name   : Popupbox popup maxwidth
     * @tc.desc   : Verify popupbox popup maxwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0100 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PBMaxWidth/PopupMaxWidth0100');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);
        await windowSnap.snapShot();
        await Utils.sleep(1000)
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0100 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0100 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0110
     * @tc.name   : Popupbox popup maxwidth
     * @tc.desc   : Verify popupbox popup maxwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0110 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PBMaxWidth/PopupMaxWidth0110');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);
        await windowSnap.snapShot();
        await Utils.sleep(1000)
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0110 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0110 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0120
     * @tc.name   : Popupbox popup maxwidth
     * @tc.desc   : Verify popupbox popup maxwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0120 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PBMaxWidth/PopupMaxWidth0120');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);
        await windowSnap.snapShot();
        await Utils.sleep(1000)
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0120 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0120 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0130
     * @tc.name   : Popupbox popup maxwidth
     * @tc.desc   : Verify popupbox popup maxwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0130 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PBMaxWidth/PopupMaxWidth0130');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);
        await windowSnap.snapShot();
        await Utils.sleep(1000)
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0130 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0130 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0140
     * @tc.name   : Popupbox popup maxwidth
     * @tc.desc   : Verify popupbox popup maxwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0140 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PBMaxWidth/PopupMaxWidth0140');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);
        await windowSnap.snapShot();
        await Utils.sleep(1000)
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0140 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0140 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0150
     * @tc.name   : Popupbox popup maxwidth
     * @tc.desc   : Verify popupbox popup maxwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0150 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PBMaxWidth/PopupMaxWidth0150');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);
        await windowSnap.snapShot();
        await Utils.sleep(1000)
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0150 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0150 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0160
     * @tc.name   : Popupbox popup maxwidth
     * @tc.desc   : Verify popupbox popup maxwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0160 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PBMaxWidth/PopupMaxWidth0160');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);
        await windowSnap.snapShot();
        await Utils.sleep(1000)
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0160 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0160 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0170
     * @tc.name   : Popupbox popup maxwidth
     * @tc.desc   : Verify popupbox popup maxwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0170 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PBMaxWidth/PopupMaxWidth0170');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);
        await windowSnap.snapShot();
        await Utils.sleep(1000)
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0170 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0170 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0180
     * @tc.name   : Popupbox popup maxwidth
     * @tc.desc   : Verify popupbox popup maxwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0180 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PBMaxWidth/PopupMaxWidth0180');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(500, 2000);

        // 点击按钮弹出popup
        Logger.info('TEST', `Clicking show popup button`);
        let showButton = await driver.findComponent(ON.id('showPopupButton0180'));
        await showButton.click();
        await driver.waitForIdle(1000, 2000);
        Logger.info('TEST', `Capturing initial popup state`);

        // 点击动效打断按钮
        Logger.info('TEST', `Clicking interrupt button during animation`);
        let interruptButton = await driver.findComponent(ON.id('interruptButton0180'));
        await interruptButton.click();
        await driver.waitForIdle(1000, 2000);

        // 截图动效打断后的状态
        Logger.info('TEST', `Capturing popup state after animation interruption`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0180 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0180 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0190
     * @tc.name   : Popupbox popup maxwidth
     * @tc.desc   : Verify popupbox popup maxwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0190 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PBMaxWidth/PopupMaxWidth0190');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(500, 2000);

        // 手动切换几次popup
        Logger.info('TEST', `Manual toggle test - show popup`);
        let toggleButton = await driver.findComponent(ON.id('togglePopupButton0190'));

        // 第1次显示
        await toggleButton.click();
        await driver.waitForIdle(500, 2000);
        Logger.info('TEST', `Popup shown (1st time)`);

        // 第1次关闭
        await toggleButton.click();
        await driver.waitForIdle(500, 2000);
        Logger.info('TEST', `Popup hidden (1st time)`);

        // 第2次显示
        await toggleButton.click();
        await driver.waitForIdle(500, 2000);
        Logger.info('TEST', `Popup shown (2nd time)`);

        // 第2次关闭
        await toggleButton.click();
        await driver.waitForIdle(500, 2000);
        Logger.info('TEST', `Popup hidden (2nd time)`);

        // 点击快速切换按钮进行频繁切换测试
        Logger.info('TEST', `Clicking rapid toggle button for 10 times`);
        let rapidToggleButton = await driver.findComponent(ON.id('rapidToggleButton0190'));
        await rapidToggleButton.click();
        await Utils.sleep(4000); // 等待10次切换完成 (10 * 300ms = 3000ms + 1000ms buffer)

        // 最后再显示一次popup并截图
        Logger.info('TEST', `Final display for screenshot`);
        await toggleButton.click();
        await driver.waitForIdle(1000, 2000);
        
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0190 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0190 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0210
     * @tc.name   : Popupbox popup maxwidth
     * @tc.desc   : Verify popupbox popup maxwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0210 start.`);
      try {
        // 步骤1: 打开入口页面
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PBMaxWidth/PopupMaxWidth0210_Entry');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);
        Logger.info('TEST', `Entry page loaded`);

        // 步骤2: 点击按钮进入测试页面
        Logger.info('TEST', `Clicking enter button to navigate to test page`);
        let enterButton = await driver.findComponent(ON.id('enterTestPageButton0210'));
        await enterButton.click();
        await driver.waitForIdle(1000, 2000);
        Logger.info('TEST', `Entered test page with popup`);


        // 步骤4: 点击返回按钮返回到入口页面
        Logger.info('TEST', `Clicking back button to return to entry page`);
        let backButton = await driver.findComponent(ON.id('backButton0210'));
        await backButton.click();
        await driver.waitForIdle(1000, 2000);
        Logger.info('TEST', `Returned to entry page`);

        // 步骤5: 再次点击按钮进入测试页面
        Logger.info('TEST', `Clicking enter button again to re-enter test page`);
        let enterButtonAgain = await driver.findComponent(ON.id('enterTestPageButton0210'));
        await enterButtonAgain.click();
        await driver.waitForIdle(1000, 2000);
        Logger.info('TEST', `Re-entered test page with popup`);

        // 步骤6: 截图第二次进入时的popup状态
        Logger.info('TEST', `Capturing popup state on second entry`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0210 end.`);
        Logger.info('TEST', `Please verify popup width is 300vp in both screenshots`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0210 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0220
     * @tc.name   : Popupbox popup maxwidth
     * @tc.desc   : Verify popupbox popup maxwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0220 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PBMaxWidth/PopupMaxWidth0220');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        // 切换到后台
        Logger.info('TEST', `Moving app to background`);
        await driver.pressHome();
        await driver.waitForIdle(2000, 3000);

        // 从后台恢复到前台
        Logger.info('TEST', `Bringing app back to foreground`);
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PBMaxWidth/PopupMaxWidth0220');
        await driver.waitForIdle(1000, 2000);

        // 截图
        Logger.info('TEST', `Capturing popup state after background recovery`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0220 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0220 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0240
     * @tc.name   : Popupbox popup maxwidth
     * @tc.desc   : Verify popupbox popup maxwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0240 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PBMaxWidth/PopupMaxWidth0240');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        // 进入多任务模式
        Logger.info('TEST', `Entering multitask mode (recent apps)`);
        await driver.pressHome();
        await driver.waitForIdle(1000, 2000);

        // 返回应用
        Logger.info('TEST', `Returning to app from multitask mode`);
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PBMaxWidth/PopupMaxWidth0240');
        await driver.waitForIdle(1000, 2000);

        // 截图
        Logger.info('TEST', `Capturing popup state after returning from multitask mode`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0240 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0240 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0260
     * @tc.name   : Popupbox popup maxwidth
     * @tc.desc   : Verify popupbox popup maxwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0260 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PBMaxWidth/PopupMaxWidth0260');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        // 截图
        Logger.info('TEST', `Capturing popup state with container width 300vp`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0260 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0260 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0270
     * @tc.name   : Popupbox popup maxwidth
     * @tc.desc   : Verify popupbox popup maxwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0270 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PBMaxWidth/PopupMaxWidth0270');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        // 旋转屏幕到横屏
        Logger.info('TEST', `Rotating screen to landscape`);
        await driver.setDisplayRotation(1);
        await driver.waitForIdle(1000, 2000);

        // 截图横屏状态
        Logger.info('TEST', `Capturing popup state in landscape with 50% container width`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0270 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0270 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0280
     * @tc.name   : Popupbox popup maxwidth
     * @tc.desc   : Verify popupbox popup maxwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0280 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PBMaxWidth/PopupMaxWidth0280');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        // 旋转屏幕到竖屏
        Logger.info('TEST', `Rotating screen to portrait`);
        await driver.setDisplayRotation(0);
        await driver.waitForIdle(1000, 2000);

        // 截图竖屏状态
        Logger.info('TEST', `Capturing popup state in portrait`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0280 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0280 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0290
     * @tc.name   : Popupbox popup maxwidth
     * @tc.desc   : Verify popupbox popup maxwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0290 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PBMaxWidth/PopupMaxWidth0290');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        // 截图
        Logger.info('TEST', `Capturing popup state with maxWidth 90%`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0290 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0290 error: ${err}`);
      }
      done();
    });


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0310
     * @tc.name   : Popupbox popup maxwidth
     * @tc.desc   : Verify popupbox popup maxwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0310 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_PBMaxWidth/PopupMaxWidth0310');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        // 旋转屏幕到竖屏
        Logger.info('TEST', `Rotating screen to portrait`);
        await driver.setDisplayRotation(0);
        await driver.waitForIdle(1000, 2000);

        // 截图竖屏状态
        Logger.info('TEST', `Capturing popup state with maxWidth undefined in portrait`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0310 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_MAXWIDTH_0310 error: ${err}`);
      }
      done();
    });
  });
}
