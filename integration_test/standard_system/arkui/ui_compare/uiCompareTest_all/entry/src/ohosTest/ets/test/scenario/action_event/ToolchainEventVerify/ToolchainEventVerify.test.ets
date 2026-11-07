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

export default function toolchainEventVerify() {

  describe('toolchainEventVerify', () => {
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
     * @tc.number : SUB_ACE_TOOLCHAIN_EVENT_VERIFY_0010
     * @tc.name   : Toolchain event verify
     * @tc.desc   : Verify toolchain event verify interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TOOLCHAIN_EVENT_VERIFY_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_TOOLCHAIN_EVENT_VERIFY_0010 start.`);
      
      try {
        Settings.createWindow('testability/pages/scenario/action_event/ToolchainEventVerify/ToolchainEventVerify0010')
        let driver: Driver = Driver.create();
        await driver.waitForIdle(2000, 3000)
        
        Logger.info('TEST', 'Page loaded, taking initial screenshot');
        windowSnap.snapShot()
        await Utils.sleep(1000)
        
        // 点击"触发事件回调"按钮
        Logger.info('TEST', 'Clicking trigger event button');
        let btnTrigger: Component = await driver.findComponent(ON.id('ChildComponentEventVerify0010_003'));
        if (btnTrigger) {
          await btnTrigger.click();
          await Utils.sleep(800)
          windowSnap.snapShot()
          Logger.info('TEST', 'Event triggered');
        } else {
          Logger.error('TEST', 'Trigger button not found');
        }
        
        await Utils.sleep(500)
        Logger.info('TEST', 'Test completed successfully');
      } catch (error) {
        Logger.error('TEST', `Error during test: ${error}`);
      }
      
      Logger.info('TEST', `SUB_ACE_TOOLCHAIN_EVENT_VERIFY_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_TOOLCHAIN_EVENT_VERIFY_0020
     * @tc.name   : Toolchain event verify
     * @tc.desc   : Verify toolchain event verify interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TOOLCHAIN_EVENT_VERIFY_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_TOOLCHAIN_EVENT_VERIFY_0020 start.`);
      
      try {
        Settings.createWindow('testability/pages/scenario/action_event/ToolchainEventVerify/ToolchainEventVerify0020')
        let driver: Driver = Driver.create();
        await driver.waitForIdle(2000, 3000)
        
        Logger.info('TEST', 'Page loaded, taking initial screenshot');
        windowSnap.snapShot()
        await Utils.sleep(1000)
        
        // 点击"触发无参数事件"按钮
        Logger.info('TEST', 'Clicking button click event button');
        let btnClick: Component = await driver.findComponent(ON.id('ChildComponentEventVerify0020_004'));
        if (btnClick) {
          await btnClick.click();
          await Utils.sleep(800)
          windowSnap.snapShot()
          Logger.info('TEST', 'Button click event triggered');
        }
        
        // 点击"发送字符串值"按钮
        Logger.info('TEST', 'Clicking send value button');
        let btnValue: Component = await driver.findComponent(ON.id('ChildComponentEventVerify0020_005'));
        if (btnValue) {
          await btnValue.click();
          await Utils.sleep(800)
          windowSnap.snapShot()
          Logger.info('TEST', 'Value sent');
        }
        
        // 点击"发送对象数据"按钮
        Logger.info('TEST', 'Clicking send data button');
        let btnData: Component = await driver.findComponent(ON.id('ChildComponentEventVerify0020_006'));
        if (btnData) {
          await btnData.click();
          await Utils.sleep(800)
          windowSnap.snapShot()
          Logger.info('TEST', 'Data sent');
        }
        
        await Utils.sleep(500)
        Logger.info('TEST', 'Test completed successfully');
      } catch (error) {
        Logger.error('TEST', `Error during test: ${error}`);
      }
      
      Logger.info('TEST', `SUB_ACE_TOOLCHAIN_EVENT_VERIFY_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_TOOLCHAIN_EVENT_VERIFY_0030
     * @tc.name   : Toolchain event verify
     * @tc.desc   : Verify toolchain event verify interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TOOLCHAIN_EVENT_VERIFY_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_TOOLCHAIN_EVENT_VERIFY_0030 start.`);
      
      try {
        Settings.createWindow('testability/pages/scenario/action_event/ToolchainEventVerify/ToolchainEventVerify0030')
        let driver: Driver = Driver.create();
        await driver.waitForIdle(2000, 3000)
        
        Logger.info('TEST', 'Page loaded, taking initial screenshot');
        windowSnap.snapShot()
        await Utils.sleep(1000)
        
        // 点击"设置用户名为Bob"按钮
        Logger.info('TEST', 'Clicking set username button');
        let btnSetName: Component = await driver.findComponent(ON.id('ToolchainEventVerify0030_007'));
        if (btnSetName) {
          await btnSetName.click();
          await Utils.sleep(800)
          windowSnap.snapShot()
          Logger.info('TEST', 'Username set to Bob');
        }
        
        // 点击"增加年龄"按钮
        Logger.info('TEST', 'Clicking increase age button');
        let btnIncAge: Component = await driver.findComponent(ON.id('ToolchainEventVerify0030_008'));
        if (btnIncAge) {
          await btnIncAge.click();
          await Utils.sleep(800)
          windowSnap.snapShot()
          Logger.info('TEST', 'Age increased');
        }
        
        // 再次点击增加年龄
        if (btnIncAge) {
          await btnIncAge.click();
          await Utils.sleep(800)
          windowSnap.snapShot()
          Logger.info('TEST', 'Age increased again');
        }
        
        await Utils.sleep(500)
        Logger.info('TEST', 'Test completed successfully');
      } catch (error) {
        Logger.error('TEST', `Error during test: ${error}`);
      }
      
      Logger.info('TEST', `SUB_ACE_TOOLCHAIN_EVENT_VERIFY_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_TOOLCHAIN_EVENT_VERIFY_0040
     * @tc.name   : Toolchain event verify
     * @tc.desc   : Verify toolchain event verify interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TOOLCHAIN_EVENT_VERIFY_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_TOOLCHAIN_EVENT_VERIFY_0040 start.`);
      
      try {
        Settings.createWindow('testability/pages/scenario/action_event/ToolchainEventVerify/ToolchainEventVerify0040')
        let driver: Driver = Driver.create();
        await driver.waitForIdle(2000, 3000)
        
        Logger.info('TEST', 'Page loaded, taking initial screenshot');
        windowSnap.snapShot()
        await Utils.sleep(1000)
        
        // 点击父组件的"修改消息"按钮
        Logger.info('TEST', 'Clicking parent update message button');
        let btnParentMsg: Component = await driver.findComponent(ON.id('ToolchainEventVerify0040_007'));
        if (btnParentMsg) {
          await btnParentMsg.click();
          await Utils.sleep(800)
          windowSnap.snapShot()
          Logger.info('TEST', 'Parent message updated, child should reflect change');
        }
        
        // 点击父组件的"增加计数"按钮
        Logger.info('TEST', 'Clicking parent increase count button');
        let btnParentCount: Component = await driver.findComponent(ON.id('ToolchainEventVerify0040_008'));
        if (btnParentCount) {
          await btnParentCount.click();
          await Utils.sleep(800)
          windowSnap.snapShot()
          Logger.info('TEST', 'Parent count increased, child should reflect change');
        }
        
        // 点击子组件的"发送新消息"按钮
        Logger.info('TEST', 'Clicking child send message button');
        let btnChildMsg: Component = await driver.findComponent(ON.id('ChildComponentEventVerify0040_004'));
        if (btnChildMsg) {
          await btnChildMsg.click();
          await Utils.sleep(800)
          windowSnap.snapShot()
          Logger.info('TEST', 'Child triggered message change event');
        }
        
        // 点击子组件的"请求增加计数"按钮
        Logger.info('TEST', 'Clicking child increase count button');
        let btnChildCount: Component = await driver.findComponent(ON.id('ChildComponentEventVerify0040_005'));
        if (btnChildCount) {
          await btnChildCount.click();
          await Utils.sleep(800)
          windowSnap.snapShot()
          Logger.info('TEST', 'Child triggered count increase event');
        }
        
        await Utils.sleep(500)
        Logger.info('TEST', 'Test completed successfully');
      } catch (error) {
        Logger.error('TEST', `Error during test: ${error}`);
      }
      
      Logger.info('TEST', `SUB_ACE_TOOLCHAIN_EVENT_VERIFY_0040 finish.`);
      done()
    })

  })
}