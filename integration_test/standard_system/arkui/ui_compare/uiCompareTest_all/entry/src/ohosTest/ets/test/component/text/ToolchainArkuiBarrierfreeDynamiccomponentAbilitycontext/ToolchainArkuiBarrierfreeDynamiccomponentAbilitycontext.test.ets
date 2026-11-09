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

import { describe, it, afterEach } from '@ohos/hypium';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';
import Utils from '../../../model/Utils';
import { Driver, ON, Component } from '@kit.TestKit';

export default function toolchainArkuiBarrierfreeDynamiccomponentAbilitycontextTest() {
  describe('toolchainArkuiBarrierfreeDynamiccomponentAbilitycontextTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return;
      }
      Settings.windowClass.destroyWindow((err) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window. Cause : ${JSON.stringify(err)}`);
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window.`);
      });
      await Utils.sleep(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0001
     * @tc.name   : Barrierfree adynamiccomponent abilitycontext
     * @tc.desc   : Verify barrierfree adynamiccomponent abilitycontext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0001', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0001 start.`);
      Settings.createWindow('testability/pages/component/text/ToolchainArkuiBarrierfreeDynamiccomponentAbilitycontext/ToolchainArkuiBarrierfreeDynamiccomponentAbilitycontext0001');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0001 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0002
     * @tc.name   : Barrierfree adynamiccomponent abilitycontext
     * @tc.desc   : Verify barrierfree adynamiccomponent abilitycontext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0002', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0002 start.`);
      Settings.createWindow('testability/pages/component/text/ToolchainArkuiBarrierfreeDynamiccomponentAbilitycontext/ToolchainArkuiBarrierfreeDynamiccomponentAbilitycontext0002');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0002 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0003
     * @tc.name   : Barrierfree adynamiccomponent abilitycontext
     * @tc.desc   : Verify barrierfree adynamiccomponent abilitycontext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0003', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0003 start.`);
      Settings.createWindow('testability/pages/component/text/ToolchainArkuiBarrierfreeDynamiccomponentAbilitycontext/ToolchainArkuiBarrierfreeDynamiccomponentAbilitycontext0003');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0003 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0004
     * @tc.name   : Barrierfree adynamiccomponent abilitycontext
     * @tc.desc   : Verify barrierfree adynamiccomponent abilitycontext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0004', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0004 start.`);
      Settings.createWindow('testability/pages/component/text/ToolchainArkuiBarrierfreeDynamiccomponentAbilitycontext/ToolchainArkuiBarrierfreeDynamiccomponentAbilitycontext0004');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0004 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0005
     * @tc.name   : Barrierfree adynamiccomponent abilitycontext
     * @tc.desc   : Verify barrierfree adynamiccomponent abilitycontext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0005', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0005 start.`);
      Settings.createWindow('testability/pages/component/text/ToolchainArkuiBarrierfreeDynamiccomponentAbilitycontext/ToolchainArkuiBarrierfreeDynamiccomponentAbilitycontext0005');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0005 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0006
     * @tc.name   : Barrierfree adynamiccomponent abilitycontext
     * @tc.desc   : Verify barrierfree adynamiccomponent abilitycontext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0006', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0006 start.`);
      Settings.createWindow('testability/pages/component/text/ToolchainArkuiBarrierfreeDynamiccomponentAbilitycontext/ToolchainArkuiBarrierfreeDynamiccomponentAbilitycontext0006');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0006 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0007
     * @tc.name   : Barrierfree adynamiccomponent abilitycontext
     * @tc.desc   : Verify barrierfree adynamiccomponent abilitycontext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0007', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0007 start.`);
      Settings.createWindow('testability/pages/component/text/ToolchainArkuiBarrierfreeDynamiccomponentAbilitycontext/ToolchainArkuiBarrierfreeDynamiccomponentAbilitycontext0007');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0007 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0008
     * @tc.name   : Barrierfree adynamiccomponent abilitycontext
     * @tc.desc   : Verify barrierfree adynamiccomponent abilitycontext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0008', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0008 start.`);
      Settings.createWindow('testability/pages/component/text/ToolchainArkuiBarrierfreeDynamiccomponentAbilitycontext/ToolchainArkuiBarrierfreeDynamiccomponentAbilitycontext0008');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0008 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0009
     * @tc.name   : Barrierfree adynamiccomponent abilitycontext
     * @tc.desc   : Verify barrierfree adynamiccomponent abilitycontext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0009', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0009 start.`);
      Settings.createWindow('testability/pages/component/text/ToolchainArkuiBarrierfreeDynamiccomponentAbilitycontext/ToolchainArkuiBarrierfreeDynamiccomponentAbilitycontext0009');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_TOOLCHAIN_ARKUI_BARRIERFREE_ADYNAMICCOMPONENT_ABILITYCONTEXT_0009 finish.`);
      done();
    });

  });
}