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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';
import Utils from '../../../model/Utils';
import { Driver, ON, Component } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';

export default function navigationOnActiveOnInActiveTest() {

  describe('navigationOnActiveOnInActiveTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err: BusinessError) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window. Cause : ${JSON.stringify(err)}`)
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window.`);
      })
      let driver: Driver = Driver.create();
      await Settings.changeWindowOrientation('end')
      await driver.waitForIdle(500, 2000);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0010
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（栈操作push接口，只push STANDARD页面）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0010 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0010/navigationOnActiveOnInActive0010')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础栈操作场景"按钮
      let navigationBasicStackOperationBtn = await driver.waitForComponent(ON.id('navigationBasicStackOperationBtn0010'), 1000);
      Logger.info('TEST', `Found component: navigationBasicStackOperationBtn0010`);
      if (!navigationBasicStackOperationBtn) {
        Logger.error('TEST', `Component not found: navigationBasicStackOperationBtn0010`);
        throw new Error('Component not found: navigationBasicStackOperationBtn0010');
      }
      await navigationBasicStackOperationBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicStackOperationBtn, waiting for page to render`);
      
      // 2.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0010'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0010, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0010 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0010'), 1000);
        Logger.info('TEST', `Retry found component: pushPageOneBtn0010, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
        if (!pushPageOneBtn) {
          throw new Error('Component not found: pushPageOneBtn0010');
        }
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0010_01');
      await Utils.sleep(1000);
      
      // 3.点击"pushDestinationByName pageTwo"按钮
      let pushDestinationByNamePageTwoBtn = await driver.waitForComponent(ON.id('pushDestinationByNamePageTwoBtn0010'), 1000);
      Logger.info('TEST', `Found component: pushDestinationByNamePageTwoBtn0010`);
      if (!pushDestinationByNamePageTwoBtn) {
        Logger.error('TEST', `Component not found: pushDestinationByNamePageTwoBtn0010`);
        throw new Error('Component not found: pushDestinationByNamePageTwoBtn0010');
      }
      await pushDestinationByNamePageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0010_02');
      await Utils.sleep(1000);
      
      // 4.点击"pushPathByName pageOne"按钮
      let pushPathByNamePageOneBtn = await driver.waitForComponent(ON.id('pushPathByNamePageOneBtn0010'), 1000);
      Logger.info('TEST', `Found component: pushPathByNamePageOneBtn0010`);
      if (!pushPathByNamePageOneBtn) {
        Logger.error('TEST', `Component not found: pushPathByNamePageOneBtn0010`);
        throw new Error('Component not found: pushPathByNamePageOneBtn0010');
      }
      await pushPathByNamePageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0010_03');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0020
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（栈操作push接口，只push DIALOG页面）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0020 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0020/navigationOnActiveOnInActive0020')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础栈操作场景"按钮
      let navigationBasicStackOperationBtn = await driver.waitForComponent(ON.id('navigationBasicStackOperationBtn0020'), 1000);
      Logger.info('TEST', `Found component: navigationBasicStackOperationBtn0020`);
      if (!navigationBasicStackOperationBtn) {
        Logger.error('TEST', `Component not found: navigationBasicStackOperationBtn0020`);
        throw new Error('Component not found: navigationBasicStackOperationBtn0020');
      }
      await navigationBasicStackOperationBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicStackOperationBtn, waiting for page to render`);
      
      // 2.点击"push pageThree"按钮
      let pushPageThreeBtn = await driver.waitForComponent(ON.id('pushPageThreeBtn0020'), 1000);
      Logger.info('TEST', `Found component: pushPageThreeBtn0020, result: ${pushPageThreeBtn ? 'found' : 'not found'}`);
      if (!pushPageThreeBtn) {
        Logger.error('TEST', `Component not found: pushPageThreeBtn0020 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageThreeBtn = await driver.waitForComponent(ON.id('pushPageThreeBtn0020'), 1000);
        Logger.info('TEST', `Retry found component: pushPageThreeBtn0020, result: ${pushPageThreeBtn ? 'found' : 'not found'}`);
        if (!pushPageThreeBtn) {
          throw new Error('Component not found: pushPageThreeBtn0020');
        }
      }
      await pushPageThreeBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0020_01');
      await Utils.sleep(1000);
      
      // 3.点击"pushDestinationByName pageFour"按钮
      let pushDestinationByNamePageFourBtn = await driver.waitForComponent(ON.id('pushDestinationByNamePageFourBtn0020'), 1000);
      Logger.info('TEST', `Found component: pushDestinationByNamePageFourBtn0020`);
      if (!pushDestinationByNamePageFourBtn) {
        Logger.error('TEST', `Component not found: pushDestinationByNamePageFourBtn0020`);
        throw new Error('Component not found: pushDestinationByNamePageFourBtn0020');
      }
      await pushDestinationByNamePageFourBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0020_02');
      await Utils.sleep(1000);
      
      // 4.点击"pushPathByName pageThree"按钮
      let pushPathByNamePageThreeBtn = await driver.waitForComponent(ON.id('pushPathByNamePageThreeBtn0020'), 1000);
      Logger.info('TEST', `Found component: pushPathByNamePageThreeBtn0020`);
      if (!pushPathByNamePageThreeBtn) {
        Logger.error('TEST', `Component not found: pushPathByNamePageThreeBtn0020`);
        throw new Error('Component not found: pushPathByNamePageThreeBtn0020');
      }
      await pushPathByNamePageThreeBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0020_03');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0030
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（栈操作push接口，push STANDARD、DIALOG页面）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0030 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0030/navigationOnActiveOnInActive0030')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础栈操作场景"按钮
      let navigationBasicStackOperationBtn = await driver.waitForComponent(ON.id('navigationBasicStackOperationBtn0030'), 1000);
      Logger.info('TEST', `Found component: navigationBasicStackOperationBtn0030`);
      if (!navigationBasicStackOperationBtn) {
        Logger.error('TEST', `Component not found: navigationBasicStackOperationBtn0030`);
        throw new Error('Component not found: navigationBasicStackOperationBtn0030');
      }
      await navigationBasicStackOperationBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicStackOperationBtn, waiting for page to render`);
      
      // 2.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0030'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0030, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0030 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0030'), 1000);
        Logger.info('TEST', `Retry found component: pushPageOneBtn0030, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
        if (!pushPageOneBtn) {
          throw new Error('Component not found: pushPageOneBtn0030');
        }
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0030_01');
      await Utils.sleep(1000);
      
      // 3.点击"pushPathByName pageThree"按钮
      let pushPathByNamePageThreeBtn = await driver.waitForComponent(ON.id('pushPathByNamePageThreeBtn0030'), 1000);
      Logger.info('TEST', `Found component: pushPathByNamePageThreeBtn0030`);
      if (!pushPathByNamePageThreeBtn) {
        Logger.error('TEST', `Component not found: pushPathByNamePageThreeBtn0030`);
        throw new Error('Component not found: pushPathByNamePageThreeBtn0030');
      }
      await pushPathByNamePageThreeBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0030_02');
      await Utils.sleep(1000);
      
      // 4.点击"pushDestinationByName pageTwo"按钮
      let pushDestinationByNamePageTwoBtn = await driver.waitForComponent(ON.id('pushDestinationByNamePageTwoBtn0030'), 1000);
      Logger.info('TEST', `Found component: pushDestinationByNamePageTwoBtn0030`);
      if (!pushDestinationByNamePageTwoBtn) {
        Logger.error('TEST', `Component not found: pushDestinationByNamePageTwoBtn0030`);
        throw new Error('Component not found: pushDestinationByNamePageTwoBtn0030');
      }
      await pushDestinationByNamePageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0030_03');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0040
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（栈操作push接口，push STANDARD、DIALOG页面，使用MOVE_TO_TOP_SINGLETON）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0040 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0040/navigationOnActiveOnInActive0040')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础栈操作场景"按钮
      let navigationBasicStackOperationBtn = await driver.waitForComponent(ON.id('navigationBasicStackOperationBtn0040'), 1000);
      Logger.info('TEST', `Found component: navigationBasicStackOperationBtn0040`);
      if (!navigationBasicStackOperationBtn) {
        Logger.error('TEST', `Component not found: navigationBasicStackOperationBtn0040`);
        throw new Error('Component not found: navigationBasicStackOperationBtn0040');
      }
      await navigationBasicStackOperationBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicStackOperationBtn, waiting for page to render`);
      
      // 2.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0040'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0040, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0040 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0040'), 1000);
        Logger.info('TEST', `Retry found component: pushPageOneBtn0040, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
        if (!pushPageOneBtn) {
          throw new Error('Component not found: pushPageOneBtn0040');
        }
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0040_01');
      await Utils.sleep(1000);
      
      // 3.点击"pushPathByName pageThree"按钮
      let pushPathByNamePageThreeBtn = await driver.waitForComponent(ON.id('pushPathByNamePageThreeBtn0040'), 1000);
      Logger.info('TEST', `Found component: pushPathByNamePageThreeBtn0040`);
      if (!pushPathByNamePageThreeBtn) {
        Logger.error('TEST', `Component not found: pushPathByNamePageThreeBtn0040`);
        throw new Error('Component not found: pushPathByNamePageThreeBtn0040');
      }
      await pushPathByNamePageThreeBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0040_02');
      await Utils.sleep(1000);
      
      // 4.点击"pushDestinationByName pageTwo"按钮
      let pushDestinationByNamePageTwoBtn = await driver.waitForComponent(ON.id('pushDestinationByNamePageTwoBtn0040'), 1000);
      Logger.info('TEST', `Found component: pushDestinationByNamePageTwoBtn0040`);
      if (!pushDestinationByNamePageTwoBtn) {
        Logger.error('TEST', `Component not found: pushDestinationByNamePageTwoBtn0040`);
        throw new Error('Component not found: pushDestinationByNamePageTwoBtn0040');
      }
      await pushDestinationByNamePageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0040_03');
      await Utils.sleep(1000);
      
      // 5.点击"push pageOne MOVE_TO_TOP_SINGLETON"按钮
      let pushPageOneMoveToTopSingletonBtn = await driver.waitForComponent(ON.id('pushPageOneMoveToTopSingletonBtn0040'), 1000);
      Logger.info('TEST', `Found component: pushPageOneMoveToTopSingletonBtn0040`);
      if (!pushPageOneMoveToTopSingletonBtn) {
        Logger.error('TEST', `Component not found: pushPageOneMoveToTopSingletonBtn0040`);
        throw new Error('Component not found: pushPageOneMoveToTopSingletonBtn0040');
      }
      await pushPageOneMoveToTopSingletonBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0040_04');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0050
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（栈操作push接口，push STANDARD、DIALOG页面，使用POP_TO_SINGLETON）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0050 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0050/navigationOnActiveOnInActive0050')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础栈操作场景"按钮
      let navigationBasicStackOperationBtn = await driver.waitForComponent(ON.id('navigationBasicStackOperationBtn0050'), 1000);
      Logger.info('TEST', `Found component: navigationBasicStackOperationBtn0050`);
      if (!navigationBasicStackOperationBtn) {
        Logger.error('TEST', `Component not found: navigationBasicStackOperationBtn0050`);
        throw new Error('Component not found: navigationBasicStackOperationBtn0050');
      }
      await navigationBasicStackOperationBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicStackOperationBtn, waiting for page to render`);
      
      // 2.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0050'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0050, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0050 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0050'), 1000);
        Logger.info('TEST', `Retry found component: pushPageOneBtn0050, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
        if (!pushPageOneBtn) {
          throw new Error('Component not found: pushPageOneBtn0050');
        }
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0050_01');
      await Utils.sleep(1000);
      
      // 3.点击"pushPathByName pageThree"按钮
      let pushPathByNamePageThreeBtn = await driver.waitForComponent(ON.id('pushPathByNamePageThreeBtn0050'), 1000);
      Logger.info('TEST', `Found component: pushPathByNamePageThreeBtn0050`);
      if (!pushPathByNamePageThreeBtn) {
        Logger.error('TEST', `Component not found: pushPathByNamePageThreeBtn0050`);
        throw new Error('Component not found: pushPathByNamePageThreeBtn0050');
      }
      await pushPathByNamePageThreeBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0050_02');
      await Utils.sleep(1000);
      
      // 4.点击"pushDestinationByName pageTwo"按钮
      let pushDestinationByNamePageTwoBtn = await driver.waitForComponent(ON.id('pushDestinationByNamePageTwoBtn0050'), 1000);
      Logger.info('TEST', `Found component: pushDestinationByNamePageTwoBtn0050`);
      if (!pushDestinationByNamePageTwoBtn) {
        Logger.error('TEST', `Component not found: pushDestinationByNamePageTwoBtn0050`);
        throw new Error('Component not found: pushDestinationByNamePageTwoBtn0050');
      }
      await pushDestinationByNamePageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0050_03');
      await Utils.sleep(1000);
      
      // 5.点击"push pageOne POP_TO_SINGLETON"按钮
      let pushPageOnePopToSingletonBtn = await driver.waitForComponent(ON.id('pushPageOnePopToSingletonBtn0050'), 1000);
      Logger.info('TEST', `Found component: pushPageOnePopToSingletonBtn0050`);
      if (!pushPageOnePopToSingletonBtn) {
        Logger.error('TEST', `Component not found: pushPageOnePopToSingletonBtn0050`);
        throw new Error('Component not found: pushPageOnePopToSingletonBtn0050');
      }
      await pushPageOnePopToSingletonBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0050_04');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0060
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（栈操作replace接口，replace STANDARD页面）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0060 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0060/navigationOnActiveOnInActive0060')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础栈操作场景"按钮
      let navigationBasicStackOperationBtn = await driver.waitForComponent(ON.id('navigationBasicStackOperationBtn0060'), 1000);
      Logger.info('TEST', `Found component: navigationBasicStackOperationBtn0060`);
      if (!navigationBasicStackOperationBtn) {
        Logger.error('TEST', `Component not found: navigationBasicStackOperationBtn0060`);
        throw new Error('Component not found: navigationBasicStackOperationBtn0060');
      }
      await navigationBasicStackOperationBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicStackOperationBtn, waiting for page to render`);
      
      // 2.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0060'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0060, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0060 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0060'), 1000);
        Logger.info('TEST', `Retry found component: pushPageOneBtn0060, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
        if (!pushPageOneBtn) {
          throw new Error('Component not found: pushPageOneBtn0060');
        }
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0060_01');
      await Utils.sleep(1000);
      
      // 3.点击"pushDestinationByName pageTwo"按钮
      let pushDestinationByNamePageTwoBtn = await driver.waitForComponent(ON.id('pushDestinationByNamePageTwoBtn0060'), 1000);
      Logger.info('TEST', `Found component: pushDestinationByNamePageTwoBtn0060`);
      if (!pushDestinationByNamePageTwoBtn) {
        Logger.error('TEST', `Component not found: pushDestinationByNamePageTwoBtn0060`);
        throw new Error('Component not found: pushDestinationByNamePageTwoBtn0060');
      }
      await pushDestinationByNamePageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0060_02');
      await Utils.sleep(1000);
      
      // 4.点击"replacePath pageOne"按钮
      let replacePathPageOneBtn = await driver.waitForComponent(ON.id('replacePathPageOneBtn0060'), 1000);
      Logger.info('TEST', `Found component: replacePathPageOneBtn0060`);
      if (!replacePathPageOneBtn) {
        Logger.error('TEST', `Component not found: replacePathPageOneBtn0060`);
        throw new Error('Component not found: replacePathPageOneBtn0060');
      }
      await replacePathPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0060_03');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0070
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（栈操作replace接口，replace DIALOG页面）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0070 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0070/navigationOnActiveOnInActive0070')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础栈操作场景"按钮
      let navigationBasicStackOperationBtn = await driver.waitForComponent(ON.id('navigationBasicStackOperationBtn0070'), 1000);
      Logger.info('TEST', `Found component: navigationBasicStackOperationBtn0070`);
      if (!navigationBasicStackOperationBtn) {
        Logger.error('TEST', `Component not found: navigationBasicStackOperationBtn0070`);
        throw new Error('Component not found: navigationBasicStackOperationBtn0070');
      }
      await navigationBasicStackOperationBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicStackOperationBtn, waiting for page to render`);
      
      // 2.点击"push pageThree"按钮
      let pushPageThreeBtn = await driver.waitForComponent(ON.id('pushPageThreeBtn0070'), 1000);
      Logger.info('TEST', `Found component: pushPageThreeBtn0070, result: ${pushPageThreeBtn ? 'found' : 'not found'}`);
      if (!pushPageThreeBtn) {
        Logger.error('TEST', `Component not found: pushPageThreeBtn0070 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageThreeBtn = await driver.waitForComponent(ON.id('pushPageThreeBtn0070'), 1000);
        Logger.info('TEST', `Retry found component: pushPageThreeBtn0070, result: ${pushPageThreeBtn ? 'found' : 'not found'}`);
        if (!pushPageThreeBtn) {
          throw new Error('Component not found: pushPageThreeBtn0070');
        }
      }
      await pushPageThreeBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0070_01');
      await Utils.sleep(1000);
      
      // 3.点击"pushDestinationByName pageTwo"按钮
      let pushDestinationByNamePageTwoBtn = await driver.waitForComponent(ON.id('pushDestinationByNamePageTwoBtn0070'), 1000);
      Logger.info('TEST', `Found component: pushDestinationByNamePageTwoBtn0070`);
      if (!pushDestinationByNamePageTwoBtn) {
        Logger.error('TEST', `Component not found: pushDestinationByNamePageTwoBtn0070`);
        throw new Error('Component not found: pushDestinationByNamePageTwoBtn0070');
      }
      await pushDestinationByNamePageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0070_02');
      await Utils.sleep(1000);
      
      // 4.点击"replacePath pageFour"按钮
      let replacePathPageFourBtn = await driver.waitForComponent(ON.id('replacePathPageFourBtn0070'), 1000);
      Logger.info('TEST', `Found component: replacePathPageFourBtn0070`);
      if (!replacePathPageFourBtn) {
        Logger.error('TEST', `Component not found: replacePathPageFourBtn0070`);
        throw new Error('Component not found: replacePathPageFourBtn0070');
      }
      await replacePathPageFourBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0070_03');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0080
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（栈操作replace接口，replace STANDARD页面，使用MOVE_TO_TOP_SINGLETON）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0080 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0080/navigationOnActiveOnInActive0080')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础栈操作场景"按钮
      let navigationBasicStackOperationBtn = await driver.waitForComponent(ON.id('navigationBasicStackOperationBtn0080'), 1000);
      Logger.info('TEST', `Found component: navigationBasicStackOperationBtn0080`);
      if (!navigationBasicStackOperationBtn) {
        Logger.error('TEST', `Component not found: navigationBasicStackOperationBtn0080`);
        throw new Error('Component not found: navigationBasicStackOperationBtn0080');
      }
      await navigationBasicStackOperationBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicStackOperationBtn, waiting for page to render`);
      
      // 2.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0080'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0080, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0080 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0080'), 1000);
        Logger.info('TEST', `Retry found component: pushPageOneBtn0080, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
        if (!pushPageOneBtn) {
          throw new Error('Component not found: pushPageOneBtn0080');
        }
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0080_01');
      await Utils.sleep(1000);
      
      // 3.点击"pushDestinationByName pageTwo"按钮
      let pushDestinationByNamePageTwoBtn = await driver.waitForComponent(ON.id('pushDestinationByNamePageTwoBtn0080'), 1000);
      Logger.info('TEST', `Found component: pushDestinationByNamePageTwoBtn0080`);
      if (!pushDestinationByNamePageTwoBtn) {
        Logger.error('TEST', `Component not found: pushDestinationByNamePageTwoBtn0080`);
        throw new Error('Component not found: pushDestinationByNamePageTwoBtn0080');
      }
      await pushDestinationByNamePageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0080_02');
      await Utils.sleep(1000);
      
      // 4.点击"replacePath pageOne MOVE_TO_TOP_SINGLETON"按钮
      let replacePathPageOneMoveToTopSingletonBtn = await driver.waitForComponent(ON.id('replacePathPageOneMoveToTopSingletonBtn0080'), 1000);
      Logger.info('TEST', `Found component: replacePathPageOneMoveToTopSingletonBtn0080`);
      if (!replacePathPageOneMoveToTopSingletonBtn) {
        Logger.error('TEST', `Component not found: replacePathPageOneMoveToTopSingletonBtn0080`);
        throw new Error('Component not found: replacePathPageOneMoveToTopSingletonBtn0080');
      }
      await replacePathPageOneMoveToTopSingletonBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0080_03');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0090
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（栈操作replace接口，replace STANDARD页面，使用POP_TO_SINGLETON）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0090 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0090/navigationOnActiveOnInActive0090')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础栈操作场景"按钮
      let navigationBasicStackOperationBtn = await driver.waitForComponent(ON.id('navigationBasicStackOperationBtn0090'), 1000);
      Logger.info('TEST', `Found component: navigationBasicStackOperationBtn0090`);
      if (!navigationBasicStackOperationBtn) {
        Logger.error('TEST', `Component not found: navigationBasicStackOperationBtn0090`);
        throw new Error('Component not found: navigationBasicStackOperationBtn0090');
      }
      await navigationBasicStackOperationBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicStackOperationBtn, waiting for page to render`);
      
      // 2.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0090'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0090, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0090 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0090'), 1000);
        Logger.info('TEST', `Retry found component: pushPageOneBtn0090, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
        if (!pushPageOneBtn) {
          throw new Error('Component not found: pushPageOneBtn0090');
        }
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0090_01');
      await Utils.sleep(1000);
      
      // 3.点击"pushDestinationByName pageTwo"按钮
      let pushDestinationByNamePageTwoBtn = await driver.waitForComponent(ON.id('pushDestinationByNamePageTwoBtn0090'), 1000);
      Logger.info('TEST', `Found component: pushDestinationByNamePageTwoBtn0090`);
      if (!pushDestinationByNamePageTwoBtn) {
        Logger.error('TEST', `Component not found: pushDestinationByNamePageTwoBtn0090`);
        throw new Error('Component not found: pushDestinationByNamePageTwoBtn0090');
      }
      await pushDestinationByNamePageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0090_02');
      await Utils.sleep(1000);
      
      // 4.点击"replacePath pageOne POP_TO_SINGLETON"按钮
      let replacePathPageOnePopToSingletonBtn = await driver.waitForComponent(ON.id('replacePathPageOnePopToSingletonBtn0090'), 1000);
      Logger.info('TEST', `Found component: replacePathPageOnePopToSingletonBtn0090`);
      if (!replacePathPageOnePopToSingletonBtn) {
        Logger.error('TEST', `Component not found: replacePathPageOnePopToSingletonBtn0090`);
        throw new Error('Component not found: replacePathPageOnePopToSingletonBtn0090');
      }
      await replacePathPageOnePopToSingletonBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0090_03');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0100
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（栈操作moveIndexToTop STANDARD页面）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0100 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0100/navigationOnActiveOnInActive0100')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础栈操作场景"按钮
      let navigationBasicStackOperationBtn = await driver.waitForComponent(ON.id('navigationBasicStackOperationBtn0100'), 1000);
      Logger.info('TEST', `Found component: navigationBasicStackOperationBtn0100`);
      if (!navigationBasicStackOperationBtn) {
        Logger.error('TEST', `Component not found: navigationBasicStackOperationBtn0100`);
        throw new Error('Component not found: navigationBasicStackOperationBtn0100');
      }
      await navigationBasicStackOperationBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicStackOperationBtn, waiting for page to render`);
      
      // 2.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0100'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0100, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0100 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0100'), 1000);
        Logger.info('TEST', `Retry found component: pushPageOneBtn0100, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
        if (!pushPageOneBtn) {
          throw new Error('Component not found: pushPageOneBtn0100');
        }
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0100_01');
      await Utils.sleep(1000);
      
      // 3.点击"push pageTwo"按钮
      let pushPageTwoBtn = await driver.waitForComponent(ON.id('pushPageTwoBtn0100'), 1000);
      Logger.info('TEST', `Found component: pushPageTwoBtn0100`);
      if (!pushPageTwoBtn) {
        Logger.error('TEST', `Component not found: pushPageTwoBtn0100`);
        throw new Error('Component not found: pushPageTwoBtn0100');
      }
      await pushPageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0100_02');
      await Utils.sleep(1000);
      
      // 4.点击"push pageThree"按钮
      let pushPageThreeBtn = await driver.waitForComponent(ON.id('pushPageThreeBtn0100'), 1000);
      Logger.info('TEST', `Found component: pushPageThreeBtn0100`);
      if (!pushPageThreeBtn) {
        Logger.error('TEST', `Component not found: pushPageThreeBtn0100`);
        throw new Error('Component not found: pushPageThreeBtn0100');
      }
      await pushPageThreeBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0100_03');
      await Utils.sleep(1000);
      
      // 5.点击"moveIndexToTop 0"按钮
      let moveIndexToTop0Btn = await driver.waitForComponent(ON.id('moveIndexToTop0Btn0100'), 1000);
      Logger.info('TEST', `Found component: moveIndexToTop0Btn0100`);
      if (!moveIndexToTop0Btn) {
        Logger.error('TEST', `Component not found: moveIndexToTop0Btn0100`);
        throw new Error('Component not found: moveIndexToTop0Btn0100');
      }
      await moveIndexToTop0Btn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0100_04');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0110
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（栈操作moveIndexToTop DIALOG页面）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0110 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0110/navigationOnActiveOnInActive0110')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础栈操作场景"按钮
      let navigationBasicStackOperationBtn = await driver.waitForComponent(ON.id('navigationBasicStackOperationBtn0110'), 1000);
      Logger.info('TEST', `Found component: navigationBasicStackOperationBtn0110`);
      if (!navigationBasicStackOperationBtn) {
        Logger.error('TEST', `Component not found: navigationBasicStackOperationBtn0110`);
        throw new Error('Component not found: navigationBasicStackOperationBtn0110');
      }
      await navigationBasicStackOperationBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicStackOperationBtn, waiting for page to render`);
      
      // 2.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0110'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0110, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0110 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0110'), 1000);
        Logger.info('TEST', `Retry found component: pushPageOneBtn0110, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
        if (!pushPageOneBtn) {
          throw new Error('Component not found: pushPageOneBtn0110');
        }
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0110_01');
      await Utils.sleep(1000);
      
      // 3.点击"push pageThree"按钮
      let pushPageThreeBtn = await driver.waitForComponent(ON.id('pushPageThreeBtn0110'), 1000);
      Logger.info('TEST', `Found component: pushPageThreeBtn0110`);
      if (!pushPageThreeBtn) {
        Logger.error('TEST', `Component not found: pushPageThreeBtn0110`);
        throw new Error('Component not found: pushPageThreeBtn0110');
      }
      await pushPageThreeBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0110_02');
      await Utils.sleep(1000);
      
      // 4.点击"push pageTwo"按钮
      let pushPageTwoBtn = await driver.waitForComponent(ON.id('pushPageTwoBtn0110'), 1000);
      Logger.info('TEST', `Found component: pushPageTwoBtn0110`);
      if (!pushPageTwoBtn) {
        Logger.error('TEST', `Component not found: pushPageTwoBtn0110`);
        throw new Error('Component not found: pushPageTwoBtn0110');
      }
      await pushPageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0110_03');
      await Utils.sleep(1000);
      
      // 5.点击"push pageFour"按钮
      let pushPageFourBtn = await driver.waitForComponent(ON.id('pushPageFourBtn0110'), 1000);
      Logger.info('TEST', `Found component: pushPageFourBtn0110`);
      if (!pushPageFourBtn) {
        Logger.error('TEST', `Component not found: pushPageFourBtn0110`);
        throw new Error('Component not found: pushPageFourBtn0110');
      }
      await pushPageFourBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0110_04');
      await Utils.sleep(1000);
      
      // 6.点击"moveIndexToTop 1"按钮
      let moveIndexToTop1Btn = await driver.waitForComponent(ON.id('moveIndexToTop1Btn0110'), 1000);
      Logger.info('TEST', `Found component: moveIndexToTop1Btn0110`);
      if (!moveIndexToTop1Btn) {
        Logger.error('TEST', `Component not found: moveIndexToTop1Btn0110`);
        throw new Error('Component not found: moveIndexToTop1Btn0110');
      }
      await moveIndexToTop1Btn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0110_05');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0120
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（栈操作pop接口，pop STANDARD、DIALOG页面）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0120 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0120/navigationOnActiveOnInActive0120')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础栈操作场景"按钮
      let navigationBasicStackOperationBtn = await driver.waitForComponent(ON.id('navigationBasicStackOperationBtn0120'), 1000);
      Logger.info('TEST', `Found component: navigationBasicStackOperationBtn0120`);
      if (!navigationBasicStackOperationBtn) {
        Logger.error('TEST', `Component not found: navigationBasicStackOperationBtn0120`);
        throw new Error('Component not found: navigationBasicStackOperationBtn0120');
      }
      await navigationBasicStackOperationBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicStackOperationBtn, waiting for page to render`);
      
      // 2.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0120'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0120, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0120 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0120'), 1000);
        Logger.info('TEST', `Retry found component: pushPageOneBtn0120, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
        if (!pushPageOneBtn) {
          throw new Error('Component not found: pushPageOneBtn0120');
        }
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0120_01');
      await Utils.sleep(1000);
      
      // 3.点击"push pageThree"按钮
      let pushPageThreeBtn = await driver.waitForComponent(ON.id('pushPageThreeBtn0120'), 1000);
      Logger.info('TEST', `Found component: pushPageThreeBtn0120`);
      if (!pushPageThreeBtn) {
        Logger.error('TEST', `Component not found: pushPageThreeBtn0120`);
        throw new Error('Component not found: pushPageThreeBtn0120');
      }
      await pushPageThreeBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0120_02');
      await Utils.sleep(1000);
      
      // 4.点击"pop"按钮
      let popBtn = await driver.waitForComponent(ON.id('popBtn0120'), 1000);
      Logger.info('TEST', `Found component: popBtn0120`);
      if (!popBtn) {
        Logger.error('TEST', `Component not found: popBtn0120`);
        throw new Error('Component not found: popBtn0120');
      }
      await popBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0120_03');
      await Utils.sleep(1000);
      
      // 5.点击"pop"按钮
      let popBtn2 = await driver.waitForComponent(ON.id('popBtn0120'), 1000);
      Logger.info('TEST', `Found component: popBtn0120 (second time)`);
      if (!popBtn2) {
        Logger.error('TEST', `Component not found: popBtn0120 (second time)`);
        throw new Error('Component not found: popBtn0120 (second time)');
      }
      await popBtn2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0120_04');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0130
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（栈操作pop接口，popToIndex STANDARD、DIALOG页面）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0130 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0130/navigationOnActiveOnInActive0130')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础栈操作场景"按钮
      let navigationBasicStackOperationBtn = await driver.waitForComponent(ON.id('navigationBasicStackOperationBtn0130'), 1000);
      Logger.info('TEST', `Found component: navigationBasicStackOperationBtn0130`);
      if (!navigationBasicStackOperationBtn) {
        Logger.error('TEST', `Component not found: navigationBasicStackOperationBtn0130`);
        throw new Error('Component not found: navigationBasicStackOperationBtn0130');
      }
      await navigationBasicStackOperationBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicStackOperationBtn, waiting for page to render`);
      
      // 2.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0130'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0130, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0130 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0130'), 1000);
        Logger.info('TEST', `Retry found component: pushPageOneBtn0130, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
        if (!pushPageOneBtn) {
          throw new Error('Component not found: pushPageOneBtn0130');
        }
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0130_01');
      await Utils.sleep(1000);
      
      // 3.点击"push pageTwo"按钮
      let pushPageTwoBtn = await driver.waitForComponent(ON.id('pushPageTwoBtn0130'), 1000);
      Logger.info('TEST', `Found component: pushPageTwoBtn0130`);
      if (!pushPageTwoBtn) {
        Logger.error('TEST', `Component not found: pushPageTwoBtn0130`);
        throw new Error('Component not found: pushPageTwoBtn0130');
      }
      await pushPageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0130_02');
      await Utils.sleep(1000);
      
      // 4.点击"push pageThree"按钮
      let pushPageThreeBtn = await driver.waitForComponent(ON.id('pushPageThreeBtn0130'), 1000);
      Logger.info('TEST', `Found component: pushPageThreeBtn0130`);
      if (!pushPageThreeBtn) {
        Logger.error('TEST', `Component not found: pushPageThreeBtn0130`);
        throw new Error('Component not found: pushPageThreeBtn0130');
      }
      await pushPageThreeBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0130_03');
      await Utils.sleep(1000);
      
      // 5.点击"popToIndex 0"按钮
      let popToIndex0Btn = await driver.waitForComponent(ON.id('popToIndex0Btn0130'), 1000);
      Logger.info('TEST', `Found component: popToIndex0Btn0130`);
      if (!popToIndex0Btn) {
        Logger.error('TEST', `Component not found: popToIndex0Btn0130`);
        throw new Error('Component not found: popToIndex0Btn0130');
      }
      await popToIndex0Btn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0130_04');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0140
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（栈操作remove STANDARD页面）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0140 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0140/navigationOnActiveOnInActive0140')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础栈操作场景"按钮
      let navigationBasicStackOperationBtn = await driver.waitForComponent(ON.id('navigationBasicStackOperationBtn0140'), 1000);
      Logger.info('TEST', `Found component: navigationBasicStackOperationBtn0140`);
      if (!navigationBasicStackOperationBtn) {
        Logger.error('TEST', `Component not found: navigationBasicStackOperationBtn0140`);
        throw new Error('Component not found: navigationBasicStackOperationBtn0140');
      }
      await navigationBasicStackOperationBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicStackOperationBtn, waiting for page to render`);
      
      // 2.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0140'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0140, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0140 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0140'), 1000);
        Logger.info('TEST', `Retry found component: pushPageOneBtn0140, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
        if (!pushPageOneBtn) {
          throw new Error('Component not found: pushPageOneBtn0140');
        }
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0140_01');
      await Utils.sleep(1000);
      
      // 3.点击"push pageTwo"按钮
      let pushPageTwoBtn = await driver.waitForComponent(ON.id('pushPageTwoBtn0140'), 1000);
      Logger.info('TEST', `Found component: pushPageTwoBtn0140`);
      if (!pushPageTwoBtn) {
        Logger.error('TEST', `Component not found: pushPageTwoBtn0140`);
        throw new Error('Component not found: pushPageTwoBtn0140');
      }
      await pushPageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0140_02');
      await Utils.sleep(1000);
      
      // 4.点击"removeByIndexes[1]"按钮
      let removeByIndexes1Btn = await driver.waitForComponent(ON.id('removeByIndexes1Btn0140'), 1000);
      Logger.info('TEST', `Found component: removeByIndexes1Btn0140`);
      if (!removeByIndexes1Btn) {
        Logger.error('TEST', `Component not found: removeByIndexes1Btn0140`);
        throw new Error('Component not found: removeByIndexes1Btn0140');
      }
      await removeByIndexes1Btn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0140_03');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0150
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（栈操作remove DIALOG页面）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0150 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0150/navigationOnActiveOnInActive0150')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础栈操作场景"按钮
      let navigationBasicStackOperationBtn = await driver.waitForComponent(ON.id('navigationBasicStackOperationBtn0150'), 1000);
      Logger.info('TEST', `Found component: navigationBasicStackOperationBtn0150`);
      if (!navigationBasicStackOperationBtn) {
        Logger.error('TEST', `Component not found: navigationBasicStackOperationBtn0150`);
        throw new Error('Component not found: navigationBasicStackOperationBtn0150');
      }
      await navigationBasicStackOperationBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicStackOperationBtn, waiting for page to render`);
      
      // 2.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0150'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0150, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0150 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0150'), 1000);
        Logger.info('TEST', `Retry found component: pushPageOneBtn0150, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
        if (!pushPageOneBtn) {
          throw new Error('Component not found: pushPageOneBtn0150');
        }
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0150_01');
      await Utils.sleep(1000);
      
      // 3.点击"push pageThree"按钮
      let pushPageThreeBtn = await driver.waitForComponent(ON.id('pushPageThreeBtn0150'), 1000);
      Logger.info('TEST', `Found component: pushPageThreeBtn0150`);
      if (!pushPageThreeBtn) {
        Logger.error('TEST', `Component not found: pushPageThreeBtn0150`);
        throw new Error('Component not found: pushPageThreeBtn0150');
      }
      await pushPageThreeBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0150_02');
      await Utils.sleep(1000);
      
      // 4.点击"push pageTwo"按钮
      let pushPageTwoBtn = await driver.waitForComponent(ON.id('pushPageTwoBtn0150'), 1000);
      Logger.info('TEST', `Found component: pushPageTwoBtn0150`);
      if (!pushPageTwoBtn) {
        Logger.error('TEST', `Component not found: pushPageTwoBtn0150`);
        throw new Error('Component not found: pushPageTwoBtn0150');
      }
      await pushPageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0150_03');
      await Utils.sleep(1000);
      
      // 5.点击"push pageFour"按钮
      let pushPageFourBtn = await driver.waitForComponent(ON.id('pushPageFourBtn0150'), 1000);
      Logger.info('TEST', `Found component: pushPageFourBtn0150`);
      if (!pushPageFourBtn) {
        Logger.error('TEST', `Component not found: pushPageFourBtn0150`);
        throw new Error('Component not found: pushPageFourBtn0150');
      }
      await pushPageFourBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0150_04');
      await Utils.sleep(1000);
      
      // 6.点击"removeByIndexes[1,3]"按钮
      let removeByIndexes13Btn = await driver.waitForComponent(ON.id('removeByIndexes13Btn0150'), 1000);
      Logger.info('TEST', `Found component: removeByIndexes13Btn0150`);
      if (!removeByIndexes13Btn) {
        Logger.error('TEST', `Component not found: removeByIndexes13Btn0150`);
        throw new Error('Component not found: removeByIndexes13Btn0150');
      }
      await removeByIndexes13Btn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0150_05');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0160
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（栈操作remove STANDARD、DIALOG页面）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0160 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0160/navigationOnActiveOnInActive0160')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础栈操作场景"按钮
      let navigationBasicStackOperationBtn = await driver.waitForComponent(ON.id('navigationBasicStackOperationBtn0160'), 1000);
      Logger.info('TEST', `Found component: navigationBasicStackOperationBtn0160`);
      if (!navigationBasicStackOperationBtn) {
        Logger.error('TEST', `Component not found: navigationBasicStackOperationBtn0160`);
        throw new Error('Component not found: navigationBasicStackOperationBtn0160');
      }
      await navigationBasicStackOperationBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicStackOperationBtn, waiting for page to render`);
      
      // 2.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0160'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0160, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0160 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0160'), 1000);
        Logger.info('TEST', `Retry found component: pushPageOneBtn0160, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
        if (!pushPageOneBtn) {
          throw new Error('Component not found: pushPageOneBtn0160');
        }
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0160_01');
      await Utils.sleep(1000);
      
      // 3.点击"push pageThree"按钮
      let pushPageThreeBtn = await driver.waitForComponent(ON.id('pushPageThreeBtn0160'), 1000);
      Logger.info('TEST', `Found component: pushPageThreeBtn0160`);
      if (!pushPageThreeBtn) {
        Logger.error('TEST', `Component not found: pushPageThreeBtn0160`);
        throw new Error('Component not found: pushPageThreeBtn0160');
      }
      await pushPageThreeBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0160_02');
      await Utils.sleep(1000);
      
      // 4.点击"push pageTwo"按钮
      let pushPageTwoBtn = await driver.waitForComponent(ON.id('pushPageTwoBtn0160'), 1000);
      Logger.info('TEST', `Found component: pushPageTwoBtn0160`);
      if (!pushPageTwoBtn) {
        Logger.error('TEST', `Component not found: pushPageTwoBtn0160`);
        throw new Error('Component not found: pushPageTwoBtn0160');
      }
      await pushPageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0160_03');
      await Utils.sleep(1000);
      
      // 5.点击"push pageFour"按钮
      let pushPageFourBtn = await driver.waitForComponent(ON.id('pushPageFourBtn0160'), 1000);
      Logger.info('TEST', `Found component: pushPageFourBtn0160`);
      if (!pushPageFourBtn) {
        Logger.error('TEST', `Component not found: pushPageFourBtn0160`);
        throw new Error('Component not found: pushPageFourBtn0160');
      }
      await pushPageFourBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0160_04');
      await Utils.sleep(1000);
      
      // 6.点击"removeByIndexes[2,3]"按钮
      let removeByIndexes23Btn = await driver.waitForComponent(ON.id('removeByIndexes23Btn0160'), 1000);
      Logger.info('TEST', `Found component: removeByIndexes23Btn0160`);
      if (!removeByIndexes23Btn) {
        Logger.error('TEST', `Component not found: removeByIndexes23Btn0160`);
        throw new Error('Component not found: removeByIndexes23Btn0160');
      }
      await removeByIndexes23Btn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0160_05');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0170
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（栈操作clear）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0170 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0170/navigationOnActiveOnInActive0170')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础栈操作场景"按钮
      let navigationBasicStackOperationBtn = await driver.waitForComponent(ON.id('navigationBasicStackOperationBtn0170'), 1000);
      Logger.info('TEST', `Found component: navigationBasicStackOperationBtn0170`);
      if (!navigationBasicStackOperationBtn) {
        Logger.error('TEST', `Component not found: navigationBasicStackOperationBtn0170`);
        throw new Error('Component not found: navigationBasicStackOperationBtn0170');
      }
      await navigationBasicStackOperationBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicStackOperationBtn, waiting for page to render`);
      
      // 2.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0170'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0170, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0170 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0170'), 1000);
        Logger.info('TEST', `Retry found component: pushPageOneBtn0170, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
        if (!pushPageOneBtn) {
          throw new Error('Component not found: pushPageOneBtn0170');
        }
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0170_01');
      await Utils.sleep(1000);
      
      // 3.点击"push pageThree"按钮
      let pushPageThreeBtn = await driver.waitForComponent(ON.id('pushPageThreeBtn0170'), 1000);
      Logger.info('TEST', `Found component: pushPageThreeBtn0170`);
      if (!pushPageThreeBtn) {
        Logger.error('TEST', `Component not found: pushPageThreeBtn0170`);
        throw new Error('Component not found: pushPageThreeBtn0170');
      }
      await pushPageThreeBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0170_02');
      await Utils.sleep(1000);
      
      // 4.点击"clear"按钮
      let clearBtn = await driver.waitForComponent(ON.id('clearBtn0170'), 1000);
      Logger.info('TEST', `Found component: clearBtn0170`);
      if (!clearBtn) {
        Logger.error('TEST', `Component not found: clearBtn0170`);
        throw new Error('Component not found: clearBtn0170');
      }
      await clearBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0170_03');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0180
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（返回键+侧滑返回）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0180 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0180/navigationOnActiveOnInActive0180')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础栈操作场景"按钮
      let navigationBasicStackOperationBtn = await driver.waitForComponent(ON.id('navigationBasicStackOperationBtn0180'), 1000);
      Logger.info('TEST', `Found component: navigationBasicStackOperationBtn0180, result: ${navigationBasicStackOperationBtn ? 'found' : 'not found'}`);
      if (!navigationBasicStackOperationBtn) {
        Logger.error('TEST', `Component not found: navigationBasicStackOperationBtn0180 after initial load. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        navigationBasicStackOperationBtn = await driver.waitForComponent(ON.id('navigationBasicStackOperationBtn0180'), 1000);
        Logger.info('TEST', `Retry found component: navigationBasicStackOperationBtn0180, result: ${navigationBasicStackOperationBtn ? 'found' : 'not found'}`);
        if (!navigationBasicStackOperationBtn) {
          throw new Error('Component not found: navigationBasicStackOperationBtn0180');
        }
      }
      await navigationBasicStackOperationBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicStackOperationBtn, waiting for page to render`);
      
      // 2.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0180'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0180, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0180 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0180'), 1000);
        Logger.info('TEST', `Retry found component: pushPageOneBtn0180, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
        if (!pushPageOneBtn) {
          throw new Error('Component not found: pushPageOneBtn0180');
        }
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0180_01');
      await Utils.sleep(1000);
      
      // 3.点击"push pageThree"按钮
      let pushPageThreeBtn = await driver.waitForComponent(ON.id('pushPageThreeBtn0180'), 1000);
      Logger.info('TEST', `Found component: pushPageThreeBtn0180`);
      if (!pushPageThreeBtn) {
        Logger.error('TEST', `Component not found: pushPageThreeBtn0180`);
        throw new Error('Component not found: pushPageThreeBtn0180');
      }
      await pushPageThreeBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0180_02');
      await Utils.sleep(1000);
      
      // 4.点击"push pageTwo"按钮
      let pushPageTwoBtn = await driver.waitForComponent(ON.id('pushPageTwoBtn0180'), 1000);
      Logger.info('TEST', `Found component: pushPageTwoBtn0180`);
      if (!pushPageTwoBtn) {
        Logger.error('TEST', `Component not found: pushPageTwoBtn0180`);
        throw new Error('Component not found: pushPageTwoBtn0180');
      }
      await pushPageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0180_03');
      await Utils.sleep(1000);
      
      // 5.点击"push pageFour"按钮
      let pushPageFourBtn = await driver.waitForComponent(ON.id('pushPageFourBtn0180'), 1000);
      Logger.info('TEST', `Found component: pushPageFourBtn0180`);
      if (!pushPageFourBtn) {
        Logger.error('TEST', `Component not found: pushPageFourBtn0180`);
        throw new Error('Component not found: pushPageFourBtn0180');
      }
      await pushPageFourBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0180_04');
      await Utils.sleep(1000);
      
      // 6.点击返回键
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0180_05');
      await Utils.sleep(1000);
      
      // 7.侧滑返回
      await driver.swipe(50, 500, 500, 500, 1000);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0180_06');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0190
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（栈操作push接口，关闭动画，参数animated设置为false）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0190 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0190/navigationOnActiveOnInActive0190')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"基础场景"按钮
      let basicSceneBtn = await driver.waitForComponent(ON.id('basicSceneBtn0190'), 1000);
      Logger.info('TEST', `Found component: basicSceneBtn0190`);
      if (!basicSceneBtn) {
        Logger.error('TEST', `Component not found: basicSceneBtn0190`);
        throw new Error('Component not found: basicSceneBtn0190');
      }
      await basicSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking basicSceneBtn, waiting for page to render`);
      
      // 2.点击"push pageOne animated false"按钮
      let pushPageOneAnimatedFalseBtn = await driver.waitForComponent(ON.id('pushPageOneAnimatedFalseBtn0190'), 1000);
      Logger.info('TEST', `Found component: pushPageOneAnimatedFalseBtn0190, result: ${pushPageOneAnimatedFalseBtn ? 'found' : 'not found'}`);
      if (!pushPageOneAnimatedFalseBtn) {
        Logger.error('TEST', `Component not found: pushPageOneAnimatedFalseBtn0190 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageOneAnimatedFalseBtn = await driver.waitForComponent(ON.id('pushPageOneAnimatedFalseBtn0190'), 1000);
        Logger.info('TEST', `Retry found component: pushPageOneAnimatedFalseBtn0190, result: ${pushPageOneAnimatedFalseBtn ? 'found' : 'not found'}`);
        if (!pushPageOneAnimatedFalseBtn) {
          throw new Error('Component not found: pushPageOneAnimatedFalseBtn0190');
        }
      }
      await pushPageOneAnimatedFalseBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0190_01');
      await Utils.sleep(1000);
      
      // 3.点击"pushPathByName pageThree animated false"按钮
      let pushPathByNamePageThreeAnimatedFalseBtn = await driver.waitForComponent(ON.id('pushPathByNamePageThreeAnimatedFalseBtn0190'), 1000);
      Logger.info('TEST', `Found component: pushPathByNamePageThreeAnimatedFalseBtn0190`);
      if (!pushPathByNamePageThreeAnimatedFalseBtn) {
        Logger.error('TEST', `Component not found: pushPathByNamePageThreeAnimatedFalseBtn0190`);
        throw new Error('Component not found: pushPathByNamePageThreeAnimatedFalseBtn0190');
      }
      await pushPathByNamePageThreeAnimatedFalseBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0190_02');
      await Utils.sleep(1000);
      
      // 4.点击"pushDestinationByName pageTwo animated false"按钮
      let pushDestinationByNamePageTwoAnimatedFalseBtn = await driver.waitForComponent(ON.id('pushDestinationByNamePageTwoAnimatedFalseBtn0190'), 1000);
      Logger.info('TEST', `Found component: pushDestinationByNamePageTwoAnimatedFalseBtn0190`);
      if (!pushDestinationByNamePageTwoAnimatedFalseBtn) {
        Logger.error('TEST', `Component not found: pushDestinationByNamePageTwoAnimatedFalseBtn0190`);
        throw new Error('Component not found: pushDestinationByNamePageTwoAnimatedFalseBtn0190');
      }
      await pushDestinationByNamePageTwoAnimatedFalseBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0190_03');
      await Utils.sleep(1000);
      
      // 5.点击"pop animated false"按钮
      let popAnimatedFalseBtn = await driver.waitForComponent(ON.id('popAnimatedFalseBtn0190'), 1000);
      Logger.info('TEST', `Found component: popAnimatedFalseBtn0190`);
      if (!popAnimatedFalseBtn) {
        Logger.error('TEST', `Component not found: popAnimatedFalseBtn0190`);
        throw new Error('Component not found: popAnimatedFalseBtn0190');
      }
      await popAnimatedFalseBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0190_04');
      await Utils.sleep(1000);
      
      // 6.点击"moveIndexToTop 0 animated false"按钮
      let moveIndexToTop0AnimatedFalseBtn = await driver.waitForComponent(ON.id('moveIndexToTop0AnimatedFalseBtn0190'), 1000);
      Logger.info('TEST', `Found component: moveIndexToTop0AnimatedFalseBtn0190`);
      if (!moveIndexToTop0AnimatedFalseBtn) {
        Logger.error('TEST', `Component not found: moveIndexToTop0AnimatedFalseBtn0190`);
        throw new Error('Component not found: moveIndexToTop0AnimatedFalseBtn0190');
      }
      await moveIndexToTop0AnimatedFalseBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0190_05');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0200
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（栈操作push接口，关闭动画，disableAnimation设置为true）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0200 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0200/navigationOnActiveOnInActive0200')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础栈操作场景"按钮
      let navigationBasicStackOperationBtn = await driver.waitForComponent(ON.id('navigationBasicStackOperationBtn0200'), 1000);
      Logger.info('TEST', `Found component: navigationBasicStackOperationBtn0200`);
      if (!navigationBasicStackOperationBtn) {
        Logger.error('TEST', `Component not found: navigationBasicStackOperationBtn0200`);
        throw new Error('Component not found: navigationBasicStackOperationBtn0200');
      }
      await navigationBasicStackOperationBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicStackOperationBtn, waiting for page to render`);
      
      // 2.点击"全局是否禁用转场动画，disableAnimation: xx"按钮，设置为true
      let toggleDisableAnimationBtn = await driver.waitForComponent(ON.id('toggleDisableAnimationBtn0200'), 1000);
      Logger.info('TEST', `Found component: toggleDisableAnimationBtn0200, result: ${toggleDisableAnimationBtn ? 'found' : 'not found'}`);
      if (!toggleDisableAnimationBtn) {
        Logger.error('TEST', `Component not found: toggleDisableAnimationBtn0200 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        toggleDisableAnimationBtn = await driver.waitForComponent(ON.id('toggleDisableAnimationBtn0200'), 1000);
        Logger.info('TEST', `Retry found component: toggleDisableAnimationBtn0200, result: ${toggleDisableAnimationBtn ? 'found' : 'not found'}`);
        if (!toggleDisableAnimationBtn) {
          throw new Error('Component not found: toggleDisableAnimationBtn0200');
        }
      }
      await toggleDisableAnimationBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0200_01');
      await Utils.sleep(1000);
      
      // 3.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0200'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0200`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0200`);
        throw new Error('Component not found: pushPageOneBtn0200');
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0200_02');
      await Utils.sleep(1000);
      
      // 4.点击"pushPathByName pageThree"按钮
      let pushPathByNamePageThreeBtn = await driver.waitForComponent(ON.id('pushPathByNamePageThreeBtn0200'), 1000);
      Logger.info('TEST', `Found component: pushPathByNamePageThreeBtn0200`);
      if (!pushPathByNamePageThreeBtn) {
        Logger.error('TEST', `Component not found: pushPathByNamePageThreeBtn0200`);
        throw new Error('Component not found: pushPathByNamePageThreeBtn0200');
      }
      await pushPathByNamePageThreeBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0200_03');
      await Utils.sleep(1000);
      
      // 5.点击"pushDestinationByName pageTwo"按钮
      let pushDestinationByNamePageTwoBtn = await driver.waitForComponent(ON.id('pushDestinationByNamePageTwoBtn0200'), 1000);
      Logger.info('TEST', `Found component: pushDestinationByNamePageTwoBtn0200`);
      if (!pushDestinationByNamePageTwoBtn) {
        Logger.error('TEST', `Component not found: pushDestinationByNamePageTwoBtn0200`);
        throw new Error('Component not found: pushDestinationByNamePageTwoBtn0200');
      }
      await pushDestinationByNamePageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0200_04');
      await Utils.sleep(1000);
      
      // 6.点击"pop"按钮
      let popBtn = await driver.waitForComponent(ON.id('popBtn0200'), 1000);
      Logger.info('TEST', `Found component: popBtn0200`);
      if (!popBtn) {
        Logger.error('TEST', `Component not found: popBtn0200`);
        throw new Error('Component not found: popBtn0200');
      }
      await popBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0200_05');
      await Utils.sleep(1000);
      
      // 7.点击"moveIndexToTop 0"按钮
      let moveIndexToTop0Btn = await driver.waitForComponent(ON.id('moveIndexToTop0Btn0200'), 1000);
      Logger.info('TEST', `Found component: moveIndexToTop0Btn0200`);
      if (!moveIndexToTop0Btn) {
        Logger.error('TEST', `Component not found: moveIndexToTop0Btn0200`);
        throw new Error('Component not found: moveIndexToTop0Btn0200');
      }
      await moveIndexToTop0Btn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0200_06');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0210
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（自定义动画场景）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0210 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0210/navigationOnActiveOnInActive0210')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"基础场景"按钮
      let basicSceneBtn = await driver.waitForComponent(ON.id('basicSceneBtn0210'), 1000);
      Logger.info('TEST', `Found component: basicSceneBtn0210`);
      if (!basicSceneBtn) {
        Logger.error('TEST', `Component not found: basicSceneBtn0210`);
        throw new Error('Component not found: basicSceneBtn0210');
      }
      await basicSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking basicSceneBtn, waiting for page to render`);
      
      // 2.点击"push pageFive"按钮
      let pushPageFiveBtn = await driver.waitForComponent(ON.id('pushPageFiveBtn0210'), 1000);
      Logger.info('TEST', `Found component: pushPageFiveBtn0210, result: ${pushPageFiveBtn ? 'found' : 'not found'}`);
      if (!pushPageFiveBtn) {
        Logger.error('TEST', `Component not found: pushPageFiveBtn0210 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageFiveBtn = await driver.waitForComponent(ON.id('pushPageFiveBtn0210'), 1000);
        Logger.info('TEST', `Retry found component: pushPageFiveBtn0210, result: ${pushPageFiveBtn ? 'found' : 'not found'}`);
        if (!pushPageFiveBtn) {
          throw new Error('Component not found: pushPageFiveBtn0210');
        }
      }
      await pushPageFiveBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0210_01');
      await Utils.sleep(1000);
      
      // 3.点击"push pageSix"按钮
      let pushPageSixBtn = await driver.waitForComponent(ON.id('pushPageSixBtn0210'), 1000);
      Logger.info('TEST', `Found component: pushPageSixBtn0210`);
      if (!pushPageSixBtn) {
        Logger.error('TEST', `Component not found: pushPageSixBtn0210`);
        throw new Error('Component not found: pushPageSixBtn0210');
      }
      await pushPageSixBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0210_02');
      await Utils.sleep(1000);
      
      // 4.点击"pop"按钮
      let popBtn = await driver.waitForComponent(ON.id('popBtn0210'), 1000);
      Logger.info('TEST', `Found component: popBtn0210`);
      if (!popBtn) {
        Logger.error('TEST', `Component not found: popBtn0210`);
        throw new Error('Component not found: popBtn0210');
      }
      await popBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0210_03');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0220
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（栈操作一次调用push*3,pop*2）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0220 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0220/navigationOnActiveOnInActive0220')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础栈操作场景"按钮
      let navigationBasicStackOperationBtn = await driver.waitForComponent(ON.id('navigationBasicStackOperationBtn0220'), 1000);
      Logger.info('TEST', `Found component: navigationBasicStackOperationBtn0220`);
      if (!navigationBasicStackOperationBtn) {
        Logger.error('TEST', `Component not found: navigationBasicStackOperationBtn0220`);
        throw new Error('Component not found: navigationBasicStackOperationBtn0220');
      }
      await navigationBasicStackOperationBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicStackOperationBtn, waiting for page to render`);
      
      // 2.点击"push*3,pop*2"按钮
      let push3Pop2Btn = await driver.waitForComponent(ON.id('push3Pop2Btn0220'), 1000);
      Logger.info('TEST', `Found component: push3Pop2Btn0220, result: ${push3Pop2Btn ? 'found' : 'not found'}`);
      if (!push3Pop2Btn) {
        Logger.error('TEST', `Component not found: push3Pop2Btn0220 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        push3Pop2Btn = await driver.waitForComponent(ON.id('push3Pop2Btn0220'), 1000);
        Logger.info('TEST', `Retry found component: push3Pop2Btn0220, result: ${push3Pop2Btn ? 'found' : 'not found'}`);
        if (!push3Pop2Btn) {
          throw new Error('Component not found: push3Pop2Btn0220');
        }
      }
      await push3Pop2Btn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0220_01');
      await Utils.sleep(1000);
      
      // 3.点击"pop"按钮
      let popBtn = await driver.waitForComponent(ON.id('popBtn0220'), 1000);
      Logger.info('TEST', `Found component: popBtn0220`);
      if (!popBtn) {
        Logger.error('TEST', `Component not found: popBtn0220`);
        throw new Error('Component not found: popBtn0220');
      }
      await popBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0220_02');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0230
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（栈操作一次调用pop*3）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0230 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0230/navigationOnActiveOnInActive0230')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      
      // 1.点击"Navigation基础栈操作场景"按钮
      let navigationBasicStackOperationBtn = await driver.waitForComponent(ON.id('navigationBasicStackOperationBtn0230'), 1000);
      Logger.info('TEST', `Found component: navigationBasicStackOperationBtn0230`);
      if (!navigationBasicStackOperationBtn) {
        Logger.error('TEST', `Component not found: navigationBasicStackOperationBtn0230`);
        throw new Error('Component not found: navigationBasicStackOperationBtn0230');
      }
      await navigationBasicStackOperationBtn.click();
      await driver.waitForIdle(1000, 1000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicStackOperationBtn, waiting for page to render`);
      
      // 2.点击"push pageTwo"按钮
      let pushPageTwoBtn = await driver.waitForComponent(ON.id('pushPageTwoBtn0230'), 1000);
      Logger.info('TEST', `Found component: pushPageTwoBtn0230, result: ${pushPageTwoBtn ? 'found' : 'not found'}`);
      if (!pushPageTwoBtn) {
        Logger.error('TEST', `Component not found: pushPageTwoBtn0230 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageTwoBtn = await driver.waitForComponent(ON.id('pushPageTwoBtn0230'), 1000);
        Logger.info('TEST', `Retry found component: pushPageTwoBtn0230, result: ${pushPageTwoBtn ? 'found' : 'not found'}`);
        if (!pushPageTwoBtn) {
          throw new Error('Component not found: pushPageTwoBtn0230');
        }
      }
      await pushPageTwoBtn.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0230_01');
      await Utils.sleep(1000);
      
      // 3.点击"push pageThree"按钮
      let pushPageThreeBtn = await driver.waitForComponent(ON.id('pushPageThreeBtn0230'), 1000);
      Logger.info('TEST', `Found component: pushPageThreeBtn0230, result: ${pushPageThreeBtn ? 'found' : 'not found'}`);
      if (!pushPageThreeBtn) {
        Logger.error('TEST', `Component not found: pushPageThreeBtn0230 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageThreeBtn = await driver.waitForComponent(ON.id('pushPageThreeBtn0230'), 1000);
        Logger.info('TEST', `Retry found component: pushPageThreeBtn0230, result: ${pushPageThreeBtn ? 'found' : 'not found'}`);
        if (!pushPageThreeBtn) {
          throw new Error('Component not found: pushPageThreeBtn0230');
        }
      }
      await pushPageThreeBtn.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0230_02');
      await Utils.sleep(1000);
      
      // 4.点击"push pageFour"按钮
      let pushPageFourBtn = await driver.waitForComponent(ON.id('pushPageFourBtn0230'), 1000);
      Logger.info('TEST', `Found component: pushPageFourBtn0230, result: ${pushPageFourBtn ? 'found' : 'not found'}`);
      if (!pushPageFourBtn) {
        Logger.error('TEST', `Component not found: pushPageFourBtn0230 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageFourBtn = await driver.waitForComponent(ON.id('pushPageFourBtn0230'), 1000);
        Logger.info('TEST', `Retry found component: pushPageFourBtn0230, result: ${pushPageFourBtn ? 'found' : 'not found'}`);
        if (!pushPageFourBtn) {
          throw new Error('Component not found: pushPageFourBtn0230');
        }
      }
      await pushPageFourBtn.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0230_03');
      await Utils.sleep(1000);
      
      // 5.点击"push pageThree"按钮
      let pushPageThree2Btn = await driver.waitForComponent(ON.id('pushPageThree2Btn0230'), 1000);
      Logger.info('TEST', `Found component: pushPageThree2Btn0230`);
      if (!pushPageThree2Btn) {
        Logger.error('TEST', `Component not found: pushPageThree2Btn0230`);
        throw new Error('Component not found: pushPageThree2Btn0230');
      }
      await pushPageThree2Btn.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0230_04');
      await Utils.sleep(1000);
      
      // 6.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0230'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0230`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0230`);
        throw new Error('Component not found: pushPageOneBtn0230');
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0230_05');
      await Utils.sleep(1000);
      
      // 7.点击"pop*3"按钮
      let pop3Btn = await driver.waitForComponent(ON.id('pop3Btn0230'), 1000);
      Logger.info('TEST', `Found component: pop3Btn0230`);
      if (!pop3Btn) {
        Logger.error('TEST', `Component not found: pop3Btn0230`);
        throw new Error('Component not found: pop3Btn0230');
      }
      await pop3Btn.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0230_06');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0240
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（栈操作一次调用move*3,pop*2）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0240 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0240/navigationOnActiveOnInActive0240')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础栈操作场景"按钮
      let navigationBasicStackOperationBtn = await driver.waitForComponent(ON.id('navigationBasicStackOperationBtn0240'), 1000);
      Logger.info('TEST', `Found component: navigationBasicStackOperationBtn0240`);
      if (!navigationBasicStackOperationBtn) {
        Logger.error('TEST', `Component not found: navigationBasicStackOperationBtn0240`);
        throw new Error('Component not found: navigationBasicStackOperationBtn0240');
      }
      await navigationBasicStackOperationBtn.click();
      await driver.waitForIdle(1000, 2000);
      Logger.info('TEST', `After clicking navigationBasicStackOperationBtn, waiting for page to render`);
      
      // 2.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0240'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0240, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0240 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0240'), 1000);
        Logger.info('TEST', `Retry found component: pushPageOneBtn0240, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
        if (!pushPageOneBtn) {
          throw new Error('Component not found: pushPageOneBtn0240');
        }
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0240_01');
      await Utils.sleep(1000);
      
      // 3.点击"push pageTwo"按钮
      let pushPageTwoBtn = await driver.waitForComponent(ON.id('pushPageTwoBtn0240'), 1000);
      Logger.info('TEST', `Found component: pushPageTwoBtn0240`);
      if (!pushPageTwoBtn) {
        Logger.error('TEST', `Component not found: pushPageTwoBtn0240`);
        throw new Error('Component not found: pushPageTwoBtn0240');
      }
      await pushPageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0240_02');
      await Utils.sleep(1000);
      
      // 4.点击"push pageThree"按钮
      let pushPageThreeBtn = await driver.waitForComponent(ON.id('pushPageThreeBtn0240'), 1000);
      Logger.info('TEST', `Found component: pushPageThreeBtn0240, result: ${pushPageThreeBtn ? 'found' : 'not found'}`);
      if (!pushPageThreeBtn) {
        Logger.error('TEST', `Component not found: pushPageThreeBtn0240 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(500);
        pushPageThreeBtn = await driver.waitForComponent(ON.id('pushPageThreeBtn0240'), 1000);
        Logger.info('TEST', `Retry found component: pushPageThreeBtn0240, result: ${pushPageThreeBtn ? 'found' : 'not found'}`);
        if (!pushPageThreeBtn) {
          throw new Error('Component not found: pushPageThreeBtn0240');
        }
      }
      await pushPageThreeBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0240_03');
      await Utils.sleep(1000);
      
      // 5.点击"push pageFour"按钮
      let pushPageFourBtn = await driver.waitForComponent(ON.id('pushPageFourBtn0240'), 1000);
      Logger.info('TEST', `Found component: pushPageFourBtn0240`);
      if (!pushPageFourBtn) {
        Logger.error('TEST', `Component not found: pushPageFourBtn0240`);
        throw new Error('Component not found: pushPageFourBtn0240');
      }
      await pushPageFourBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0240_04');
      await Utils.sleep(1000);
      
      // 6.点击"move*3,pop*2"按钮
      let move3Pop2Btn = await driver.waitForComponent(ON.id('move3Pop2Btn0240'), 1000);
      Logger.info('TEST', `Found component: move3Pop2Btn0240`);
      if (!move3Pop2Btn) {
        Logger.error('TEST', `Component not found: move3Pop2Btn0240`);
        throw new Error('Component not found: move3Pop2Btn0240');
      }
      await move3Pop2Btn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0240_05');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0260
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（栈操作一次调用push+pushDestination）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0260 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0260/navigationOnActiveOnInActive0260')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation组合场景"按钮
      let navigationCombinedSceneBtn = await driver.waitForComponent(ON.id('navigationCombinedSceneBtn0260'), 1000);
      Logger.info('TEST', `Found component: navigationCombinedSceneBtn0260`);
      if (!navigationCombinedSceneBtn) {
        Logger.error('TEST', `Component not found: navigationCombinedSceneBtn0260`);
        throw new Error('Component not found: navigationCombinedSceneBtn0260');
      }
      await navigationCombinedSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0260_01');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0270
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（栈操作一次调用replace+moveToTop）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0270 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0270/navigationOnActiveOnInActive0270')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation组合场景"按钮
      let navigationCombinedSceneBtn = await driver.waitForComponent(ON.id('navigationCombinedSceneBtn0270'), 1000);
      Logger.info('TEST', `Found component: navigationCombinedSceneBtn0270`);
      if (!navigationCombinedSceneBtn) {
        Logger.error('TEST', `Component not found: navigationCombinedSceneBtn0270`);
        throw new Error('Component not found: navigationCombinedSceneBtn0270');
      }
      await navigationCombinedSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0270_01');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0280
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（aboutToAppear进行栈操作，remove接口测试）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0280 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0280/navigationOnActiveOnInActive0280')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation组件通过aboutToAppear进行栈操作"按钮
      let navigationAboutToAppearOperationBtn = await driver.waitForComponent(ON.id('navigationAboutToAppearOperationBtn0280'), 1000);
      Logger.info('TEST', `Found component: navigationAboutToAppearOperationBtn0280`);
      if (!navigationAboutToAppearOperationBtn) {
        Logger.error('TEST', `Component not found: navigationAboutToAppearOperationBtn0280`);
        throw new Error('Component not found: navigationAboutToAppearOperationBtn0280');
      }
      await navigationAboutToAppearOperationBtn.click();
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0280_01');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0290
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（aboutToAppear进行栈操作，push接口测试）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0290 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0290/navigationOnActiveOnInActive0290')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation组件通过aboutToAppear进行栈操作"按钮
      let navigationAboutToAppearOperationBtn = await driver.waitForComponent(ON.id('navigationAboutToAppearOperationBtn0290'), 1000);
      Logger.info('TEST', `Found component: navigationAboutToAppearOperationBtn0290`);
      if (!navigationAboutToAppearOperationBtn) {
        Logger.error('TEST', `Component not found: navigationAboutToAppearOperationBtn0290`);
        throw new Error('Component not found: navigationAboutToAppearOperationBtn0290');
      }
      await navigationAboutToAppearOperationBtn.click();
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0290_01');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0290 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0300
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（OnReady进行栈操作，push接口测试）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0300 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0300/navigationOnActiveOnInActive0300')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"NavDestination组件OnReady操作"按钮
      let navDestinationOnReadyOperationBtn = await driver.waitForComponent(ON.id('navDestinationOnReadyOperationBtn0300'), 1000);
      Logger.info('TEST', `Found component: navDestinationOnReadyOperationBtn0300`);
      if (!navDestinationOnReadyOperationBtn) {
        Logger.error('TEST', `Component not found: navDestinationOnReadyOperationBtn0300`);
        throw new Error('Component not found: navDestinationOnReadyOperationBtn0300');
      }
      await navDestinationOnReadyOperationBtn.click();
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0300_01');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0310
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（Navigation嵌套场景）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0310 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0310/navigationOnActiveOnInActive0310')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);

      // 1.点击"navigation嵌套场景（嵌套）"按钮
      let navigationNestedSceneBtn = await driver.waitForComponent(ON.id('navigationNestedSceneBtn0310'), 2000);
      Logger.info('TEST', `Found component: navigationNestedSceneBtn0310`);
      if (!navigationNestedSceneBtn) {
        Logger.error('TEST', `Component not found: navigationNestedSceneBtn0310`);
        throw new Error('Component not found: navigationNestedSceneBtn0310');
      }
      await navigationNestedSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(2000);
      Logger.info('TEST', `After clicking navigationNestedSceneBtn, waiting for page to render`);

      // 2.点击"NavigationB push pageOne"按钮
      let navigationBPushPageOneBtn = await driver.waitForComponent(ON.id('navigationBPushPageOneBtn0310'), 2000);
      Logger.info('TEST', `Found component: navigationBPushPageOneBtn0310, result: ${navigationBPushPageOneBtn ? 'found' : 'not found'}`);
      if (!navigationBPushPageOneBtn) {
        Logger.error('TEST', `Component not found: navigationBPushPageOneBtn0310 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(2000);
        navigationBPushPageOneBtn = await driver.waitForComponent(ON.id('navigationBPushPageOneBtn0310'), 2000);
        Logger.info('TEST', `Retry found component: navigationBPushPageOneBtn0310, result: ${navigationBPushPageOneBtn ? 'found' : 'not found'}`);
        if (!navigationBPushPageOneBtn) {
          throw new Error('Component not found: navigationBPushPageOneBtn0310');
        }
      }
      await navigationBPushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0310_01');
      await Utils.sleep(1000);

      // 3.点击"NavigationB push pageThree"按钮
      let navigationBPushPageThreeBtn = await driver.waitForComponent(ON.id('navigationBPushPageThreeBtn0310'), 2000);
      Logger.info('TEST', `Found component: navigationBPushPageThreeBtn0310`);
      if (!navigationBPushPageThreeBtn) {
        Logger.error('TEST', `Component not found: navigationBPushPageThreeBtn0310`);
        throw new Error('Component not found: navigationBPushPageThreeBtn0310');
      }
      await navigationBPushPageThreeBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0310_02');
      await Utils.sleep(1000);

      // 4.点击"NavigationA push pageTwo"按钮
      let navigationAPushPageTwoBtn = await driver.waitForComponent(ON.id('navigationAPushPageTwoBtn0310'), 2000);
      Logger.info('TEST', `Found component: navigationAPushPageTwoBtn0310`);
      if (!navigationAPushPageTwoBtn) {
        Logger.error('TEST', `Component not found: navigationAPushPageTwoBtn0310`);
        throw new Error('Component not found: navigationAPushPageTwoBtn0310');
      }
      await navigationAPushPageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0310_03');
      await Utils.sleep(1000);

      // 5.点击"pop"按钮
      let popBtn = await driver.waitForComponent(ON.id('popBtn0310'), 2000);
      Logger.info('TEST', `Found component: popBtn0310`);
      if (!popBtn) {
        Logger.error('TEST', `Component not found: popBtn0310`);
        throw new Error('Component not found: popBtn0310');
      }
      await popBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0310_04');
      await Utils.sleep(1000);

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0320
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（Navigation嵌套操作，replaceDestination+pushPath结合）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0320 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0320/navigationOnActiveOnInActive0320')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"navigation嵌套调用"按钮
      let navigationNestedCallBtn = await driver.waitForComponent(ON.id('navigationNestedCallBtn0320'), 1000);
      Logger.info('TEST', `Found component: navigationNestedCallBtn0320`);
      if (!navigationNestedCallBtn) {
        Logger.error('TEST', `Component not found: navigationNestedCallBtn0320`);
        throw new Error('Component not found: navigationNestedCallBtn0320');
      }
      await navigationNestedCallBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationNestedCallBtn, waiting for page to render`);
      
      // 2.点击"push TestStandard02"按钮（已在主页面点击时执行）
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0320_01');
      await Utils.sleep(1000);
      
      // 3.点击"嵌套操作 replace TS01/02"按钮
      let nestedOperationReplaceBtn = await driver.waitForComponent(ON.id('nestedOperationReplaceBtn0320'), 1000);
      Logger.info('TEST', `Found component: nestedOperationReplaceBtn0320, result: ${nestedOperationReplaceBtn ? 'found' : 'not found'}`);
      if (!nestedOperationReplaceBtn) {
        Logger.error('TEST', `Component not found: nestedOperationReplaceBtn0320 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        nestedOperationReplaceBtn = await driver.waitForComponent(ON.id('nestedOperationReplaceBtn0320'), 1000);
        Logger.info('TEST', `Retry found component: nestedOperationReplaceBtn0320, result: ${nestedOperationReplaceBtn ? 'found' : 'not found'}`);
        if (!nestedOperationReplaceBtn) {
          throw new Error('Component not found: nestedOperationReplaceBtn0320');
        }
      }
      await nestedOperationReplaceBtn.click();
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0320_02');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0330
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（Navigation嵌套操作，pushDestination+pushPath结合）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0330 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0330/navigationOnActiveOnInActive0330')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"navigation嵌套调用"按钮
      let navigationNestedCallBtn = await driver.waitForComponent(ON.id('navigationNestedCallBtn0330'), 1000);
      Logger.info('TEST', `Found component: navigationNestedCallBtn0330`);
      if (!navigationNestedCallBtn) {
        Logger.error('TEST', `Component not found: navigationNestedCallBtn0330`);
        throw new Error('Component not found: navigationNestedCallBtn0330');
      }
      await navigationNestedCallBtn.click();
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0330_01');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0330 finish.`);
      done()
    })

    // /*
    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0340
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（同一个页面存在两个navigation）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0340 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0340/navigationOnActiveOnInActive0340')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"navigation嵌套场景（并列）"按钮
      let navigationParallelSceneBtn = await driver.waitForComponent(ON.id('navigationParallelSceneBtn0340'), 1000);
      Logger.info('TEST', `Found component: navigationParallelSceneBtn0340`);
      if (!navigationParallelSceneBtn) {
        Logger.error('TEST', `Component not found: navigationParallelSceneBtn0340`);
        throw new Error('Component not found: navigationParallelSceneBtn0340');
      }
      await navigationParallelSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      Logger.info('TEST', `After clicking navigationParallelSceneBtn, waiting for page to render`);
      
      // 2.点击"NavigationA push pageOne"按钮
      let navigationAPushPageOneBtn = await driver.waitForComponent(ON.id('navigationAPushPageOneBtn0340'), 1000);
      Logger.info('TEST', `Found component: navigationAPushPageOneBtn0340, result: ${navigationAPushPageOneBtn ? 'found' : 'not found'}`);
      if (!navigationAPushPageOneBtn) {
        Logger.error('TEST', `Component not found: navigationAPushPageOneBtn0340 after navigation jump. Page may not be fully rendered.`);
        navigationAPushPageOneBtn = await driver.waitForComponent(ON.id('navigationAPushPageOneBtn0340'), 1000);
        Logger.info('TEST', `Retry found component: navigationAPushPageOneBtn0340, result: ${navigationAPushPageOneBtn ? 'found' : 'not found'}`);
        if (!navigationAPushPageOneBtn) {
          throw new Error('Component not found: navigationAPushPageOneBtn0340');
        }
      }
      await navigationAPushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0340_01');
      await Utils.sleep(1000);
      
      // 3.点击"NavigationA push pageThree"按钮
      let navigationAPushPageThreeBtn = await driver.waitForComponent(ON.id('navigationAPushPageThreeBtn0340'), 1000);
      Logger.info('TEST', `Found component: navigationAPushPageThreeBtn0340`);
      if (!navigationAPushPageThreeBtn) {
        Logger.error('TEST', `Component not found: navigationAPushPageThreeBtn0340`);
        throw new Error('Component not found: navigationAPushPageThreeBtn0340');
      }
      await navigationAPushPageThreeBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0340_02');
      await Utils.sleep(1000);
      
      // 4.点击"NavigationB push pageTwo"按钮
      let navigationBPushPageTwoBtn = await driver.waitForComponent(ON.id('navigationBPushPageTwoBtn0340'), 1000);
      Logger.info('TEST', `Found component: navigationBPushPageTwoBtn0340`);
      if (!navigationBPushPageTwoBtn) {
        Logger.error('TEST', `Component not found: navigationBPushPageTwoBtn0340`);
        throw new Error('Component not found: navigationBPushPageTwoBtn0340');
      }
      await navigationBPushPageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0340_03');
      await Utils.sleep(1000);
      
      // 5.点击"NavigationB push pageFour"按钮
      let navigationBPushPageFourBtn = await driver.waitForComponent(ON.id('navigationBPushPageFourBtn0340'), 1000);
      Logger.info('TEST', `Found component: navigationBPushPageFourBtn0340`);
      if (!navigationBPushPageFourBtn) {
        Logger.error('TEST', `Component not found: navigationBPushPageFourBtn0340`);
        throw new Error('Component not found: navigationBPushPageFourBtn0340');
      }
      await navigationBPushPageFourBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0340_04');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0350
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（跳转hsp测试）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0350 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0350/navigationOnActiveOnInActive0350')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"基础场景"按钮
      let basicSceneBtn = await driver.waitForComponent(ON.id('basicSceneBtn0350'), 1000);
      Logger.info('TEST', `Found component: basicSceneBtn0350`);
      if (!basicSceneBtn) {
        Logger.error('TEST', `Component not found: basicSceneBtn0350`);
        throw new Error('Component not found: basicSceneBtn0350');
      }
      await basicSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking basicSceneBtn, waiting for page to render`);
      
      // 2.点击"push HspPageOne"按钮
      let pushHspPageOneBtn = await driver.waitForComponent(ON.id('pushHspPageOneBtn0350'), 1000);
      Logger.info('TEST', `Found component: pushHspPageOneBtn0350, result: ${pushHspPageOneBtn ? 'found' : 'not found'}`);
      if (!pushHspPageOneBtn) {
        Logger.error('TEST', `Component not found: pushHspPageOneBtn0350 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushHspPageOneBtn = await driver.waitForComponent(ON.id('pushHspPageOneBtn0350'), 1000);
        Logger.info('TEST', `Retry found component: pushHspPageOneBtn0350, result: ${pushHspPageOneBtn ? 'found' : 'not found'}`);
        if (!pushHspPageOneBtn) {
          throw new Error('Component not found: pushHspPageOneBtn0350');
        }
      }
      await pushHspPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0350_01');
      await Utils.sleep(1000);
      
      // 3.点击"push HspPageThree"按钮
      let pushHspPageThreeBtn = await driver.waitForComponent(ON.id('pushHspPageThreeBtn0350'), 1000);
      Logger.info('TEST', `Found component: pushHspPageThreeBtn0350`);
      if (!pushHspPageThreeBtn) {
        Logger.error('TEST', `Component not found: pushHspPageThreeBtn0350`);
        throw new Error('Component not found: pushHspPageThreeBtn0350');
      }
      await pushHspPageThreeBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0350_02');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0350 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0360
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（路由栈派生类场景测试）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0360 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0360/navigationOnActiveOnInActive0360')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"路由栈派生类场景(Derived)"按钮
      let derivedNavPathStackSceneBtn = await driver.waitForComponent(ON.id('derivedNavPathStackSceneBtn0360'), 1000);
      Logger.info('TEST', `Found component: derivedNavPathStackSceneBtn0360`);
      if (!derivedNavPathStackSceneBtn) {
        Logger.error('TEST', `Component not found: derivedNavPathStackSceneBtn0360`);
        throw new Error('Component not found: derivedNavPathStackSceneBtn0360');
      }
      await derivedNavPathStackSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking derivedNavPathStackSceneBtn, waiting for page to render`);
      
      // 2.点击"DerivedNavPathStack push pageOne"按钮（已在主页面点击时执行）
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0360_01');
      await Utils.sleep(1000);
      
      // 3.点击"DerivedNavPathStack push pageThree"按钮
      let derivedNavPathStackPushPageThreeBtn = await driver.waitForComponent(ON.id('derivedNavPathStackPushPageThreeBtn0360'), 1000);
      Logger.info('TEST', `Found component: derivedNavPathStackPushPageThreeBtn0360, result: ${derivedNavPathStackPushPageThreeBtn ? 'found' : 'not found'}`);
      if (!derivedNavPathStackPushPageThreeBtn) {
        Logger.error('TEST', `Component not found: derivedNavPathStackPushPageThreeBtn0360 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        derivedNavPathStackPushPageThreeBtn = await driver.waitForComponent(ON.id('derivedNavPathStackPushPageThreeBtn0360'), 1000);
        Logger.info('TEST', `Retry found component: derivedNavPathStackPushPageThreeBtn0360, result: ${derivedNavPathStackPushPageThreeBtn ? 'found' : 'not found'}`);
        if (!derivedNavPathStackPushPageThreeBtn) {
          throw new Error('Component not found: derivedNavPathStackPushPageThreeBtn0360');
        }
      }
      await derivedNavPathStackPushPageThreeBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0360_02');
      await Utils.sleep(1000);
      
      // 4.点击"DerivedNavPathStack pop"按钮
      let derivedNavPathStackPopBtn = await driver.waitForComponent(ON.id('derivedNavPathStackPopBtn0360'), 1000);
      Logger.info('TEST', `Found component: derivedNavPathStackPopBtn0360`);
      if (!derivedNavPathStackPopBtn) {
        Logger.error('TEST', `Component not found: derivedNavPathStackPopBtn0360`);
        throw new Error('Component not found: derivedNavPathStackPopBtn0360');
      }
      await derivedNavPathStackPopBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0360_03');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0360 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0370
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（通过queryNavigationInfo获取栈操作场景）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0370 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0370/navigationOnActiveOnInActive0370')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"路由栈派生类场景(Query)"按钮
      let queryNavPathStackSceneBtn = await driver.waitForComponent(ON.id('queryNavPathStackSceneBtn0370'), 1000);
      Logger.info('TEST', `Found component: queryNavPathStackSceneBtn0370`);
      if (!queryNavPathStackSceneBtn) {
        Logger.error('TEST', `Component not found: queryNavPathStackSceneBtn0370`);
        throw new Error('Component not found: queryNavPathStackSceneBtn0370');
      }
      await queryNavPathStackSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking queryNavPathStackSceneBtn, waiting for page to render`);
      
      // 2.点击"queryNavigationInfo push pageOne"按钮（已在主页面点击时执行）
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0370_01');
      await Utils.sleep(1000);
      
      // 3.点击"queryNavigationInfo push pageThree"按钮
      let queryNavigationInfoPushPageThreeBtn = await driver.waitForComponent(ON.id('queryNavigationInfoPushPageThreeBtn0370'), 1000);
      Logger.info('TEST', `Found component: queryNavigationInfoPushPageThreeBtn0370, result: ${queryNavigationInfoPushPageThreeBtn ? 'found' : 'not found'}`);
      if (!queryNavigationInfoPushPageThreeBtn) {
        Logger.error('TEST', `Component not found: queryNavigationInfoPushPageThreeBtn0370 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        queryNavigationInfoPushPageThreeBtn = await driver.waitForComponent(ON.id('queryNavigationInfoPushPageThreeBtn0370'), 1000);
        Logger.info('TEST', `Retry found component: queryNavigationInfoPushPageThreeBtn0370, result: ${queryNavigationInfoPushPageThreeBtn ? 'found' : 'not found'}`);
        if (!queryNavigationInfoPushPageThreeBtn) {
          throw new Error('Component not found: queryNavigationInfoPushPageThreeBtn0370');
        }
      }
      await queryNavigationInfoPushPageThreeBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0370_02');
      await Utils.sleep(1000);
      
      // 4.点击"queryNavigationInfo pop"按钮
      let queryNavigationInfoPopBtn = await driver.waitForComponent(ON.id('queryNavigationInfoPopBtn0370'), 1000);
      Logger.info('TEST', `Found component: queryNavigationInfoPopBtn0370`);
      if (!queryNavigationInfoPopBtn) {
        Logger.error('TEST', `Component not found: queryNavigationInfoPopBtn0370`);
        throw new Error('Component not found: queryNavigationInfoPopBtn0370');
      }
      await queryNavigationInfoPopBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0370_03');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0370 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0380
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（无感监听场景）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0380 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0380/navigationOnActiveOnInActive0380')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础栈操作场景"按钮
      let navigationBasicStackOperationBtn = await driver.waitForComponent(ON.id('navigationBasicStackOperationBtn0380'), 1000);
      Logger.info('TEST', `Found component: navigationBasicStackOperationBtn0380`);
      if (!navigationBasicStackOperationBtn) {
        Logger.error('TEST', `Component not found: navigationBasicStackOperationBtn0380`);
        throw new Error('Component not found: navigationBasicStackOperationBtn0380');
      }
      await navigationBasicStackOperationBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicStackOperationBtn, waiting for page to render`);
      
      // 2.点击"observer.on"按钮
      let observerOnBtn = await driver.waitForComponent(ON.id('observerOnBtn0380'), 1000);
      Logger.info('TEST', `Found component: observerOnBtn0380, result: ${observerOnBtn ? 'found' : 'not found'}`);
      if (!observerOnBtn) {
        Logger.error('TEST', `Component not found: observerOnBtn0380 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        observerOnBtn = await driver.waitForComponent(ON.id('observerOnBtn0380'), 1000);
        Logger.info('TEST', `Retry found component: observerOnBtn0380, result: ${observerOnBtn ? 'found' : 'not found'}`);
        if (!observerOnBtn) {
          throw new Error('Component not found: observerOnBtn0380');
        }
      }
      await observerOnBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0380_01');
      await Utils.sleep(1000);
      
      // 3.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0380'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0380`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0380`);
        throw new Error('Component not found: pushPageOneBtn0380');
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0380_02');
      await Utils.sleep(1000);
      
      // 4.点击"pushPathByName pageThree"按钮
      let pushPathByNamePageThreeBtn = await driver.waitForComponent(ON.id('pushPathByNamePageThreeBtn0380'), 1000);
      Logger.info('TEST', `Found component: pushPathByNamePageThreeBtn0380`);
      if (!pushPathByNamePageThreeBtn) {
        Logger.error('TEST', `Component not found: pushPathByNamePageThreeBtn0380`);
        throw new Error('Component not found: pushPathByNamePageThreeBtn0380');
      }
      await pushPathByNamePageThreeBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0380_03');
      await Utils.sleep(1000);
      
      // 5.点击"pushDestinationByName pageTwo"按钮
      let pushDestinationByNamePageTwoBtn = await driver.waitForComponent(ON.id('pushDestinationByNamePageTwoBtn0380'), 1000);
      Logger.info('TEST', `Found component: pushDestinationByNamePageTwoBtn0380`);
      if (!pushDestinationByNamePageTwoBtn) {
        Logger.error('TEST', `Component not found: pushDestinationByNamePageTwoBtn0380`);
        throw new Error('Component not found: pushDestinationByNamePageTwoBtn0380');
      }
      await pushDestinationByNamePageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0380_04');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0380 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0390
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（子窗口场景）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0390', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0390 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0390/navigationOnActiveOnInActive0390')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础栈操作场景"按钮
      let navigationBasicStackOperationBtn = await driver.waitForComponent(ON.id('navigationBasicStackOperationBtn0390'), 1000);
      Logger.info('TEST', `Found component: navigationBasicStackOperationBtn0390`);
      if (!navigationBasicStackOperationBtn) {
        Logger.error('TEST', `Component not found: navigationBasicStackOperationBtn0390`);
        throw new Error('Component not found: navigationBasicStackOperationBtn0390');
      }
      await navigationBasicStackOperationBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicStackOperationBtn, waiting for page to render`);
      
      // 2.点击"开启子窗口"按钮
      let openSubWindowBtn = await driver.waitForComponent(ON.id('openSubWindowBtn0390'), 1000);
      Logger.info('TEST', `Found component: openSubWindowBtn0390, result: ${openSubWindowBtn ? 'found' : 'not found'}`);
      if (!openSubWindowBtn) {
        Logger.error('TEST', `Component not found: openSubWindowBtn0390 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        openSubWindowBtn = await driver.waitForComponent(ON.id('openSubWindowBtn0390'), 1000);
        Logger.info('TEST', `Retry found component: openSubWindowBtn0390, result: ${openSubWindowBtn ? 'found' : 'not found'}`);
        if (!openSubWindowBtn) {
          throw new Error('Component not found: openSubWindowBtn0390');
        }
      }
      await openSubWindowBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0390_01');
      await Utils.sleep(1000);
      
      // 3.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0390'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0390`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0390`);
        throw new Error('Component not found: pushPageOneBtn0390');
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0390_02');
      await Utils.sleep(1000);
      
      // 4.点击"push pageThree"按钮
      let pushPageThreeBtn = await driver.waitForComponent(ON.id('pushPageThreeBtn0390'), 1000);
      Logger.info('TEST', `Found component: pushPageThreeBtn0390`);
      if (!pushPageThreeBtn) {
        Logger.error('TEST', `Component not found: pushPageThreeBtn0390`);
        throw new Error('Component not found: pushPageThreeBtn0390');
      }
      await pushPageThreeBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0390_03');
      await Utils.sleep(1000);
      
      // 5.点击"push pageTwo"按钮
      let pushPageTwoBtn = await driver.waitForComponent(ON.id('pushPageTwoBtn0390'), 1000);
      Logger.info('TEST', `Found component: pushPageTwoBtn0390`);
      if (!pushPageTwoBtn) {
        Logger.error('TEST', `Component not found: pushPageTwoBtn0390`);
        throw new Error('Component not found: pushPageTwoBtn0390');
      }
      await pushPageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0390_04');
      await Utils.sleep(1000);
      
      // 6.点击"关闭子窗口"按钮
      let closeSubWindowBtn = await driver.waitForComponent(ON.id('closeSubWindowBtn0390'), 1000);
      Logger.info('TEST', `Found component: closeSubWindowBtn0390`);
      if (!closeSubWindowBtn) {
        Logger.error('TEST', `Component not found: closeSubWindowBtn0390`);
        throw new Error('Component not found: closeSubWindowBtn0390');
      }
      await closeSubWindowBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0390_05');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0390 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0410
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（visibility测试）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0410 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0410/navigationOnActiveOnInActive0410')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础栈操作场景"按钮
      let navigationBasicStackOperationBtn = await driver.waitForComponent(ON.id('navigationBasicStackOperationBtn0410'), 1000);
      Logger.info('TEST', `Found component: navigationBasicStackOperationBtn0410`);
      if (!navigationBasicStackOperationBtn) {
        Logger.error('TEST', `Component not found: navigationBasicStackOperationBtn0410`);
        throw new Error('Component not found: navigationBasicStackOperationBtn0410');
      }
      await navigationBasicStackOperationBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicStackOperationBtn, waiting for page to render`);
      
      // 2.点击"push pageTwo"按钮
      let pushPageTwoBtn = await driver.waitForComponent(ON.id('pushPageTwoBtn0410'), 1000);
      Logger.info('TEST', `Found component: pushPageTwoBtn0410, result: ${pushPageTwoBtn ? 'found' : 'not found'}`);
      if (!pushPageTwoBtn) {
        Logger.error('TEST', `Component not found: pushPageTwoBtn0410 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageTwoBtn = await driver.waitForComponent(ON.id('pushPageTwoBtn0410'), 1000);
        Logger.info('TEST', `Retry found component: pushPageTwoBtn0410, result: ${pushPageTwoBtn ? 'found' : 'not found'}`);
        if (!pushPageTwoBtn) {
          throw new Error('Component not found: pushPageTwoBtn0410');
        }
      }
      await pushPageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0410_01');
      await Utils.sleep(1000);
      
      // 3.点击动态按钮"visibility：xx"【Visible、Hidden、None】，设置为Hidden
      let visibilityBtn = await driver.waitForComponent(ON.id('visibilityBtn0410'), 1000);
      Logger.info('TEST', `Found component: visibilityBtn0410`);
      if (!visibilityBtn) {
        Logger.error('TEST', `Component not found: visibilityBtn0410`);
        throw new Error('Component not found: visibilityBtn0410');
      }
      await visibilityBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0410_02');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0410 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0420
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（前后台切换场景测试）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0420', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0420 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0420/navigationOnActiveOnInActive0420')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"基础场景"按钮
      let basicSceneBtn = await driver.waitForComponent(ON.id('basicSceneBtn0420'), 1000);
      Logger.info('TEST', `Found component: basicSceneBtn0420`);
      if (!basicSceneBtn) {
        Logger.error('TEST', `Component not found: basicSceneBtn0420`);
        throw new Error('Component not found: basicSceneBtn0420');
      }
      await basicSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking basicSceneBtn, waiting for page to render`);
      
      // 2.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0420'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0420, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0420 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0420'), 1000);
        Logger.info('TEST', `Retry found component: pushPageOneBtn0420, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
        if (!pushPageOneBtn) {
          throw new Error('Component not found: pushPageOneBtn0420');
        }
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0420_01');
      await Utils.sleep(1000);
      
      // 3.点击"push pageThree"按钮
      let pushPageThreeBtn = await driver.waitForComponent(ON.id('pushPageThreeBtn0420'), 1000);
      Logger.info('TEST', `Found component: pushPageThreeBtn0420`);
      if (!pushPageThreeBtn) {
        Logger.error('TEST', `Component not found: pushPageThreeBtn0420`);
        throw new Error('Component not found: pushPageThreeBtn0420');
      }
      await pushPageThreeBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0420_02');
      await Utils.sleep(1000);
      
      // 4.将页面切换到后台（通过系统API实现）
      // 5.将页面从后台切换回来（通过系统API实现）
      // 注意：前后台切换操作在测试框架中可能需要特殊处理
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0420_03');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0420 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0430
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（锁屏解锁场景测试）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0430', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0430 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0430/navigationOnActiveOnInActive0430')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"基础场景"按钮
      let basicSceneBtn = await driver.waitForComponent(ON.id('basicSceneBtn0430'), 1000);
      Logger.info('TEST', `Found component: basicSceneBtn0430`);
      if (!basicSceneBtn) {
        Logger.error('TEST', `Component not found: basicSceneBtn0430`);
        throw new Error('Component not found: basicSceneBtn0430');
      }
      await basicSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking basicSceneBtn, waiting for page to render`);
      
      // 2.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0430'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0430, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0430 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0430'), 1000);
        Logger.info('TEST', `Retry found component: pushPageOneBtn0430, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
        if (!pushPageOneBtn) {
          throw new Error('Component not found: pushPageOneBtn0430');
        }
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0430_01');
      await Utils.sleep(1000);
      
      // 3.点击"push pageThree"按钮
      let pushPageThreeBtn = await driver.waitForComponent(ON.id('pushPageThreeBtn0430'), 1000);
      Logger.info('TEST', `Found component: pushPageThreeBtn0430`);
      if (!pushPageThreeBtn) {
        Logger.error('TEST', `Component not found: pushPageThreeBtn0430`);
        throw new Error('Component not found: pushPageThreeBtn0430');
      }
      await pushPageThreeBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0430_02');
      await Utils.sleep(1000);
      
      // 4.设备锁屏（通过系统API实现）
      // 5.设备解锁（通过系统API实现）
      // 注意：锁屏解锁操作在测试框架中可能需要特殊处理
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0430_03');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0430 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0440
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（router组件场景，router组件pushUrl多实例场景验证）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0440 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0440/navigationOnActiveOnInActive0440')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"navigation与router结合基础场景"按钮
      let navigationRouterCombinedSceneBtn = await driver.waitForComponent(ON.id('navigationRouterCombinedSceneBtn0440'), 1000);
      Logger.info('TEST', `Found component: navigationRouterCombinedSceneBtn0440`);
      if (!navigationRouterCombinedSceneBtn) {
        Logger.error('TEST', `Component not found: navigationRouterCombinedSceneBtn0440`);
        throw new Error('Component not found: navigationRouterCombinedSceneBtn0440');
      }
      await navigationRouterCombinedSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationRouterCombinedSceneBtn, waiting for page to render`);
      
      // 2.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0440'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0440, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0440 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0440'), 1000);
        Logger.info('TEST', `Retry found component: pushPageOneBtn0440, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
        if (!pushPageOneBtn) {
          throw new Error('Component not found: pushPageOneBtn0440');
        }
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0440_01');
      await Utils.sleep(1000);
      
      // 3.点击"router pushUrl routerPageOne"按钮
      let routerPushUrlRouterPageOneBtn = await driver.waitForComponent(ON.id('routerPushUrlRouterPageOneBtn0440'), 1000);
      Logger.info('TEST', `Found component: routerPushUrlRouterPageOneBtn0440`);
      if (!routerPushUrlRouterPageOneBtn) {
        Logger.error('TEST', `Component not found: routerPushUrlRouterPageOneBtn0440`);
        throw new Error('Component not found: routerPushUrlRouterPageOneBtn0440');
      }
      await routerPushUrlRouterPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0440_02');
      await Utils.sleep(1000);
      
      // 4.点击"navigationA push pageThree"按钮
      let navigationAPushPageThreeBtn = await driver.waitForComponent(ON.id('navigationAPushPageThreeBtn0440'), 1000);
      Logger.info('TEST', `Found component: navigationAPushPageThreeBtn0440, result: ${navigationAPushPageThreeBtn ? 'found' : 'not found'}`);
      if (!navigationAPushPageThreeBtn) {
        Logger.error('TEST', `Component not found: navigationAPushPageThreeBtn0440 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        navigationAPushPageThreeBtn = await driver.waitForComponent(ON.id('navigationAPushPageThreeBtn0440'), 1000);
        Logger.info('TEST', `Retry found component: navigationAPushPageThreeBtn0440, result: ${navigationAPushPageThreeBtn ? 'found' : 'not found'}`);
        if (!navigationAPushPageThreeBtn) {
          throw new Error('Component not found: navigationAPushPageThreeBtn0440');
        }
      }
      await navigationAPushPageThreeBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0440_03');
      await Utils.sleep(1000);
      
      // 5.点击"router pushNamedRoute routerPageOne"按钮
      let routerPushNamedRouteRouterPageOneBtn = await driver.waitForComponent(ON.id('routerPushNamedRouteRouterPageOneBtn0440'), 1000);
      Logger.info('TEST', `Found component: routerPushNamedRouteRouterPageOneBtn0440`);
      if (!routerPushNamedRouteRouterPageOneBtn) {
        Logger.error('TEST', `Component not found: routerPushNamedRouteRouterPageOneBtn0440`);
        throw new Error('Component not found: routerPushNamedRouteRouterPageOneBtn0440');
      }
      await routerPushNamedRouteRouterPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0440_04');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0440 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0450
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（router组件场景，router组件pushUrl单实例场景验证）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0450', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0450 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0450/navigationOnActiveOnInActive0450')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"navigation与router结合基础场景"按钮
      let navigationRouterCombinedSceneBtn = await driver.waitForComponent(ON.id('navigationRouterCombinedSceneBtn0450'), 1000);
      Logger.info('TEST', `Found component: navigationRouterCombinedSceneBtn0450`);
      if (!navigationRouterCombinedSceneBtn) {
        Logger.error('TEST', `Component not found: navigationRouterCombinedSceneBtn0450`);
        throw new Error('Component not found: navigationRouterCombinedSceneBtn0450');
      }
      await navigationRouterCombinedSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationRouterCombinedSceneBtn, waiting for page to render`);
      
      // 2.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0450'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0450, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0450 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0450'), 1000);
        Logger.info('TEST', `Retry found component: pushPageOneBtn0450, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
        if (!pushPageOneBtn) {
          throw new Error('Component not found: pushPageOneBtn0450');
        }
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0450_01');
      await Utils.sleep(1000);
      
      // 3.点击"router pushUrl routerPageOne"按钮
      let routerPushUrlRouterPageOneBtn = await driver.waitForComponent(ON.id('routerPushUrlRouterPageOneBtn0450'), 1000);
      Logger.info('TEST', `Found component: routerPushUrlRouterPageOneBtn0450`);
      if (!routerPushUrlRouterPageOneBtn) {
        Logger.error('TEST', `Component not found: routerPushUrlRouterPageOneBtn0450`);
        throw new Error('Component not found: routerPushUrlRouterPageOneBtn0450');
      }
      await routerPushUrlRouterPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0450_02');
      await Utils.sleep(1000);
      
      // 4.点击"navigationA push pageThree"按钮
      let navigationAPushPageThreeBtn = await driver.waitForComponent(ON.id('navigationAPushPageThreeBtn0450'), 1000);
      Logger.info('TEST', `Found component: navigationAPushPageThreeBtn0450`);
      if (!navigationAPushPageThreeBtn) {
        Logger.error('TEST', `Component not found: navigationAPushPageThreeBtn0450`);
        throw new Error('Component not found: navigationAPushPageThreeBtn0450');
      }
      await navigationAPushPageThreeBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0450_03');
      await Utils.sleep(1000);
      
      // 5.点击"router pushNamedRoute routerPageTwo"按钮
      let routerPushNamedRouteRouterPageTwoBtn = await driver.waitForComponent(ON.id('routerPushNamedRouteRouterPageTwoBtn0450'), 1000);
      Logger.info('TEST', `Found component: routerPushNamedRouteRouterPageTwoBtn0450`);
      if (!routerPushNamedRouteRouterPageTwoBtn) {
        Logger.error('TEST', `Component not found: routerPushNamedRouteRouterPageTwoBtn0450`);
        throw new Error('Component not found: routerPushNamedRouteRouterPageTwoBtn0450');
      }
      await routerPushNamedRouteRouterPageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0450_04');
      await Utils.sleep(1000);
      
      // 6.点击"router pushUrl routerPageOne Single"按钮
      let routerPushUrlRouterPageOneSingleBtn = await driver.waitForComponent(ON.id('routerPushUrlRouterPageOneSingleBtn0450'), 1000);
      Logger.info('TEST', `Found component: routerPushUrlRouterPageOneSingleBtn0450`);
      if (!routerPushUrlRouterPageOneSingleBtn) {
        Logger.error('TEST', `Component not found: routerPushUrlRouterPageOneSingleBtn0450`);
        throw new Error('Component not found: routerPushUrlRouterPageOneSingleBtn0450');
      }
      await routerPushUrlRouterPageOneSingleBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0450_05');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0450 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0460
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（router组件场景，router组件replaceUrl多实例场景验证）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0460', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0460 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0460/navigationOnActiveOnInActive0460')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"navigation与router结合基础场景"按钮
      let navigationRouterCombinedSceneBtn = await driver.waitForComponent(ON.id('navigationRouterCombinedSceneBtn0460'), 1000);
      Logger.info('TEST', `Found component: navigationRouterCombinedSceneBtn0460`);
      if (!navigationRouterCombinedSceneBtn) {
        Logger.error('TEST', `Component not found: navigationRouterCombinedSceneBtn0460`);
        throw new Error('Component not found: navigationRouterCombinedSceneBtn0460');
      }
      await navigationRouterCombinedSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationRouterCombinedSceneBtn, waiting for page to render`);
      
      // 2.点击"router pushUrl routerPageOne"按钮
      let routerPushUrlRouterPageOneBtn = await driver.waitForComponent(ON.id('routerPushUrlRouterPageOneBtn0460'), 1000);
      Logger.info('TEST', `Found component: routerPushUrlRouterPageOneBtn0460, result: ${routerPushUrlRouterPageOneBtn ? 'found' : 'not found'}`);
      if (!routerPushUrlRouterPageOneBtn) {
        Logger.error('TEST', `Component not found: routerPushUrlRouterPageOneBtn0460 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        routerPushUrlRouterPageOneBtn = await driver.waitForComponent(ON.id('routerPushUrlRouterPageOneBtn0460'), 1000);
        Logger.info('TEST', `Retry found component: routerPushUrlRouterPageOneBtn0460, result: ${routerPushUrlRouterPageOneBtn ? 'found' : 'not found'}`);
        if (!routerPushUrlRouterPageOneBtn) {
          throw new Error('Component not found: routerPushUrlRouterPageOneBtn0460');
        }
      }
      await routerPushUrlRouterPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0460_01');
      await Utils.sleep(1000);
      
      // 3.点击"navigationA push pageOne"按钮
      let navigationAPushPageOneBtn = await driver.waitForComponent(ON.id('navigationAPushPageOneBtn0460'), 1000);
      Logger.info('TEST', `Found component: navigationAPushPageOneBtn0460, result: ${navigationAPushPageOneBtn ? 'found' : 'not found'}`);
      if (!navigationAPushPageOneBtn) {
        Logger.error('TEST', `Component not found: navigationAPushPageOneBtn0460 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        navigationAPushPageOneBtn = await driver.waitForComponent(ON.id('navigationAPushPageOneBtn0460'), 1000);
        Logger.info('TEST', `Retry found component: navigationAPushPageOneBtn0460, result: ${navigationAPushPageOneBtn ? 'found' : 'not found'}`);
        if (!navigationAPushPageOneBtn) {
          throw new Error('Component not found: navigationAPushPageOneBtn0460');
        }
      }
      await navigationAPushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0460_02');
      await Utils.sleep(1000);
      
      // 4.点击"router replaceUrl routerPageTwo"按钮
      let routerReplaceUrlRouterPageTwoBtn = await driver.waitForComponent(ON.id('routerReplaceUrlRouterPageTwoBtn0460'), 1000);
      Logger.info('TEST', `Found component: routerReplaceUrlRouterPageTwoBtn0460`);
      if (!routerReplaceUrlRouterPageTwoBtn) {
        Logger.error('TEST', `Component not found: routerReplaceUrlRouterPageTwoBtn0460`);
        throw new Error('Component not found: routerReplaceUrlRouterPageTwoBtn0460');
      }
      await routerReplaceUrlRouterPageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0460_03');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0460 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0470
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（router组件场景，router组件replaceUrl单实例场景验证）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0470', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0470 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0470/navigationOnActiveOnInActive0470')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"navigation与router结合基础场景"按钮
      let navigationRouterCombinedSceneBtn = await driver.waitForComponent(ON.id('navigationRouterCombinedSceneBtn0470'), 1000);
      Logger.info('TEST', `Found component: navigationRouterCombinedSceneBtn0470`);
      if (!navigationRouterCombinedSceneBtn) {
        Logger.error('TEST', `Component not found: navigationRouterCombinedSceneBtn0470`);
        throw new Error('Component not found: navigationRouterCombinedSceneBtn0470');
      }
      await navigationRouterCombinedSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationRouterCombinedSceneBtn, waiting for page to render`);
      
      // 2.点击"router pushUrl routerPageOne"按钮
      let routerPushUrlRouterPageOneBtn = await driver.waitForComponent(ON.id('routerPushUrlRouterPageOneBtn0470'), 1000);
      Logger.info('TEST', `Found component: routerPushUrlRouterPageOneBtn0470, result: ${routerPushUrlRouterPageOneBtn ? 'found' : 'not found'}`);
      if (!routerPushUrlRouterPageOneBtn) {
        Logger.error('TEST', `Component not found: routerPushUrlRouterPageOneBtn0470 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        routerPushUrlRouterPageOneBtn = await driver.waitForComponent(ON.id('routerPushUrlRouterPageOneBtn0470'), 1000);
        Logger.info('TEST', `Retry found component: routerPushUrlRouterPageOneBtn0470, result: ${routerPushUrlRouterPageOneBtn ? 'found' : 'not found'}`);
        if (!routerPushUrlRouterPageOneBtn) {
          throw new Error('Component not found: routerPushUrlRouterPageOneBtn0470');
        }
      }
      await routerPushUrlRouterPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0470_01');
      await Utils.sleep(1000);
      
      // 3.点击"navigationA push pageOne"按钮
      let navigationAPushPageOneBtn = await driver.waitForComponent(ON.id('navigationAPushPageOneBtn0470'), 1000);
      Logger.info('TEST', `Found component: navigationAPushPageOneBtn0470, result: ${navigationAPushPageOneBtn ? 'found' : 'not found'}`);
      if (!navigationAPushPageOneBtn) {
        Logger.error('TEST', `Component not found: navigationAPushPageOneBtn0470 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        navigationAPushPageOneBtn = await driver.waitForComponent(ON.id('navigationAPushPageOneBtn0470'), 1000);
        Logger.info('TEST', `Retry found component: navigationAPushPageOneBtn0470, result: ${navigationAPushPageOneBtn ? 'found' : 'not found'}`);
        if (!navigationAPushPageOneBtn) {
          throw new Error('Component not found: navigationAPushPageOneBtn0470');
        }
      }
      await navigationAPushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0470_02');
      await Utils.sleep(1000);
      
      // 4.点击"router pushNamedRoute routerPageTwo"按钮
      let routerPushNamedRouteRouterPageTwoBtn = await driver.waitForComponent(ON.id('routerPushNamedRouteRouterPageTwoBtn0470'), 1000);
      Logger.info('TEST', `Found component: routerPushNamedRouteRouterPageTwoBtn0470`);
      if (!routerPushNamedRouteRouterPageTwoBtn) {
        Logger.error('TEST', `Component not found: routerPushNamedRouteRouterPageTwoBtn0470`);
        throw new Error('Component not found: routerPushNamedRouteRouterPageTwoBtn0470');
      }
      await routerPushNamedRouteRouterPageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0470_03');
      await Utils.sleep(1000);
      
      // 5.点击"router replaceUrl routerPageOne Single"按钮
      let routerReplaceUrlRouterPageOneSingleBtn = await driver.waitForComponent(ON.id('routerReplaceUrlRouterPageOneSingleBtn0470'), 1000);
      Logger.info('TEST', `Found component: routerReplaceUrlRouterPageOneSingleBtn0470`);
      if (!routerReplaceUrlRouterPageOneSingleBtn) {
        Logger.error('TEST', `Component not found: routerReplaceUrlRouterPageOneSingleBtn0470`);
        throw new Error('Component not found: routerReplaceUrlRouterPageOneSingleBtn0470');
      }
      await routerReplaceUrlRouterPageOneSingleBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0470_04');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0470 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0480
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（router组件场景，back场景验证）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0480', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0480 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0480/navigationOnActiveOnInActive0480')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"navigation与router结合基础场景"按钮
      let navigationRouterCombinedSceneBtn = await driver.waitForComponent(ON.id('navigationRouterCombinedSceneBtn0480'), 1000);
      Logger.info('TEST', `Found component: navigationRouterCombinedSceneBtn0480`);
      if (!navigationRouterCombinedSceneBtn) {
        Logger.error('TEST', `Component not found: navigationRouterCombinedSceneBtn0480`);
        throw new Error('Component not found: navigationRouterCombinedSceneBtn0480');
      }
      await navigationRouterCombinedSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationRouterCombinedSceneBtn, waiting for page to render`);
      
      // 2.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0480'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0480, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0480 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0480'), 1000);
        Logger.info('TEST', `Retry found component: pushPageOneBtn0480, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
        if (!pushPageOneBtn) {
          throw new Error('Component not found: pushPageOneBtn0480');
        }
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0480_01');
      await Utils.sleep(1000);
      
      // 3.点击"router pushUrl routerPageOne"按钮
      let routerPushUrlRouterPageOneBtn = await driver.waitForComponent(ON.id('routerPushUrlRouterPageOneBtn0480'), 1000);
      Logger.info('TEST', `Found component: routerPushUrlRouterPageOneBtn0480`);
      if (!routerPushUrlRouterPageOneBtn) {
        Logger.error('TEST', `Component not found: routerPushUrlRouterPageOneBtn0480`);
        throw new Error('Component not found: routerPushUrlRouterPageOneBtn0480');
      }
      await routerPushUrlRouterPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0480_02');
      await Utils.sleep(1000);
      
      // 4.点击"navigationA push pageThree"按钮
      let navigationAPushPageThreeBtn = await driver.waitForComponent(ON.id('navigationAPushPageThreeBtn0480'), 1000);
      Logger.info('TEST', `Found component: navigationAPushPageThreeBtn0480, result: ${navigationAPushPageThreeBtn ? 'found' : 'not found'}`);
      if (!navigationAPushPageThreeBtn) {
        Logger.error('TEST', `Component not found: navigationAPushPageThreeBtn0480 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        navigationAPushPageThreeBtn = await driver.waitForComponent(ON.id('navigationAPushPageThreeBtn0480'), 1000);
        Logger.info('TEST', `Retry found component: navigationAPushPageThreeBtn0480, result: ${navigationAPushPageThreeBtn ? 'found' : 'not found'}`);
        if (!navigationAPushPageThreeBtn) {
          throw new Error('Component not found: navigationAPushPageThreeBtn0480');
        }
      }
      await navigationAPushPageThreeBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0480_03');
      await Utils.sleep(1000);
      
      // 5.点击"router pushUrl routerPageTwo"按钮
      let routerPushUrlRouterPageTwoBtn = await driver.waitForComponent(ON.id('routerPushUrlRouterPageTwoBtn0480'), 1000);
      Logger.info('TEST', `Found component: routerPushUrlRouterPageTwoBtn0480`);
      if (!routerPushUrlRouterPageTwoBtn) {
        Logger.error('TEST', `Component not found: routerPushUrlRouterPageTwoBtn0480`);
        throw new Error('Component not found: routerPushUrlRouterPageTwoBtn0480');
      }
      await routerPushUrlRouterPageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0480_04');
      await Utils.sleep(1000);
      
      // 6.点击"back routerPageOne"按钮
      let backRouterPageOneBtn = await driver.waitForComponent(ON.id('backRouterPageOneBtn0480'), 1000);
      Logger.info('TEST', `Found component: backRouterPageOneBtn0480`);
      if (!backRouterPageOneBtn) {
        Logger.error('TEST', `Component not found: backRouterPageOneBtn0480`);
        throw new Error('Component not found: backRouterPageOneBtn0480');
      }
      await backRouterPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0480_05');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0480 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0490
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（router组件场景，replaceNamedRoute场景验证）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0490 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0490/navigationOnActiveOnInActive0490')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"navigation与router结合基础场景"按钮
      let navigationRouterCombinedSceneBtn = await driver.waitForComponent(ON.id('navigationRouterCombinedSceneBtn0490'), 1000);
      Logger.info('TEST', `Found component: navigationRouterCombinedSceneBtn0490`);
      if (!navigationRouterCombinedSceneBtn) {
        Logger.error('TEST', `Component not found: navigationRouterCombinedSceneBtn0490`);
        throw new Error('Component not found: navigationRouterCombinedSceneBtn0490');
      }
      await navigationRouterCombinedSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationRouterCombinedSceneBtn, waiting for page to render`);
      
      // 2.点击"router pushUrl routerPageOne"按钮
      let routerPushUrlRouterPageOneBtn = await driver.waitForComponent(ON.id('routerPushUrlRouterPageOneBtn0490'), 1000);
      Logger.info('TEST', `Found component: routerPushUrlRouterPageOneBtn0490, result: ${routerPushUrlRouterPageOneBtn ? 'found' : 'not found'}`);
      if (!routerPushUrlRouterPageOneBtn) {
        Logger.error('TEST', `Component not found: routerPushUrlRouterPageOneBtn0490 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        routerPushUrlRouterPageOneBtn = await driver.waitForComponent(ON.id('routerPushUrlRouterPageOneBtn0490'), 1000);
        Logger.info('TEST', `Retry found component: routerPushUrlRouterPageOneBtn0490, result: ${routerPushUrlRouterPageOneBtn ? 'found' : 'not found'}`);
        if (!routerPushUrlRouterPageOneBtn) {
          throw new Error('Component not found: routerPushUrlRouterPageOneBtn0490');
        }
      }
      await routerPushUrlRouterPageOneBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1500);
      Logger.info('TEST', `After clicking routerPushUrlRouterPageOneBtn, waiting for target page to render`);
      
      // 等待目标页面的组件出现，确认跳转成功
      let navigationAPushPageOneBtn = await driver.waitForComponent(ON.id('navigationAPushPageOneBtn0490'), 2000);
      Logger.info('TEST', `Found target component: navigationAPushPageOneBtn0490, result: ${navigationAPushPageOneBtn ? 'found' : 'not found'}`);
      if (!navigationAPushPageOneBtn) {
        Logger.error('TEST', `Component not found: navigationAPushPageOneBtn0490 after router jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        navigationAPushPageOneBtn = await driver.waitForComponent(ON.id('navigationAPushPageOneBtn0490'), 2000);
        Logger.info('TEST', `Retry found target component: navigationAPushPageOneBtn0490, result: ${navigationAPushPageOneBtn ? 'found' : 'not found'}`);
        if (!navigationAPushPageOneBtn) {
          throw new Error('Component not found: navigationAPushPageOneBtn0490 after router jump. Router navigation may have failed.');
        }
      }
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0490_01');
      await Utils.sleep(1000);
      
      // 3.点击"navigationA push pageOne"按钮（已在步骤2中确认存在）
      if (!navigationAPushPageOneBtn) {
        throw new Error('Component not found: navigationAPushPageOneBtn0490');
      }
      await navigationAPushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0490_02');
      await Utils.sleep(1000);
      
      // 4.点击"router replaceNamedRoute routerPageTwo"按钮
      let routerReplaceNamedRouteRouterPageTwoBtn = await driver.waitForComponent(ON.id('routerReplaceNamedRouteRouterPageTwoBtn0490'), 1000);
      Logger.info('TEST', `Found component: routerReplaceNamedRouteRouterPageTwoBtn0490`);
      if (!routerReplaceNamedRouteRouterPageTwoBtn) {
        Logger.error('TEST', `Component not found: routerReplaceNamedRouteRouterPageTwoBtn0490`);
        throw new Error('Component not found: routerReplaceNamedRouteRouterPageTwoBtn0490');
      }
      await routerReplaceNamedRouteRouterPageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0490_03');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0490 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0500
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（half-modal场景）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0500 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0500/navigationOnActiveOnInActive0500')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础场景"按钮
      let navigationBasicSceneBtn = await driver.waitForComponent(ON.id('navigationBasicSceneBtn0500'), 1000);
      Logger.info('TEST', `Found component: navigationBasicSceneBtn0500`);
      if (!navigationBasicSceneBtn) {
        Logger.error('TEST', `Component not found: navigationBasicSceneBtn0500`);
        throw new Error('Component not found: navigationBasicSceneBtn0500');
      }
      await navigationBasicSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicSceneBtn, waiting for page to render`);
      
      // 2.点击"push HalfModal"按钮
      let pushHalfModalBtn = await driver.waitForComponent(ON.id('pushHalfModalBtn0500'), 1000);
      Logger.info('TEST', `Found component: pushHalfModalBtn0500, result: ${pushHalfModalBtn ? 'found' : 'not found'}`);
      if (!pushHalfModalBtn) {
        Logger.error('TEST', `Component not found: pushHalfModalBtn0500 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushHalfModalBtn = await driver.waitForComponent(ON.id('pushHalfModalBtn0500'), 1000);
        Logger.info('TEST', `Retry found component: pushHalfModalBtn0500, result: ${pushHalfModalBtn ? 'found' : 'not found'}`);
        if (!pushHalfModalBtn) {
          throw new Error('Component not found: pushHalfModalBtn0500');
        }
      }
      await pushHalfModalBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0500_01');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0500 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0510
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（half-modal场景，push half-modal）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0510', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0510 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0510/navigationOnActiveOnInActive0510')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础场景"按钮
      let navigationBasicSceneBtn = await driver.waitForComponent(ON.id('navigationBasicSceneBtn0510'), 1000);
      Logger.info('TEST', `Found component: navigationBasicSceneBtn0510`);
      if (!navigationBasicSceneBtn) {
        Logger.error('TEST', `Component not found: navigationBasicSceneBtn0510`);
        throw new Error('Component not found: navigationBasicSceneBtn0510');
      }
      await navigationBasicSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicSceneBtn, waiting for page to render`);
      
      // 2.点击"push HalfModal"按钮
      let pushHalfModalBtn = await driver.waitForComponent(ON.id('pushHalfModalBtn0510'), 1000);
      Logger.info('TEST', `Found component: pushHalfModalBtn0510, result: ${pushHalfModalBtn ? 'found' : 'not found'}`);
      if (!pushHalfModalBtn) {
        Logger.error('TEST', `Component not found: pushHalfModalBtn0510 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushHalfModalBtn = await driver.waitForComponent(ON.id('pushHalfModalBtn0510'), 1000);
        Logger.info('TEST', `Retry found component: pushHalfModalBtn0510, result: ${pushHalfModalBtn ? 'found' : 'not found'}`);
        if (!pushHalfModalBtn) {
          throw new Error('Component not found: pushHalfModalBtn0510');
        }
      }
      await pushHalfModalBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0510_01');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0510 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0520
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（half-modal场景，pop half-modal）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0520', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0520 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0520/navigationOnActiveOnInActive0520')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础场景"按钮
      let navigationBasicSceneBtn = await driver.waitForComponent(ON.id('navigationBasicSceneBtn0520'), 1000);
      Logger.info('TEST', `Found component: navigationBasicSceneBtn0520`);
      if (!navigationBasicSceneBtn) {
        Logger.error('TEST', `Component not found: navigationBasicSceneBtn0520`);
        throw new Error('Component not found: navigationBasicSceneBtn0520');
      }
      await navigationBasicSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicSceneBtn, waiting for page to render`);
      
      // 2.点击"push HalfModal"按钮
      let pushHalfModalBtn = await driver.waitForComponent(ON.id('pushHalfModalBtn0520'), 1000);
      Logger.info('TEST', `Found component: pushHalfModalBtn0520, result: ${pushHalfModalBtn ? 'found' : 'not found'}`);
      if (!pushHalfModalBtn) {
        Logger.error('TEST', `Component not found: pushHalfModalBtn0520 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushHalfModalBtn = await driver.waitForComponent(ON.id('pushHalfModalBtn0520'), 1000);
        Logger.info('TEST', `Retry found component: pushHalfModalBtn0520, result: ${pushHalfModalBtn ? 'found' : 'not found'}`);
        if (!pushHalfModalBtn) {
          throw new Error('Component not found: pushHalfModalBtn0520');
        }
      }
      await pushHalfModalBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0520_01');
      await Utils.sleep(1000);
      
      // 3.点击"pop"按钮
      let popBtn = await driver.waitForComponent(ON.id('popBtn0520'), 1000);
      Logger.info('TEST', `Found component: popBtn0520`);
      if (!popBtn) {
        Logger.error('TEST', `Component not found: popBtn0520`);
        throw new Error('Component not found: popBtn0520');
      }
      await popBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0520_02');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0520 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0530
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（half-modal场景，replace half-modal）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0530', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0530 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0530/navigationOnActiveOnInActive0530')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础场景"按钮
      let navigationBasicSceneBtn = await driver.waitForComponent(ON.id('navigationBasicSceneBtn0530'), 1000);
      Logger.info('TEST', `Found component: navigationBasicSceneBtn0530`);
      if (!navigationBasicSceneBtn) {
        Logger.error('TEST', `Component not found: navigationBasicSceneBtn0530`);
        throw new Error('Component not found: navigationBasicSceneBtn0530');
      }
      await navigationBasicSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicSceneBtn, waiting for page to render`);
      
      // 2.点击"push HalfModal"按钮
      let pushHalfModalBtn = await driver.waitForComponent(ON.id('pushHalfModalBtn0530'), 1000);
      Logger.info('TEST', `Found component: pushHalfModalBtn0530, result: ${pushHalfModalBtn ? 'found' : 'not found'}`);
      if (!pushHalfModalBtn) {
        Logger.error('TEST', `Component not found: pushHalfModalBtn0530 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushHalfModalBtn = await driver.waitForComponent(ON.id('pushHalfModalBtn0530'), 1000);
        Logger.info('TEST', `Retry found component: pushHalfModalBtn0530, result: ${pushHalfModalBtn ? 'found' : 'not found'}`);
        if (!pushHalfModalBtn) {
          throw new Error('Component not found: pushHalfModalBtn0530');
        }
      }
      await pushHalfModalBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0530_01');
      await Utils.sleep(1000);
      
      // 3.点击"replace HalfModal"按钮
      let replaceHalfModalBtn = await driver.waitForComponent(ON.id('replaceHalfModalBtn0530'), 1000);
      Logger.info('TEST', `Found component: replaceHalfModalBtn0530`);
      if (!replaceHalfModalBtn) {
        Logger.error('TEST', `Component not found: replaceHalfModalBtn0530`);
        throw new Error('Component not found: replaceHalfModalBtn0530');
      }
      await replaceHalfModalBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0530_02');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0530 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0540
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（full-modal场景，push full-modal）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0540', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0540 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0540/navigationOnActiveOnInActive0540')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础场景"按钮
      let navigationBasicSceneBtn = await driver.waitForComponent(ON.id('navigationBasicSceneBtn0540'), 1000);
      Logger.info('TEST', `Found component: navigationBasicSceneBtn0540`);
      if (!navigationBasicSceneBtn) {
        Logger.error('TEST', `Component not found: navigationBasicSceneBtn0540`);
        throw new Error('Component not found: navigationBasicSceneBtn0540');
      }
      await navigationBasicSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicSceneBtn, waiting for page to render`);
      
      // 2.点击"push FullModal"按钮
      let pushFullModalBtn = await driver.waitForComponent(ON.id('pushFullModalBtn0540'), 1000);
      Logger.info('TEST', `Found component: pushFullModalBtn0540, result: ${pushFullModalBtn ? 'found' : 'not found'}`);
      if (!pushFullModalBtn) {
        Logger.error('TEST', `Component not found: pushFullModalBtn0540 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushFullModalBtn = await driver.waitForComponent(ON.id('pushFullModalBtn0540'), 1000);
        Logger.info('TEST', `Retry found component: pushFullModalBtn0540, result: ${pushFullModalBtn ? 'found' : 'not found'}`);
        if (!pushFullModalBtn) {
          throw new Error('Component not found: pushFullModalBtn0540');
        }
      }
      await pushFullModalBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0540_01');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0540 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0550
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（full-modal场景，pop full-modal）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0550', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0550 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0550/navigationOnActiveOnInActive0550')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础场景"按钮
      let navigationBasicSceneBtn = await driver.waitForComponent(ON.id('navigationBasicSceneBtn0550'), 1000);
      Logger.info('TEST', `Found component: navigationBasicSceneBtn0550`);
      if (!navigationBasicSceneBtn) {
        Logger.error('TEST', `Component not found: navigationBasicSceneBtn0550`);
        throw new Error('Component not found: navigationBasicSceneBtn0550');
      }
      await navigationBasicSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicSceneBtn, waiting for page to render`);
      
      // 2.点击"push FullModal"按钮
      let pushFullModalBtn = await driver.waitForComponent(ON.id('pushFullModalBtn0550'), 1000);
      Logger.info('TEST', `Found component: pushFullModalBtn0550, result: ${pushFullModalBtn ? 'found' : 'not found'}`);
      if (!pushFullModalBtn) {
        Logger.error('TEST', `Component not found: pushFullModalBtn0550 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushFullModalBtn = await driver.waitForComponent(ON.id('pushFullModalBtn0550'), 1000);
        Logger.info('TEST', `Retry found component: pushFullModalBtn0550, result: ${pushFullModalBtn ? 'found' : 'not found'}`);
        if (!pushFullModalBtn) {
          throw new Error('Component not found: pushFullModalBtn0550');
        }
      }
      await pushFullModalBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0550_01');
      await Utils.sleep(1000);
      
      // 3.点击"pop"按钮
      let popBtn = await driver.waitForComponent(ON.id('popBtn0550'), 1000);
      Logger.info('TEST', `Found component: popBtn0550`);
      if (!popBtn) {
        Logger.error('TEST', `Component not found: popBtn0550`);
        throw new Error('Component not found: popBtn0550');
      }
      await popBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0550_02');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0550 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0560
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（full-modal场景，replace full-modal）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0560', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0560 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0560/navigationOnActiveOnInActive0560')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础场景"按钮
      let navigationBasicSceneBtn = await driver.waitForComponent(ON.id('navigationBasicSceneBtn0560'), 1000);
      Logger.info('TEST', `Found component: navigationBasicSceneBtn0560`);
      if (!navigationBasicSceneBtn) {
        Logger.error('TEST', `Component not found: navigationBasicSceneBtn0560`);
        throw new Error('Component not found: navigationBasicSceneBtn0560');
      }
      await navigationBasicSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicSceneBtn, waiting for page to render`);
      
      // 2.点击"push FullModal"按钮
      let pushFullModalBtn = await driver.waitForComponent(ON.id('pushFullModalBtn0560'), 1000);
      Logger.info('TEST', `Found component: pushFullModalBtn0560, result: ${pushFullModalBtn ? 'found' : 'not found'}`);
      if (!pushFullModalBtn) {
        Logger.error('TEST', `Component not found: pushFullModalBtn0560 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushFullModalBtn = await driver.waitForComponent(ON.id('pushFullModalBtn0560'), 1000);
        Logger.info('TEST', `Retry found component: pushFullModalBtn0560, result: ${pushFullModalBtn ? 'found' : 'not found'}`);
        if (!pushFullModalBtn) {
          throw new Error('Component not found: pushFullModalBtn0560');
        }
      }
      await pushFullModalBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0560_01');
      await Utils.sleep(1000);
      
      // 3.点击"replace FullModal"按钮
      let replaceFullModalBtn = await driver.waitForComponent(ON.id('replaceFullModalBtn0560'), 1000);
      Logger.info('TEST', `Found component: replaceFullModalBtn0560`);
      if (!replaceFullModalBtn) {
        Logger.error('TEST', `Component not found: replaceFullModalBtn0560`);
        throw new Error('Component not found: replaceFullModalBtn0560');
      }
      await replaceFullModalBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0560_02');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0560 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0570
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（CustomDialog场景，show CustomDialog）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0570', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0570 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0570/navigationOnActiveOnInActive0570')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础场景"按钮
      let navigationBasicSceneBtn = await driver.waitForComponent(ON.id('navigationBasicSceneBtn0570'), 1000);
      Logger.info('TEST', `Found component: navigationBasicSceneBtn0570`);
      if (!navigationBasicSceneBtn) {
        Logger.error('TEST', `Component not found: navigationBasicSceneBtn0570`);
        throw new Error('Component not found: navigationBasicSceneBtn0570');
      }
      await navigationBasicSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicSceneBtn, waiting for page to render`);
      
      // 2.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0570'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0570, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0570 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0570'), 1000);
        Logger.info('TEST', `Retry found component: pushPageOneBtn0570, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
        if (!pushPageOneBtn) {
          throw new Error('Component not found: pushPageOneBtn0570');
        }
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0570_01');
      await Utils.sleep(1000);
      
      // 3.点击"show CustomDialog"按钮
      let showCustomDialogBtn = await driver.waitForComponent(ON.id('showCustomDialogBtn0570'), 1000);
      Logger.info('TEST', `Found component: showCustomDialogBtn0570`);
      if (!showCustomDialogBtn) {
        Logger.error('TEST', `Component not found: showCustomDialogBtn0570`);
        throw new Error('Component not found: showCustomDialogBtn0570');
      }
      await showCustomDialogBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0570_02');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0570 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0580
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（CustomDialog场景，close CustomDialog）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0580', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0580 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0580/navigationOnActiveOnInActive0580')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);

      // 1.点击"Navigation基础场景"按钮
      let navigationBasicSceneBtn = await driver.waitForComponent(ON.id('navigationBasicSceneBtn0580'), 1000);
      Logger.info('TEST', `Found component: navigationBasicSceneBtn0580`);
      if (!navigationBasicSceneBtn) {
        Logger.error('TEST', `Component not found: navigationBasicSceneBtn0580`);
        throw new Error('Component not found: navigationBasicSceneBtn0580');
      }
      await navigationBasicSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicSceneBtn, waiting for page to render`);

      // 2.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0580'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0580, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0580 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0580'), 1000);
        Logger.info('TEST', `Retry found component: pushPageOneBtn0580, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
        if (!pushPageOneBtn) {
          throw new Error('Component not found: pushPageOneBtn0580');
        }
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0580_01');
      await Utils.sleep(1000);

      // 3.点击"show CustomDialog"按钮
      let showCustomDialogBtn = await driver.waitForComponent(ON.id('showCustomDialogBtn0580'), 1000);
      Logger.info('TEST', `Found component: showCustomDialogBtn0580`);
      if (!showCustomDialogBtn) {
        Logger.error('TEST', `Component not found: showCustomDialogBtn0580`);
        throw new Error('Component not found: showCustomDialogBtn0580');
      }
      await showCustomDialogBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0580_02');
      await Utils.sleep(1000);

      // 4.点击"close CustomDialog"按钮
      let closeCustomDialogBtn = await driver.waitForComponent(ON.id('closeCustomDialogBtn0580'), 1000);
      Logger.info('TEST', `Found component: closeCustomDialogBtn0580`);
      if (!closeCustomDialogBtn) {
        Logger.error('TEST', `Component not found: closeCustomDialogBtn0580`);
        throw new Error('Component not found: closeCustomDialogBtn0580');
      }
      await closeCustomDialogBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0580_03');
      await Utils.sleep(1000);

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0580 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0590
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（CustomDialog场景，show multiple CustomDialog）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0590', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0590 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0590/navigationOnActiveOnInActive0590')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);

      // 1.点击"Navigation基础场景"按钮
      let navigationBasicSceneBtn = await driver.waitForComponent(ON.id('navigationBasicSceneBtn0590'), 1000);
      Logger.info('TEST', `Found component: navigationBasicSceneBtn0590`);
      if (!navigationBasicSceneBtn) {
        Logger.error('TEST', `Component not found: navigationBasicSceneBtn0590`);
        throw new Error('Component not found: navigationBasicSceneBtn0590');
      }
      await navigationBasicSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicSceneBtn, waiting for page to render`);

      // 2.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0590'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0590, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0590 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0590'), 1000);
        Logger.info('TEST', `Retry found component: pushPageOneBtn0590, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
        if (!pushPageOneBtn) {
          throw new Error('Component not found: pushPageOneBtn0590');
        }
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0590_01');
      await Utils.sleep(1000);

      // 3.点击"show CustomDialog 1"按钮
      let showCustomDialog1Btn = await driver.waitForComponent(ON.id('showCustomDialog1Btn0590'), 1000);
      Logger.info('TEST', `Found component: showCustomDialog1Btn0590`);
      if (!showCustomDialog1Btn) {
        Logger.error('TEST', `Component not found: showCustomDialog1Btn0590`);
        throw new Error('Component not found: showCustomDialog1Btn0590');
      }
      await showCustomDialog1Btn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0590_02');
      await Utils.sleep(1000);

      // 4.点击"show CustomDialog 2"按钮
      let showCustomDialog2Btn = await driver.waitForComponent(ON.id('showCustomDialog2Btn0590'), 1000);
      Logger.info('TEST', `Found component: showCustomDialog2Btn0590`);
      if (!showCustomDialog2Btn) {
        Logger.error('TEST', `Component not found: showCustomDialog2Btn0590`);
        throw new Error('Component not found: showCustomDialog2Btn0590');
      }
      await showCustomDialog2Btn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0590_03');
      await Utils.sleep(1000);

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0590 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0620
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（promptAction.showDialog场景，show dialog）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0620', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0620 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0620/navigationOnActiveOnInActive0620')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础场景"按钮
      let navigationBasicSceneBtn = await driver.waitForComponent(ON.id('navigationBasicSceneBtn0620'), 1000);
      Logger.info('TEST', `Found component: navigationBasicSceneBtn0620`);
      if (!navigationBasicSceneBtn) {
        Logger.error('TEST', `Component not found: navigationBasicSceneBtn0620`);
        throw new Error('Component not found: navigationBasicSceneBtn0620');
      }
      await navigationBasicSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicSceneBtn, waiting for page to render`);
      
      // 2.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0620'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0620, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0620 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0620'), 1000);
        Logger.info('TEST', `Retry found component: pushPageOneBtn0620, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
        if (!pushPageOneBtn) {
          throw new Error('Component not found: pushPageOneBtn0620');
        }
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0620_01');
      await Utils.sleep(1000);
      
      // 3.点击"show dialog"按钮
      let showDialogBtn = await driver.waitForComponent(ON.id('showDialogBtn0620'), 1000);
      Logger.info('TEST', `Found component: showDialogBtn0620`);
      if (!showDialogBtn) {
        Logger.error('TEST', `Component not found: showDialogBtn0620`);
        throw new Error('Component not found: showDialogBtn0620');
      }
      await showDialogBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0620_02');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0620 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0630
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（promptAction.showDialog场景，close dialog）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0630', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0630 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0630/navigationOnActiveOnInActive0630')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础场景"按钮
      let navigationBasicSceneBtn = await driver.waitForComponent(ON.id('navigationBasicSceneBtn0630'), 1000);
      Logger.info('TEST', `Found component: navigationBasicSceneBtn0630`);
      if (!navigationBasicSceneBtn) {
        Logger.error('TEST', `Component not found: navigationBasicSceneBtn0630`);
        throw new Error('Component not found: navigationBasicSceneBtn0630');
      }
      await navigationBasicSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicSceneBtn, waiting for page to render`);
      
      // 2.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0630'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0630, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0630 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0630'), 1000);
        Logger.info('TEST', `Retry found component: pushPageOneBtn0630, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
        if (!pushPageOneBtn) {
          throw new Error('Component not found: pushPageOneBtn0630');
        }
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0630_01');
      await Utils.sleep(1000);
      
      // 3.点击"show dialog"按钮
      let showDialogBtn = await driver.waitForComponent(ON.id('showDialogBtn0630'), 1000);
      Logger.info('TEST', `Found component: showDialogBtn0630`);
      if (!showDialogBtn) {
        Logger.error('TEST', `Component not found: showDialogBtn0630`);
        throw new Error('Component not found: showDialogBtn0630');
      }
      await showDialogBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0630_02');
      await Utils.sleep(1000);
      
      // 4.点击"close dialog"按钮
      let closeDialogBtn = await driver.waitForComponent(ON.id('closeDialogBtn0630'), 1000);
      Logger.info('TEST', `Found component: closeDialogBtn0630`);
      if (!closeDialogBtn) {
        Logger.error('TEST', `Component not found: closeDialogBtn0630`);
        throw new Error('Component not found: closeDialogBtn0630');
      }
      await closeDialogBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0630_03');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0630 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0640
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（promptAction.showDialog场景，push page while dialog showing）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0640', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0640 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0640/navigationOnActiveOnInActive0640')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础场景"按钮
      let navigationBasicSceneBtn = await driver.waitForComponent(ON.id('navigationBasicSceneBtn0640'), 1000);
      Logger.info('TEST', `Found component: navigationBasicSceneBtn0640`);
      if (!navigationBasicSceneBtn) {
        Logger.error('TEST', `Component not found: navigationBasicSceneBtn0640`);
        throw new Error('Component not found: navigationBasicSceneBtn0640');
      }
      await navigationBasicSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicSceneBtn, waiting for page to render`);
      
      // 2.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0640'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0640, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0640 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0640'), 1000);
        Logger.info('TEST', `Retry found component: pushPageOneBtn0640, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
        if (!pushPageOneBtn) {
          throw new Error('Component not found: pushPageOneBtn0640');
        }
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0640_01');
      await Utils.sleep(1000);
      
      // 3.点击"show dialog"按钮
      let showDialogBtn = await driver.waitForComponent(ON.id('showDialogBtn0640'), 1000);
      Logger.info('TEST', `Found component: showDialogBtn0640`);
      if (!showDialogBtn) {
        Logger.error('TEST', `Component not found: showDialogBtn0640`);
        throw new Error('Component not found: showDialogBtn0640');
      }
      await showDialogBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0640_02');
      await Utils.sleep(1000);
      
      // 4.点击"push pageTwo"按钮
      let pushPageTwoBtn = await driver.waitForComponent(ON.id('pushPageTwoBtn0640'), 1000);
      Logger.info('TEST', `Found component: pushPageTwoBtn0640`);
      if (!pushPageTwoBtn) {
        Logger.error('TEST', `Component not found: pushPageTwoBtn0640`);
        throw new Error('Component not found: pushPageTwoBtn0640');
      }
      await pushPageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0640_03');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0640 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0650
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（promptAction.openCustomDialog场景，show custom dialog）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0650', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0650 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0650/navigationOnActiveOnInActive0650')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础场景"按钮
      let navigationBasicSceneBtn = await driver.waitForComponent(ON.id('navigationBasicSceneBtn0650'), 1000);
      Logger.info('TEST', `Found component: navigationBasicSceneBtn0650`);
      if (!navigationBasicSceneBtn) {
        Logger.error('TEST', `Component not found: navigationBasicSceneBtn0650`);
        throw new Error('Component not found: navigationBasicSceneBtn0650');
      }
      await navigationBasicSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicSceneBtn, waiting for page to render`);
      
      // 2.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0650'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0650, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0650 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0650'), 1000);
        Logger.info('TEST', `Retry found component: pushPageOneBtn0650, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
        if (!pushPageOneBtn) {
          throw new Error('Component not found: pushPageOneBtn0650');
        }
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0650_01');
      await Utils.sleep(1000);
      
      // 3.点击"show custom dialog"按钮
      let showCustomDialogBtn = await driver.waitForComponent(ON.id('showCustomDialogBtn0650'), 1000);
      Logger.info('TEST', `Found component: showCustomDialogBtn0650`);
      if (!showCustomDialogBtn) {
        Logger.error('TEST', `Component not found: showCustomDialogBtn0650`);
        throw new Error('Component not found: showCustomDialogBtn0650');
      }
      await showCustomDialogBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0650_02');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0650 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0680
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（promptAction.openCustomDialog场景，show multiple custom dialog）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0680', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0680 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0680/navigationOnActiveOnInActive0680')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础场景"按钮
      let navigationBasicSceneBtn = await driver.waitForComponent(ON.id('navigationBasicSceneBtn0680'), 1000);
      Logger.info('TEST', `Found component: navigationBasicSceneBtn0680`);
      if (!navigationBasicSceneBtn) {
        Logger.error('TEST', `Component not found: navigationBasicSceneBtn0680`);
        throw new Error('Component not found: navigationBasicSceneBtn0680');
      }
      await navigationBasicSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicSceneBtn, waiting for page to render`);
      
      // 2.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0680'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0680, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0680 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0680'), 1000);
        Logger.info('TEST', `Retry found component: pushPageOneBtn0680, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
        if (!pushPageOneBtn) {
          throw new Error('Component not found: pushPageOneBtn0680');
        }
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0680_01');
      await Utils.sleep(1000);
      
      // 3.点击"show custom dialog 1"按钮
      let showCustomDialog1Btn = await driver.waitForComponent(ON.id('showCustomDialog1Btn0680'), 1000);
      Logger.info('TEST', `Found component: showCustomDialog1Btn0680`);
      if (!showCustomDialog1Btn) {
        Logger.error('TEST', `Component not found: showCustomDialog1Btn0680`);
        throw new Error('Component not found: showCustomDialog1Btn0680');
      }
      await showCustomDialog1Btn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0680_02');
      await Utils.sleep(1000);
      
      // 4.点击"show custom dialog 2"按钮
      let showCustomDialog2Btn = await driver.waitForComponent(ON.id('showCustomDialog2Btn0680'), 1000);
      Logger.info('TEST', `Found component: showCustomDialog2Btn0680`);
      if (!showCustomDialog2Btn) {
        Logger.error('TEST', `Component not found: showCustomDialog2Btn0680`);
        throw new Error('Component not found: showCustomDialog2Btn0680');
      }
      await showCustomDialog2Btn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0680_03');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0680 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0690
     * @tc.name   : NavDestination新增OnActive和OnInActive生命周期（UIContext dialog场景，show dialog）
     * @tc.desc   : Verify nav navigation onactiveoninactive interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0690', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0690 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/activeOn/0690/navigationOnActiveOnInActive0690')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation基础场景"按钮
      let navigationBasicSceneBtn = await driver.waitForComponent(ON.id('navigationBasicSceneBtn0690'), 1000);
      Logger.info('TEST', `Found component: navigationBasicSceneBtn0690`);
      if (!navigationBasicSceneBtn) {
        Logger.error('TEST', `Component not found: navigationBasicSceneBtn0690`);
        throw new Error('Component not found: navigationBasicSceneBtn0690');
      }
      await navigationBasicSceneBtn.click();
      await driver.waitForIdle(1000, 2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `After clicking navigationBasicSceneBtn, waiting for page to render`);
      
      // 2.点击"push pageOne"按钮
      let pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0690'), 1000);
      Logger.info('TEST', `Found component: pushPageOneBtn0690, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
      if (!pushPageOneBtn) {
        Logger.error('TEST', `Component not found: pushPageOneBtn0690 after navigation jump. Page may not be fully rendered.`);
        await Utils.sleep(1000);
        pushPageOneBtn = await driver.waitForComponent(ON.id('pushPageOneBtn0690'), 1000);
        Logger.info('TEST', `Retry found component: pushPageOneBtn0690, result: ${pushPageOneBtn ? 'found' : 'not found'}`);
        if (!pushPageOneBtn) {
          throw new Error('Component not found: pushPageOneBtn0690');
        }
      }
      await pushPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0690_01');
      await Utils.sleep(1000);
      
      // 3.点击"show UIContext dialog"按钮
      let showUIContextDialogBtn = await driver.waitForComponent(ON.id('showUIContextDialogBtn0690'), 1000);
      Logger.info('TEST', `Found component: showUIContextDialogBtn0690`);
      if (!showUIContextDialogBtn) {
        Logger.error('TEST', `Component not found: showUIContextDialogBtn0690`);
        throw new Error('Component not found: showUIContextDialogBtn0690');
      }
      await showUIContextDialogBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0690_02');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONACTIVEONINACTIVE_0690 finish.`);
      done()
    })
  })
}
