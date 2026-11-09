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

export default function navigationOnNewParamTest() {

  describe('navigationOnNewParamTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0010
     * @tc.name   : Router单例跳转支持参数刷新回调OnNewParam(pushUrl接口测试)
     * @tc.desc   : Verify nav navigation onnewparam interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0010 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/onNewParam/0010/navigationOnNewParam0010')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Router组件场景"按钮
      let routerSceneBtn = await driver.waitForComponent(ON.id('routerSceneBtn0010'), 1000);
      Logger.info('TEST', `Found component: routerSceneBtn0010`);
      if (!routerSceneBtn) {
        Logger.error('TEST', `Component not found: routerSceneBtn0010`);
        throw new Error('Component not found: routerSceneBtn0010');
      }
      await routerSceneBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"pushUrl pageOne Standard"按钮
      let pushUrlPageOneStandardBtn = await driver.waitForComponent(ON.id('pushUrlPageOneStandardBtn0010'), 1000);
      Logger.info('TEST', `Found component: pushUrlPageOneStandardBtn0010`);
      if (!pushUrlPageOneStandardBtn) {
        Logger.error('TEST', `Component not found: pushUrlPageOneStandardBtn0010`);
        throw new Error('Component not found: pushUrlPageOneStandardBtn0010');
      }
      await pushUrlPageOneStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0010_01');
      await Utils.sleep(1000);
      
      // 3.点击"pushUrl pageTwo Standard"按钮
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let pushUrlPageTwoStandardBtn = await driver.waitForComponent(ON.id('pushUrlPageTwoStandardBtn0010'), 1000);
      Logger.info('TEST', `Found component: pushUrlPageTwoStandardBtn0010`);
      if (!pushUrlPageTwoStandardBtn) {
        Logger.error('TEST', `Component not found: pushUrlPageTwoStandardBtn0010`);
        throw new Error('Component not found: pushUrlPageTwoStandardBtn0010');
      }
      await pushUrlPageTwoStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0010_02');
      await Utils.sleep(1000);
      
      // 4.点击"pushUrl pageOne Standard"按钮（不刷新pageOne页面，不回调OnNewParam）
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      pushUrlPageOneStandardBtn = await driver.waitForComponent(ON.id('pushUrlPageOneStandardBtn0010'), 1000);
      if (!pushUrlPageOneStandardBtn) {
        Logger.error('TEST', `Component not found: pushUrlPageOneStandardBtn0010 after back`);
        throw new Error('Component not found: pushUrlPageOneStandardBtn0010');
      }
      await pushUrlPageOneStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0010_03');
      await Utils.sleep(1000);
      
      // 5.点击"pushUrl pageOne Single"按钮（刷新pageOne页面，回调OnNewParam）
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let pushUrlPageOneSingleBtn = await driver.waitForComponent(ON.id('pushUrlPageOneSingleBtn0010'), 1000);
      if (!pushUrlPageOneSingleBtn) {
        Logger.error('TEST', `Component not found: pushUrlPageOneSingleBtn0010`);
        throw new Error('Component not found: pushUrlPageOneSingleBtn0010');
      }
      await pushUrlPageOneSingleBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0010_04');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0010 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0030
     * @tc.name   : Router单例跳转支持参数刷新回调OnNewParam(replaceUrl接口测试)
     * @tc.desc   : Verify nav navigation onnewparam interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0030 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/onNewParam/0030/navigationOnNewParam0030')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Router组件场景"按钮
      let routerSceneBtn = await driver.waitForComponent(ON.id('routerSceneBtn0030'), 1000);
      Logger.info('TEST', `Found component: routerSceneBtn0030`);
      if (!routerSceneBtn) {
        Logger.error('TEST', `Component not found: routerSceneBtn0030`);
        throw new Error('Component not found: routerSceneBtn0030');
      }
      await routerSceneBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"pushUrl pageOne Standard"按钮
      let pushUrlPageOneStandardBtn = await driver.waitForComponent(ON.id('pushUrlPageOneStandardBtn0030'), 1000);
      Logger.info('TEST', `Found component: pushUrlPageOneStandardBtn0030`);
      if (!pushUrlPageOneStandardBtn) {
        Logger.error('TEST', `Component not found: pushUrlPageOneStandardBtn0030`);
        throw new Error('Component not found: pushUrlPageOneStandardBtn0030');
      }
      await pushUrlPageOneStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0030_01');
      await Utils.sleep(1000);
      
      // 3.点击"pushUrl pageTwo Standard"按钮
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let pushUrlPageTwoStandardBtn = await driver.waitForComponent(ON.id('pushUrlPageTwoStandardBtn0030'), 1000);
      Logger.info('TEST', `Found component: pushUrlPageTwoStandardBtn0030`);
      if (!pushUrlPageTwoStandardBtn) {
        Logger.error('TEST', `Component not found: pushUrlPageTwoStandardBtn0030`);
        throw new Error('Component not found: pushUrlPageTwoStandardBtn0030');
      }
      await pushUrlPageTwoStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0030_02');
      await Utils.sleep(1000);
      
      // 4.点击"pushUrl pageThree Standard"按钮
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let pushUrlPageThreeStandardBtn = await driver.waitForComponent(ON.id('pushUrlPageThreeStandardBtn0030'), 1000);
      Logger.info('TEST', `Found component: pushUrlPageThreeStandardBtn0030`);
      if (!pushUrlPageThreeStandardBtn) {
        Logger.error('TEST', `Component not found: pushUrlPageThreeStandardBtn0030`);
        throw new Error('Component not found: pushUrlPageThreeStandardBtn0030');
      }
      await pushUrlPageThreeStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0030_03');
      await Utils.sleep(1000);
      
      // 5.点击"replaceUrl pageOne Standard"按钮（不刷新pageOne页面，不回调OnNewParam）
      // 当前在routerPageThree0030，点击"back to main"按钮跳转到主入口页面，然后重新进入RouterScene0030
      let backToMainBtn = await driver.waitForComponent(ON.id('backToMainBtn0030'), 1000);
      Logger.info('TEST', `Found component: backToMainBtn0030`);
      if (!backToMainBtn) {
        Logger.error('TEST', `Component not found: backToMainBtn0030`);
        throw new Error('Component not found: backToMainBtn0030');
      }
      await backToMainBtn.click();
      await driver.waitForIdle(500, 2000);
      routerSceneBtn = await driver.waitForComponent(ON.id('routerSceneBtn0030'), 1000);
      if (!routerSceneBtn) {
        Logger.error('TEST', `Component not found: routerSceneBtn0030 after backToMain`);
        throw new Error('Component not found: routerSceneBtn0030');
      }
      await routerSceneBtn.click();
      await driver.waitForIdle(500, 2000);
      let replaceUrlPageOneStandardBtn = await driver.waitForComponent(ON.id('replaceUrlPageOneStandardBtn0030'), 1000);
      Logger.info('TEST', `Found component: replaceUrlPageOneStandardBtn0030`);
      if (!replaceUrlPageOneStandardBtn) {
        Logger.error('TEST', `Component not found: replaceUrlPageOneStandardBtn0030`);
        throw new Error('Component not found: replaceUrlPageOneStandardBtn0030');
      }
      await replaceUrlPageOneStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0030_04');
      await Utils.sleep(1000);
      
      // 6.点击"replaceUrl pageTwo Single"按钮（刷新pageTwo页面，回调OnNewParam）
      // replaceUrl替换了pageThree为pageOne，当前在routerPageOne0030（新）
      // 点击"back to main"按钮跳转到主入口页面，然后重新进入RouterScene0030
      backToMainBtn = await driver.waitForComponent(ON.id('backToMainBtn0030'), 1000);
      Logger.info('TEST', `Found component: backToMainBtn0030`);
      if (!backToMainBtn) {
        Logger.error('TEST', `Component not found: backToMainBtn0030`);
        throw new Error('Component not found: backToMainBtn0030');
      }
      await backToMainBtn.click();
      await driver.waitForIdle(500, 2000);
      routerSceneBtn = await driver.waitForComponent(ON.id('routerSceneBtn0030'), 1000);
      if (!routerSceneBtn) {
        Logger.error('TEST', `Component not found: routerSceneBtn0030 after backToMain`);
        throw new Error('Component not found: routerSceneBtn0030');
      }
      await routerSceneBtn.click();
      await driver.waitForIdle(500, 2000);
      let replaceUrlPageTwoSingleBtn = await driver.waitForComponent(ON.id('replaceUrlPageTwoSingleBtn0030'), 1000);
      Logger.info('TEST', `Found component: replaceUrlPageTwoSingleBtn0030`);
      if (!replaceUrlPageTwoSingleBtn) {
        Logger.error('TEST', `Component not found: replaceUrlPageTwoSingleBtn0030`);
        throw new Error('Component not found: replaceUrlPageTwoSingleBtn0030');
      }
      await replaceUrlPageTwoSingleBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0030_05');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0030 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0040
     * @tc.name   : Router单例跳转支持参数刷新回调OnNewParam(replaceNamedRoute接口测试)
     * @tc.desc   : Verify nav navigation onnewparam interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0040 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/onNewParam/0040/navigationOnNewParam0040')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Router组件场景"按钮
      let routerSceneBtn = await driver.waitForComponent(ON.id('routerSceneBtn0040'), 1000);
      Logger.info('TEST', `Found component: routerSceneBtn0040`);
      if (!routerSceneBtn) {
        Logger.error('TEST', `Component not found: routerSceneBtn0040`);
        throw new Error('Component not found: routerSceneBtn0040');
      }
      await routerSceneBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"pushUrl pageOne Standard"按钮
      let pushUrlPageOneStandardBtn = await driver.waitForComponent(ON.id('pushUrlPageOneStandardBtn0040'), 1000);
      Logger.info('TEST', `Found component: pushUrlPageOneStandardBtn0040`);
      if (!pushUrlPageOneStandardBtn) {
        Logger.error('TEST', `Component not found: pushUrlPageOneStandardBtn0040`);
        throw new Error('Component not found: pushUrlPageOneStandardBtn0040');
      }
      await pushUrlPageOneStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0040_01');
      await Utils.sleep(1000);
      
      // 3.点击"pushUrl pageTwo Standard"按钮
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let pushUrlPageTwoStandardBtn = await driver.waitForComponent(ON.id('pushUrlPageTwoStandardBtn0040'), 1000);
      Logger.info('TEST', `Found component: pushUrlPageTwoStandardBtn0040`);
      if (!pushUrlPageTwoStandardBtn) {
        Logger.error('TEST', `Component not found: pushUrlPageTwoStandardBtn0040`);
        throw new Error('Component not found: pushUrlPageTwoStandardBtn0040');
      }
      await pushUrlPageTwoStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0040_02');
      await Utils.sleep(1000);
      
      // 4.点击"pushUrl pageThree Standard"按钮
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let pushUrlPageThreeStandardBtn = await driver.waitForComponent(ON.id('pushUrlPageThreeStandardBtn0040'), 1000);
      Logger.info('TEST', `Found component: pushUrlPageThreeStandardBtn0040`);
      if (!pushUrlPageThreeStandardBtn) {
        Logger.error('TEST', `Component not found: pushUrlPageThreeStandardBtn0040`);
        throw new Error('Component not found: pushUrlPageThreeStandardBtn0040');
      }
      await pushUrlPageThreeStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0040_03');
      await Utils.sleep(1000);
      
      // 5.点击"replaceNamed pageOne Standard"按钮（不刷新pageOne页面，不回调OnNewParam）
      // 当前在routerPageThree0040，点击"back to main"按钮跳转到主入口页面，然后重新进入RouterScene0040
      let backToMainBtn = await driver.waitForComponent(ON.id('backToMainBtn0040'), 1000);
      Logger.info('TEST', `Found component: backToMainBtn0040`);
      if (!backToMainBtn) {
        Logger.error('TEST', `Component not found: backToMainBtn0040`);
        throw new Error('Component not found: backToMainBtn0040');
      }
      await backToMainBtn.click();
      await driver.waitForIdle(500, 2000);
      routerSceneBtn = await driver.waitForComponent(ON.id('routerSceneBtn0040'), 1000);
      if (!routerSceneBtn) {
        Logger.error('TEST', `Component not found: routerSceneBtn0040 after backToMain`);
        throw new Error('Component not found: routerSceneBtn0040');
      }
      await routerSceneBtn.click();
      await driver.waitForIdle(500, 2000);
      let replaceNamedPageOneStandardBtn = await driver.waitForComponent(ON.id('replaceNamedPageOneStandardBtn0040'), 1000);
      Logger.info('TEST', `Found component: replaceNamedPageOneStandardBtn0040`);
      if (!replaceNamedPageOneStandardBtn) {
        Logger.error('TEST', `Component not found: replaceNamedPageOneStandardBtn0040`);
        throw new Error('Component not found: replaceNamedPageOneStandardBtn0040');
      }
      await replaceNamedPageOneStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0040_04');
      await Utils.sleep(1000);
      
      // 6.点击"replaceNamed pageTwo Single"按钮（刷新pageTwo页面，回调OnNewParam）
      // replaceNamed替换了pageThree为pageOne，当前在routerPageOne0040（新）
      // 点击"back to main"按钮跳转到主入口页面，然后重新进入RouterScene0040
      backToMainBtn = await driver.waitForComponent(ON.id('backToMainBtn0040'), 1000);
      Logger.info('TEST', `Found component: backToMainBtn0040`);
      if (!backToMainBtn) {
        Logger.error('TEST', `Component not found: backToMainBtn0040`);
        throw new Error('Component not found: backToMainBtn0040');
      }
      await backToMainBtn.click();
      await driver.waitForIdle(500, 2000);
      routerSceneBtn = await driver.waitForComponent(ON.id('routerSceneBtn0040'), 1000);
      if (!routerSceneBtn) {
        Logger.error('TEST', `Component not found: routerSceneBtn0040 after backToMain`);
        throw new Error('Component not found: routerSceneBtn0040');
      }
      await routerSceneBtn.click();
      await driver.waitForIdle(500, 2000);
      let replaceNamedPageTwoSingleBtn = await driver.waitForComponent(ON.id('replaceNamedPageTwoSingleBtn0040'), 1000);
      Logger.info('TEST', `Found component: replaceNamedPageTwoSingleBtn0040`);
      if (!replaceNamedPageTwoSingleBtn) {
        Logger.error('TEST', `Component not found: replaceNamedPageTwoSingleBtn0040`);
        throw new Error('Component not found: replaceNamedPageTwoSingleBtn0040');
      }
      await replaceNamedPageTwoSingleBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0040_05');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0040 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0050
     * @tc.name   : Router单例跳转支持参数刷新回调OnNewParam(pushUrl callback接口测试)
     * @tc.desc   : Verify nav navigation onnewparam interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0050 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/onNewParam/0050/navigationOnNewParam0050')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Router组件场景"按钮
      let routerSceneBtn = await driver.waitForComponent(ON.id('routerSceneBtn0050'), 1000);
      Logger.info('TEST', `Found component: routerSceneBtn0050`);
      if (!routerSceneBtn) {
        Logger.error('TEST', `Component not found: routerSceneBtn0050`);
        throw new Error('Component not found: routerSceneBtn0050');
      }
      await routerSceneBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"pushUrl pageOne Standard"按钮
      let pushUrlPageOneStandardBtn = await driver.waitForComponent(ON.id('pushUrlPageOneStandardBtn0050'), 1000);
      Logger.info('TEST', `Found component: pushUrlPageOneStandardBtn0050`);
      if (!pushUrlPageOneStandardBtn) {
        Logger.error('TEST', `Component not found: pushUrlPageOneStandardBtn0050`);
        throw new Error('Component not found: pushUrlPageOneStandardBtn0050');
      }
      await pushUrlPageOneStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0050_01');
      await Utils.sleep(1000);
      
      // 3.点击"pushUrl pageTwo Standard"按钮
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let pushUrlPageTwoStandardBtn = await driver.waitForComponent(ON.id('pushUrlPageTwoStandardBtn0050'), 1000);
      Logger.info('TEST', `Found component: pushUrlPageTwoStandardBtn0050`);
      if (!pushUrlPageTwoStandardBtn) {
        Logger.error('TEST', `Component not found: pushUrlPageTwoStandardBtn0050`);
        throw new Error('Component not found: pushUrlPageTwoStandardBtn0050');
      }
      await pushUrlPageTwoStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0050_02');
      await Utils.sleep(1000);
      
      // 4.点击"pushUrl callback pageOne"按钮（不刷新pageOne页面，不回调OnNewParam）
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let pushUrlCallbackPageOneBtn = await driver.waitForComponent(ON.id('pushUrlCallbackPageOneBtn0050'), 1000);
      Logger.info('TEST', `Found component: pushUrlCallbackPageOneBtn0050`);
      if (!pushUrlCallbackPageOneBtn) {
        Logger.error('TEST', `Component not found: pushUrlCallbackPageOneBtn0050`);
        throw new Error('Component not found: pushUrlCallbackPageOneBtn0050');
      }
      await pushUrlCallbackPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0050_03');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0050 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0060
     * @tc.name   : Router单例跳转支持参数刷新回调OnNewParam(replaceNamedRoute callback接口测试)
     * @tc.desc   : Verify nav navigation onnewparam interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0060 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/onNewParam/0060/navigationOnNewParam0060')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Router组件场景"按钮
      let routerSceneBtn = await driver.waitForComponent(ON.id('routerSceneBtn0060'), 1000);
      Logger.info('TEST', `Found component: routerSceneBtn0060`);
      if (!routerSceneBtn) {
        Logger.error('TEST', `Component not found: routerSceneBtn0060`);
        throw new Error('Component not found: routerSceneBtn0060');
      }
      await routerSceneBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"pushUrl pageOne Standard"按钮
      let pushUrlPageOneStandardBtn = await driver.waitForComponent(ON.id('pushUrlPageOneStandardBtn0060'), 1000);
      Logger.info('TEST', `Found component: pushUrlPageOneStandardBtn0060`);
      if (!pushUrlPageOneStandardBtn) {
        Logger.error('TEST', `Component not found: pushUrlPageOneStandardBtn0060`);
        throw new Error('Component not found: pushUrlPageOneStandardBtn0060');
      }
      await pushUrlPageOneStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0060_01');
      await Utils.sleep(1000);
      
      // 3.点击"pushUrl pageTwo Standard"按钮
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let pushUrlPageTwoStandardBtn = await driver.waitForComponent(ON.id('pushUrlPageTwoStandardBtn0060'), 1000);
      Logger.info('TEST', `Found component: pushUrlPageTwoStandardBtn0060`);
      if (!pushUrlPageTwoStandardBtn) {
        Logger.error('TEST', `Component not found: pushUrlPageTwoStandardBtn0060`);
        throw new Error('Component not found: pushUrlPageTwoStandardBtn0060');
      }
      await pushUrlPageTwoStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0060_02');
      await Utils.sleep(1000);
      
      // 4.点击"replaceNamedRoute callback pageOne"按钮（不刷新pageOne页面，不回调OnNewParam）
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let replaceNamedRouteCallbackPageOneBtn = await driver.waitForComponent(ON.id('replaceNamedRouteCallbackPageOneBtn0060'), 1000);
      Logger.info('TEST', `Found component: replaceNamedRouteCallbackPageOneBtn0060`);
      if (!replaceNamedRouteCallbackPageOneBtn) {
        Logger.error('TEST', `Component not found: replaceNamedRouteCallbackPageOneBtn0060`);
        throw new Error('Component not found: replaceNamedRouteCallbackPageOneBtn0060');
      }
      await replaceNamedRouteCallbackPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0060_03');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0060 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0070
     * @tc.name   : Router单例跳转支持参数刷新回调OnNewParam(首次调用push single)
     * @tc.desc   : Verify nav navigation onnewparam interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0070 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/onNewParam/0070/navigationOnNewParam0070')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Router组件场景"按钮
      let routerSceneBtn = await driver.waitForComponent(ON.id('routerSceneBtn0070'), 1000);
      Logger.info('TEST', `Found component: routerSceneBtn0070`);
      if (!routerSceneBtn) {
        Logger.error('TEST', `Component not found: routerSceneBtn0070`);
        throw new Error('Component not found: routerSceneBtn0070');
      }
      await routerSceneBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"pushUrl pageOne Standard"按钮
      let pushUrlPageOneStandardBtn = await driver.waitForComponent(ON.id('pushUrlPageOneStandardBtn0070'), 1000);
      Logger.info('TEST', `Found component: pushUrlPageOneStandardBtn0070`);
      if (!pushUrlPageOneStandardBtn) {
        Logger.error('TEST', `Component not found: pushUrlPageOneStandardBtn0070`);
        throw new Error('Component not found: pushUrlPageOneStandardBtn0070');
      }
      await pushUrlPageOneStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0070_01');
      await Utils.sleep(1000);
      
      // 3.点击"pushUrl pageTwo Single"按钮（不刷新pageTwo页面，不回调OnNewParam）
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let pushUrlPageTwoSingleBtn = await driver.waitForComponent(ON.id('pushUrlPageTwoSingleBtn0070'), 1000);
      Logger.info('TEST', `Found component: pushUrlPageTwoSingleBtn0070`);
      if (!pushUrlPageTwoSingleBtn) {
        Logger.error('TEST', `Component not found: pushUrlPageTwoSingleBtn0070`);
        throw new Error('Component not found: pushUrlPageTwoSingleBtn0070');
      }
      await pushUrlPageTwoSingleBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0070_02');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0070 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0080
     * @tc.name   : Navigation单例跳转支持参数刷新回调OnNewParam(pushPath接口测试，触发场景)
     * @tc.desc   : Verify nav navigation onnewparam interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0080 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/onNewParam/0080/navigationOnNewParam0080')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation组件场景"按钮
      let navigationSceneBtn = await driver.waitForComponent(ON.id('navigationSceneBtn0080'), 1000);
      Logger.info('TEST', `Found component: navigationSceneBtn0080`);
      if (!navigationSceneBtn) {
        Logger.error('TEST', `Component not found: navigationSceneBtn0080`);
        throw new Error('Component not found: navigationSceneBtn0080');
      }
      await navigationSceneBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"pushPath pageOne STANDARD"按钮
      let pushPathPageOneStandardBtn = await driver.waitForComponent(ON.id('pushPathPageOneStandardBtn0080'), 1000);
      Logger.info('TEST', `Found component: pushPathPageOneStandardBtn0080`);
      if (!pushPathPageOneStandardBtn) {
        Logger.error('TEST', `Component not found: pushPathPageOneStandardBtn0080`);
        throw new Error('Component not found: pushPathPageOneStandardBtn0080');
      }
      await pushPathPageOneStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0080_01');
      await Utils.sleep(1000);
      
      // 3.点击"pushPath pageTwo STANDARD"按钮
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      await Utils.sleep(500);
      let pushPathPageTwoStandardBtn = await driver.waitForComponent(ON.id('pushPathPageTwoStandardBtn0080'), 2000);
      Logger.info('TEST', `Found component: pushPathPageTwoStandardBtn0080`);
      if (!pushPathPageTwoStandardBtn) {
        Logger.error('TEST', `Component not found: pushPathPageTwoStandardBtn0080`);
        throw new Error('Component not found: pushPathPageTwoStandardBtn0080');
      }
      await pushPathPageTwoStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0080_02');
      await Utils.sleep(1000);
      
      // 4.点击"pushPath pageOne MOVE_TO_TOP_SINGLETON"按钮（刷新pageOne页面，回调OnNewParam）
      // 从PageTwo0080按back，应该返回到NavigationScene0080内部的Navigation的初始状态
      // 如果找不到按钮，重新进入NavigationScene0080
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      await Utils.sleep(500);
      let pushPathPageOneMoveToTopSingletonBtn = await driver.waitForComponent(ON.id('pushPathPageOneMoveToTopSingletonBtn0080'), 1000);
      if (!pushPathPageOneMoveToTopSingletonBtn) {
        Logger.info('TEST', `Button not found after back, re-entering NavigationScene0080`);
        // 继续按back返回到主页面
        await driver.pressBack();
        await driver.waitForIdle(500, 2000);
        await Utils.sleep(500);
        // 重新进入NavigationScene0080
        let navigationSceneBtn = await driver.waitForComponent(ON.id('navigationSceneBtn0080'), 2000);
        if (!navigationSceneBtn) {
          Logger.error('TEST', `Component not found: navigationSceneBtn0080`);
          throw new Error('Component not found: navigationSceneBtn0080');
        }
        await navigationSceneBtn.click();
        await driver.waitForIdle(500, 2000);
        await Utils.sleep(500);
        // 再次查找按钮
        pushPathPageOneMoveToTopSingletonBtn = await driver.waitForComponent(ON.id('pushPathPageOneMoveToTopSingletonBtn0080'), 2000);
      }
      Logger.info('TEST', `Found component: pushPathPageOneMoveToTopSingletonBtn0080`);
      if (!pushPathPageOneMoveToTopSingletonBtn) {
        Logger.error('TEST', `Component not found: pushPathPageOneMoveToTopSingletonBtn0080`);
        throw new Error('Component not found: pushPathPageOneMoveToTopSingletonBtn0080');
      }
      await pushPathPageOneMoveToTopSingletonBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0080_03');
      await Utils.sleep(1000);
      
      // 5.点击"pushPath pageTwo POP_TO_SINGLETON"按钮（刷新pageTwo页面，回调OnNewParam）
      // 从PageOne0080按back，应该返回到NavigationScene0080内部的Navigation的初始状态
      // 如果找不到按钮，重新进入NavigationScene0080
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      await Utils.sleep(500);
      let pushPathPageTwoPopToSingletonBtn = await driver.waitForComponent(ON.id('pushPathPageTwoPopToSingletonBtn0080'), 1000);
      if (!pushPathPageTwoPopToSingletonBtn) {
        Logger.info('TEST', `Button not found after back, re-entering NavigationScene0080`);
        // 继续按back返回到主页面
        await driver.pressBack();
        await driver.waitForIdle(500, 2000);
        await Utils.sleep(500);
        // 重新进入NavigationScene0080
        let navigationSceneBtn = await driver.waitForComponent(ON.id('navigationSceneBtn0080'), 2000);
        if (!navigationSceneBtn) {
          Logger.error('TEST', `Component not found: navigationSceneBtn0080`);
          throw new Error('Component not found: navigationSceneBtn0080');
        }
        await navigationSceneBtn.click();
        await driver.waitForIdle(500, 2000);
        await Utils.sleep(500);
        // 再次查找按钮
        pushPathPageTwoPopToSingletonBtn = await driver.waitForComponent(ON.id('pushPathPageTwoPopToSingletonBtn0080'), 2000);
      }
      Logger.info('TEST', `Found component: pushPathPageTwoPopToSingletonBtn0080`);
      if (!pushPathPageTwoPopToSingletonBtn) {
        Logger.error('TEST', `Component not found: pushPathPageTwoPopToSingletonBtn0080`);
        throw new Error('Component not found: pushPathPageTwoPopToSingletonBtn0080');
      }
      await pushPathPageTwoPopToSingletonBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0080_04');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0080 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0090
     * @tc.name   : Navigation单例跳转支持参数刷新回调OnNewParam(pushPath接口测试，不触发场景)
     * @tc.desc   : Verify nav navigation onnewparam interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0090 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/onNewParam/0090/navigationOnNewParam0090')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation组件场景"按钮
      let navigationSceneBtn = await driver.waitForComponent(ON.id('navigationSceneBtn0090'), 1000);
      Logger.info('TEST', `Found component: navigationSceneBtn0090`);
      if (!navigationSceneBtn) {
        Logger.error('TEST', `Component not found: navigationSceneBtn0090`);
        throw new Error('Component not found: navigationSceneBtn0090');
      }
      await navigationSceneBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"pushPath pageOne STANDARD"按钮
      let pushPathPageOneStandardBtn = await driver.waitForComponent(ON.id('pushPathPageOneStandardBtn0090'), 1000);
      Logger.info('TEST', `Found component: pushPathPageOneStandardBtn0090`);
      if (!pushPathPageOneStandardBtn) {
        Logger.error('TEST', `Component not found: pushPathPageOneStandardBtn0090`);
        throw new Error('Component not found: pushPathPageOneStandardBtn0090');
      }
      await pushPathPageOneStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0090_01');
      await Utils.sleep(1000);
      
      // 3.返回NavigationScene0090，点击"pushPath pageOne NEW_INSTANCE"按钮（不刷新pageOne页面，不回调OnNewParam）
      // 从PageOne0090按back，应该返回到NavigationScene0090内部的Navigation的初始状态
      // 如果找不到按钮，重新进入NavigationScene0090
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      await Utils.sleep(500);
      let pushPathPageOneNewInstanceBtn = await driver.waitForComponent(ON.id('pushPathPageOneNewInstanceBtn0090'), 1000);
      if (!pushPathPageOneNewInstanceBtn) {
        Logger.info('TEST', `Button not found after back, re-entering NavigationScene0090`);
        // 继续按back返回到主页面
        await driver.pressBack();
        await driver.waitForIdle(500, 2000);
        await Utils.sleep(500);
        // 重新进入NavigationScene0090
        navigationSceneBtn = await driver.waitForComponent(ON.id('navigationSceneBtn0090'), 2000);
        if (!navigationSceneBtn) {
          Logger.error('TEST', `Component not found: navigationSceneBtn0090`);
          throw new Error('Component not found: navigationSceneBtn0090');
        }
        await navigationSceneBtn.click();
        await driver.waitForIdle(500, 2000);
        await Utils.sleep(500);
        // 再次查找按钮
        pushPathPageOneNewInstanceBtn = await driver.waitForComponent(ON.id('pushPathPageOneNewInstanceBtn0090'), 2000);
      }
      Logger.info('TEST', `Found component: pushPathPageOneNewInstanceBtn0090`);
      if (!pushPathPageOneNewInstanceBtn) {
        Logger.error('TEST', `Component not found: pushPathPageOneNewInstanceBtn0090`);
        throw new Error('Component not found: pushPathPageOneNewInstanceBtn0090');
      }
      await pushPathPageOneNewInstanceBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0090_02');
      await Utils.sleep(1000);
      
      // 4.返回NavigationScene0090，点击"pushPath pageOne STANDARD (2)"按钮（不刷新pageOne页面，不回调OnNewParam）
      // 从PageOne0090按back，应该返回到NavigationScene0090内部的Navigation的初始状态
      // 如果找不到按钮，重新进入NavigationScene0090
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      await Utils.sleep(500);
      let pushPathPageOneStandardBtn2 = await driver.waitForComponent(ON.id('pushPathPageOneStandardBtn0090_2'), 1000);
      if (!pushPathPageOneStandardBtn2) {
        Logger.info('TEST', `Button not found after back, re-entering NavigationScene0090`);
        // 继续按back返回到主页面
        await driver.pressBack();
        await driver.waitForIdle(500, 2000);
        await Utils.sleep(500);
        // 重新进入NavigationScene0090
        navigationSceneBtn = await driver.waitForComponent(ON.id('navigationSceneBtn0090'), 2000);
        if (!navigationSceneBtn) {
          Logger.error('TEST', `Component not found: navigationSceneBtn0090`);
          throw new Error('Component not found: navigationSceneBtn0090');
        }
        await navigationSceneBtn.click();
        await driver.waitForIdle(500, 2000);
        await Utils.sleep(500);
        // 再次查找按钮
        pushPathPageOneStandardBtn2 = await driver.waitForComponent(ON.id('pushPathPageOneStandardBtn0090_2'), 2000);
      }
      Logger.info('TEST', `Found component: pushPathPageOneStandardBtn0090_2`);
      if (!pushPathPageOneStandardBtn2) {
        Logger.error('TEST', `Component not found: pushPathPageOneStandardBtn0090_2`);
        throw new Error('Component not found: pushPathPageOneStandardBtn0090_2');
      }
      await pushPathPageOneStandardBtn2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0090_03');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0090 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0100
     * @tc.name   : Navigation单例跳转支持参数刷新回调OnNewParam(pushDestination接口测试)
     * @tc.desc   : Verify nav navigation onnewparam interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0100 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/onNewParam/0100/navigationOnNewParam0100')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation组件场景"按钮
      let navigationSceneBtn = await driver.waitForComponent(ON.id('navigationSceneBtn0100'), 1000);
      Logger.info('TEST', `Found component: navigationSceneBtn0100`);
      if (!navigationSceneBtn) {
        Logger.error('TEST', `Component not found: navigationSceneBtn0100`);
        throw new Error('Component not found: navigationSceneBtn0100');
      }
      await navigationSceneBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"pushDestination pageOne STANDARD"按钮
      let pushDestinationPageOneStandardBtn = await driver.waitForComponent(ON.id('pushDestinationPageOneStandardBtn0100'), 1000);
      Logger.info('TEST', `Found component: pushDestinationPageOneStandardBtn0100`);
      if (!pushDestinationPageOneStandardBtn) {
        Logger.error('TEST', `Component not found: pushDestinationPageOneStandardBtn0100`);
        throw new Error('Component not found: pushDestinationPageOneStandardBtn0100');
      }
      await pushDestinationPageOneStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0100_01');
      await Utils.sleep(1000);
      
      // 3.点击"pushDestination pageTwo STANDARD"按钮
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let pushDestinationPageTwoStandardBtn = await driver.waitForComponent(ON.id('pushDestinationPageTwoStandardBtn0100'), 1000);
      Logger.info('TEST', `Found component: pushDestinationPageTwoStandardBtn0100`);
      if (!pushDestinationPageTwoStandardBtn) {
        Logger.error('TEST', `Component not found: pushDestinationPageTwoStandardBtn0100`);
        throw new Error('Component not found: pushDestinationPageTwoStandardBtn0100');
      }
      await pushDestinationPageTwoStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0100_02');
      await Utils.sleep(1000);
      
      // 4.点击"pushDestination pageOne MOVE_TO_TOP_SINGLETON"按钮（刷新pageOne页面，回调OnNewParam）
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let pushDestinationPageOneMoveToTopSingletonBtn = await driver.waitForComponent(ON.id('pushDestinationPageOneMoveToTopSingletonBtn0100'), 1000);
      Logger.info('TEST', `Found component: pushDestinationPageOneMoveToTopSingletonBtn0100`);
      if (!pushDestinationPageOneMoveToTopSingletonBtn) {
        Logger.error('TEST', `Component not found: pushDestinationPageOneMoveToTopSingletonBtn0100`);
        throw new Error('Component not found: pushDestinationPageOneMoveToTopSingletonBtn0100');
      }
      await pushDestinationPageOneMoveToTopSingletonBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0100_03');
      await Utils.sleep(1000);
      
      // 5.点击"pushDestination pageTwo POP_TO_SINGLETON"按钮（刷新pageTwo页面，回调OnNewParam）
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let pushDestinationPageTwoPopToSingletonBtn = await driver.waitForComponent(ON.id('pushDestinationPageTwoPopToSingletonBtn0100'), 1000);
      Logger.info('TEST', `Found component: pushDestinationPageTwoPopToSingletonBtn0100`);
      if (!pushDestinationPageTwoPopToSingletonBtn) {
        Logger.error('TEST', `Component not found: pushDestinationPageTwoPopToSingletonBtn0100`);
        throw new Error('Component not found: pushDestinationPageTwoPopToSingletonBtn0100');
      }
      await pushDestinationPageTwoPopToSingletonBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0100_04');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0100 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0110
     * @tc.name   : Navigation单例跳转支持参数刷新回调OnNewParam(replacePath接口测试，触发场景)
     * @tc.desc   : Verify nav navigation onnewparam interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0110 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/onNewParam/0110/navigationOnNewParam0110')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation组件场景"按钮
      let navigationSceneBtn = await driver.waitForComponent(ON.id('navigationSceneBtn0110'), 1000);
      Logger.info('TEST', `Found component: navigationSceneBtn0110`);
      if (!navigationSceneBtn) {
        Logger.error('TEST', `Component not found: navigationSceneBtn0110`);
        throw new Error('Component not found: navigationSceneBtn0110');
      }
      await navigationSceneBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"pushPath pageOne STANDARD"按钮
      let pushPathPageOneStandardBtn = await driver.waitForComponent(ON.id('pushPathPageOneStandardBtn0110'), 1000);
      Logger.info('TEST', `Found component: pushPathPageOneStandardBtn0110`);
      if (!pushPathPageOneStandardBtn) {
        Logger.error('TEST', `Component not found: pushPathPageOneStandardBtn0110`);
        throw new Error('Component not found: pushPathPageOneStandardBtn0110');
      }
      await pushPathPageOneStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0110_01');
      await Utils.sleep(1000);
      
      // 3.点击"pushPath pageTwo STANDARD"按钮
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let pushPathPageTwoStandardBtn = await driver.waitForComponent(ON.id('pushPathPageTwoStandardBtn0110'), 1000);
      Logger.info('TEST', `Found component: pushPathPageTwoStandardBtn0110`);
      if (!pushPathPageTwoStandardBtn) {
        Logger.error('TEST', `Component not found: pushPathPageTwoStandardBtn0110`);
        throw new Error('Component not found: pushPathPageTwoStandardBtn0110');
      }
      await pushPathPageTwoStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0110_02');
      await Utils.sleep(1000);
      
      // 4.点击"replacePath pageOne MOVE_TO_TOP_SINGLETON"按钮（不刷新pageOne页面，不回调OnNewParam）
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let replacePathPageOneMoveToTopSingletonBtn = await driver.waitForComponent(ON.id('replacePathPageOneMoveToTopSingletonBtn0110'), 1000);
      Logger.info('TEST', `Found component: replacePathPageOneMoveToTopSingletonBtn0110`);
      if (!replacePathPageOneMoveToTopSingletonBtn) {
        Logger.error('TEST', `Component not found: replacePathPageOneMoveToTopSingletonBtn0110`);
        throw new Error('Component not found: replacePathPageOneMoveToTopSingletonBtn0110');
      }
      await replacePathPageOneMoveToTopSingletonBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0110_03');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0110 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0120
     * @tc.name   : Navigation单例跳转支持参数刷新回调OnNewParam(replaceDestination接口测试)
     * @tc.desc   : Verify nav navigation onnewparam interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0120 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/onNewParam/0120/navigationOnNewParam0120')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation组件场景"按钮
      let navigationSceneBtn = await driver.waitForComponent(ON.id('navigationSceneBtn0120'), 1000);
      Logger.info('TEST', `Found component: navigationSceneBtn0120`);
      if (!navigationSceneBtn) {
        Logger.error('TEST', `Component not found: navigationSceneBtn0120`);
        throw new Error('Component not found: navigationSceneBtn0120');
      }
      await navigationSceneBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"pushPath pageOne STANDARD"按钮
      let pushPathPageOneStandardBtn = await driver.waitForComponent(ON.id('pushPathPageOneStandardBtn0120'), 1000);
      Logger.info('TEST', `Found component: pushPathPageOneStandardBtn0120`);
      if (!pushPathPageOneStandardBtn) {
        Logger.error('TEST', `Component not found: pushPathPageOneStandardBtn0120`);
        throw new Error('Component not found: pushPathPageOneStandardBtn0120');
      }
      await pushPathPageOneStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0120_01');
      await Utils.sleep(1000);
      
      // 3.点击"pushPath pageTwo STANDARD"按钮
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let pushPathPageTwoStandardBtn = await driver.waitForComponent(ON.id('pushPathPageTwoStandardBtn0120'), 1000);
      Logger.info('TEST', `Found component: pushPathPageTwoStandardBtn0120`);
      if (!pushPathPageTwoStandardBtn) {
        Logger.error('TEST', `Component not found: pushPathPageTwoStandardBtn0120`);
        throw new Error('Component not found: pushPathPageTwoStandardBtn0120');
      }
      await pushPathPageTwoStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0120_02');
      await Utils.sleep(1000);
      
      // 4.点击"replaceDest pageOne MOVE_TO_TOP_SINGLETON"按钮（不刷新pageOne页面，不回调OnNewParam）
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let replaceDestPageOneMoveToTopSingletonBtn = await driver.waitForComponent(ON.id('replaceDestPageOneMoveToTopSingletonBtn0120'), 1000);
      Logger.info('TEST', `Found component: replaceDestPageOneMoveToTopSingletonBtn0120`);
      if (!replaceDestPageOneMoveToTopSingletonBtn) {
        Logger.error('TEST', `Component not found: replaceDestPageOneMoveToTopSingletonBtn0120`);
        throw new Error('Component not found: replaceDestPageOneMoveToTopSingletonBtn0120');
      }
      await replaceDestPageOneMoveToTopSingletonBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0120_03');
      await Utils.sleep(1000);
      
      // 5.点击"pushPath pageTwo STANDARD"按钮
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let pushPathPageTwoStandardBtn2 = await driver.waitForComponent(ON.id('pushPathPageTwoStandardBtn0120_2'), 1000);
      Logger.info('TEST', `Found component: pushPathPageTwoStandardBtn0120_2`);
      if (!pushPathPageTwoStandardBtn2) {
        Logger.error('TEST', `Component not found: pushPathPageTwoStandardBtn0120_2`);
        throw new Error('Component not found: pushPathPageTwoStandardBtn0120_2');
      }
      await pushPathPageTwoStandardBtn2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0120_04');
      await Utils.sleep(1000);
      
      // 6.点击"pushPath pageTwo STANDARD"按钮
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let pushPathPageTwoStandardBtn3 = await driver.waitForComponent(ON.id('pushPathPageTwoStandardBtn0120_3'), 1000);
      Logger.info('TEST', `Found component: pushPathPageTwoStandardBtn0120_3`);
      if (!pushPathPageTwoStandardBtn3) {
        Logger.error('TEST', `Component not found: pushPathPageTwoStandardBtn0120_3`);
        throw new Error('Component not found: pushPathPageTwoStandardBtn0120_3');
      }
      await pushPathPageTwoStandardBtn3.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0120_05');
      await Utils.sleep(1000);
      
      // 7.点击"replaceDest pageOne POP_TO_SINGLETON"按钮（不刷新pageOne页面，不回调OnNewParam）
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let replaceDestPageOnePopToSingletonBtn = await driver.waitForComponent(ON.id('replaceDestPageOnePopToSingletonBtn0120'), 1000);
      Logger.info('TEST', `Found component: replaceDestPageOnePopToSingletonBtn0120`);
      if (!replaceDestPageOnePopToSingletonBtn) {
        Logger.error('TEST', `Component not found: replaceDestPageOnePopToSingletonBtn0120`);
        throw new Error('Component not found: replaceDestPageOnePopToSingletonBtn0120');
      }
      await replaceDestPageOnePopToSingletonBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0120_06');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0120 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0130
     * @tc.name   : Navigation单例跳转支持参数刷新回调OnNewParam(replacePath接口测试，不触发场景)
     * @tc.desc   : Verify nav navigation onnewparam interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0130 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/onNewParam/0130/navigationOnNewParam0130')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation组件场景"按钮
      let navigationSceneBtn = await driver.waitForComponent(ON.id('navigationSceneBtn0130'), 1000);
      Logger.info('TEST', `Found component: navigationSceneBtn0130`);
      if (!navigationSceneBtn) {
        Logger.error('TEST', `Component not found: navigationSceneBtn0130`);
        throw new Error('Component not found: navigationSceneBtn0130');
      }
      await navigationSceneBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"pushPath pageOne STANDARD"按钮
      let pushPathPageOneStandardBtn = await driver.waitForComponent(ON.id('pushPathPageOneStandardBtn0130'), 1000);
      Logger.info('TEST', `Found component: pushPathPageOneStandardBtn0130`);
      if (!pushPathPageOneStandardBtn) {
        Logger.error('TEST', `Component not found: pushPathPageOneStandardBtn0130`);
        throw new Error('Component not found: pushPathPageOneStandardBtn0130');
      }
      await pushPathPageOneStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0130_01');
      await Utils.sleep(1000);
      
      // 3.点击"pushPath pageTwo STANDARD"按钮
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let pushPathPageTwoStandardBtn = await driver.waitForComponent(ON.id('pushPathPageTwoStandardBtn0130'), 1000);
      Logger.info('TEST', `Found component: pushPathPageTwoStandardBtn0130`);
      if (!pushPathPageTwoStandardBtn) {
        Logger.error('TEST', `Component not found: pushPathPageTwoStandardBtn0130`);
        throw new Error('Component not found: pushPathPageTwoStandardBtn0130');
      }
      await pushPathPageTwoStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0130_02');
      await Utils.sleep(1000);
      
      // 4.点击"replacePath pageOne STANDARD"按钮（不刷新pageOne页面，不回调OnNewParam）
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let replacePathPageOneStandardBtn = await driver.waitForComponent(ON.id('replacePathPageOneStandardBtn0130'), 1000);
      Logger.info('TEST', `Found component: replacePathPageOneStandardBtn0130`);
      if (!replacePathPageOneStandardBtn) {
        Logger.error('TEST', `Component not found: replacePathPageOneStandardBtn0130`);
        throw new Error('Component not found: replacePathPageOneStandardBtn0130');
      }
      await replacePathPageOneStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0130_03');
      await Utils.sleep(1000);
      
      // 5.点击"pushPath pageTwo STANDARD"按钮
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let pushPathPageTwoStandardBtn2 = await driver.waitForComponent(ON.id('pushPathPageTwoStandardBtn0130_2'), 1000);
      Logger.info('TEST', `Found component: pushPathPageTwoStandardBtn0130_2`);
      if (!pushPathPageTwoStandardBtn2) {
        Logger.error('TEST', `Component not found: pushPathPageTwoStandardBtn0130_2`);
        throw new Error('Component not found: pushPathPageTwoStandardBtn0130_2');
      }
      await pushPathPageTwoStandardBtn2.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0130_04');
      await Utils.sleep(1000);
      
      // 6.点击"pushPath pageTwo STANDARD"按钮
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let pushPathPageTwoStandardBtn3 = await driver.waitForComponent(ON.id('pushPathPageTwoStandardBtn0130_3'), 1000);
      Logger.info('TEST', `Found component: pushPathPageTwoStandardBtn0130_3`);
      if (!pushPathPageTwoStandardBtn3) {
        Logger.error('TEST', `Component not found: pushPathPageTwoStandardBtn0130_3`);
        throw new Error('Component not found: pushPathPageTwoStandardBtn0130_3');
      }
      await pushPathPageTwoStandardBtn3.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0130_05');
      await Utils.sleep(1000);
      
      // 7.点击"replacePath pageOne NEW_INSTANCE"按钮（不刷新pageOne页面，不回调OnNewParam）
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let replacePathPageOneNewInstanceBtn = await driver.waitForComponent(ON.id('replacePathPageOneNewInstanceBtn0130'), 1000);
      Logger.info('TEST', `Found component: replacePathPageOneNewInstanceBtn0130`);
      if (!replacePathPageOneNewInstanceBtn) {
        Logger.error('TEST', `Component not found: replacePathPageOneNewInstanceBtn0130`);
        throw new Error('Component not found: replacePathPageOneNewInstanceBtn0130');
      }
      await replacePathPageOneNewInstanceBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0130_06');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0130 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0140
     * @tc.name   : Navigation单例跳转支持参数刷新回调OnNewParam(moveIndexToTop接口测试)
     * @tc.desc   : Verify nav navigation onnewparam interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0140 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/onNewParam/0140/navigationOnNewParam0140')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation组件场景"按钮
      let navigationSceneBtn = await driver.waitForComponent(ON.id('navigationSceneBtn0140'), 1000);
      Logger.info('TEST', `Found component: navigationSceneBtn0140`);
      if (!navigationSceneBtn) {
        Logger.error('TEST', `Component not found: navigationSceneBtn0140`);
        throw new Error('Component not found: navigationSceneBtn0140');
      }
      await navigationSceneBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"pushPath pageOne STANDARD"按钮
      let pushPathPageOneStandardBtn = await driver.waitForComponent(ON.id('pushPathPageOneStandardBtn0140'), 1000);
      Logger.info('TEST', `Found component: pushPathPageOneStandardBtn0140`);
      if (!pushPathPageOneStandardBtn) {
        Logger.error('TEST', `Component not found: pushPathPageOneStandardBtn0140`);
        throw new Error('Component not found: pushPathPageOneStandardBtn0140');
      }
      await pushPathPageOneStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0140_01');
      await Utils.sleep(1000);
      
      // 3.点击"pushPath pageTwo STANDARD"按钮
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let pushPathPageTwoStandardBtn = await driver.waitForComponent(ON.id('pushPathPageTwoStandardBtn0140'), 1000);
      Logger.info('TEST', `Found component: pushPathPageTwoStandardBtn0140`);
      if (!pushPathPageTwoStandardBtn) {
        Logger.error('TEST', `Component not found: pushPathPageTwoStandardBtn0140`);
        throw new Error('Component not found: pushPathPageTwoStandardBtn0140');
      }
      await pushPathPageTwoStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0140_02');
      await Utils.sleep(1000);
      
      // 4.点击"moveIndexToTop 0"按钮（不刷新pageOne页面，不回调OnNewParam）
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let moveIndexToTop0Btn = await driver.waitForComponent(ON.id('moveIndexToTop0Btn0140'), 1000);
      Logger.info('TEST', `Found component: moveIndexToTop0Btn0140`);
      if (!moveIndexToTop0Btn) {
        Logger.error('TEST', `Component not found: moveIndexToTop0Btn0140`);
        throw new Error('Component not found: moveIndexToTop0Btn0140');
      }
      await moveIndexToTop0Btn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0140_03');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0140 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0150
     * @tc.name   : Navigation单例跳转支持参数刷新回调OnNewParam(pushPath接口测试，生命周期场景测试)
     * @tc.desc   : Verify nav navigation onnewparam interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0150 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/onNewParam/0150/navigationOnNewParam0150')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation组件场景"按钮
      let navigationSceneBtn = await driver.waitForComponent(ON.id('navigationSceneBtn0150'), 1000);
      Logger.info('TEST', `Found component: navigationSceneBtn0150`);
      if (!navigationSceneBtn) {
        Logger.error('TEST', `Component not found: navigationSceneBtn0150`);
        throw new Error('Component not found: navigationSceneBtn0150');
      }
      await navigationSceneBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"pushPath pageOne STANDARD"按钮
      let pushPathPageOneStandardBtn = await driver.waitForComponent(ON.id('pushPathPageOneStandardBtn0150'), 1000);
      Logger.info('TEST', `Found component: pushPathPageOneStandardBtn0150`);
      if (!pushPathPageOneStandardBtn) {
        Logger.error('TEST', `Component not found: pushPathPageOneStandardBtn0150`);
        throw new Error('Component not found: pushPathPageOneStandardBtn0150');
      }
      await pushPathPageOneStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0150_01');
      await Utils.sleep(1000);
      
      // 3.点击"pushPath pageTwo STANDARD"按钮
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let pushPathPageTwoStandardBtn = await driver.waitForComponent(ON.id('pushPathPageTwoStandardBtn0150'), 1000);
      Logger.info('TEST', `Found component: pushPathPageTwoStandardBtn0150`);
      if (!pushPathPageTwoStandardBtn) {
        Logger.error('TEST', `Component not found: pushPathPageTwoStandardBtn0150`);
        throw new Error('Component not found: pushPathPageTwoStandardBtn0150');
      }
      await pushPathPageTwoStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0150_02');
      await Utils.sleep(1000);
      
      // 4.点击"pushPath pageOne MOVE_TO_TOP_SINGLETON"按钮（刷新pageOne页面，回调OnNewParam，pageOne页面回调在onShow之前）
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let pushPathPageOneMoveToTopSingletonBtn = await driver.waitForComponent(ON.id('pushPathPageOneMoveToTopSingletonBtn0150'), 1000);
      Logger.info('TEST', `Found component: pushPathPageOneMoveToTopSingletonBtn0150`);
      if (!pushPathPageOneMoveToTopSingletonBtn) {
        Logger.error('TEST', `Component not found: pushPathPageOneMoveToTopSingletonBtn0150`);
        throw new Error('Component not found: pushPathPageOneMoveToTopSingletonBtn0150');
      }
      await pushPathPageOneMoveToTopSingletonBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0150_03');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0150 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0160
     * @tc.name   : Navigation单例跳转支持参数刷新回调OnNewParam(replacePath接口测试，生命周期场景测试)
     * @tc.desc   : Verify nav navigation onnewparam interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0160 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/onNewParam/0160/navigationOnNewParam0160')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation组件场景"按钮
      let navigationSceneBtn = await driver.waitForComponent(ON.id('navigationSceneBtn0160'), 1000);
      Logger.info('TEST', `Found component: navigationSceneBtn0160`);
      if (!navigationSceneBtn) {
        Logger.error('TEST', `Component not found: navigationSceneBtn0160`);
        throw new Error('Component not found: navigationSceneBtn0160');
      }
      await navigationSceneBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"pushPath pageOne STANDARD"按钮
      let pushPathPageOneStandardBtn = await driver.waitForComponent(ON.id('pushPathPageOneStandardBtn0160'), 1000);
      Logger.info('TEST', `Found component: pushPathPageOneStandardBtn0160`);
      if (!pushPathPageOneStandardBtn) {
        Logger.error('TEST', `Component not found: pushPathPageOneStandardBtn0160`);
        throw new Error('Component not found: pushPathPageOneStandardBtn0160');
      }
      await pushPathPageOneStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0160_01');
      await Utils.sleep(1000);
      
      // 3.点击"pushPath pageTwo STANDARD"按钮
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let pushPathPageTwoStandardBtn = await driver.waitForComponent(ON.id('pushPathPageTwoStandardBtn0160'), 1000);
      Logger.info('TEST', `Found component: pushPathPageTwoStandardBtn0160`);
      if (!pushPathPageTwoStandardBtn) {
        Logger.error('TEST', `Component not found: pushPathPageTwoStandardBtn0160`);
        throw new Error('Component not found: pushPathPageTwoStandardBtn0160');
      }
      await pushPathPageTwoStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0160_02');
      await Utils.sleep(1000);
      
      // 4.点击"replacePath pageOne MOVE_TO_TOP_SINGLETON"按钮（不刷新pageOne页面，不回调OnNewParam）
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let replacePathPageOneMoveToTopSingletonBtn = await driver.waitForComponent(ON.id('replacePathPageOneMoveToTopSingletonBtn0160'), 1000);
      Logger.info('TEST', `Found component: replacePathPageOneMoveToTopSingletonBtn0160`);
      if (!replacePathPageOneMoveToTopSingletonBtn) {
        Logger.error('TEST', `Component not found: replacePathPageOneMoveToTopSingletonBtn0160`);
        throw new Error('Component not found: replacePathPageOneMoveToTopSingletonBtn0160');
      }
      await replacePathPageOneMoveToTopSingletonBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0160_03');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0160 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0170
     * @tc.name   : Navigation单例跳转支持参数刷新回调OnNewParam(定义路由派生类场景)
     * @tc.desc   : Verify nav navigation onnewparam interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0170 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/onNewParam/0170/navigationOnNewParam0170')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation组件Derived测试场景"按钮
      let navigationDerivedSceneBtn = await driver.waitForComponent(ON.id('navigationDerivedSceneBtn0170'), 1000);
      Logger.info('TEST', `Found component: navigationDerivedSceneBtn0170`);
      if (!navigationDerivedSceneBtn) {
        Logger.error('TEST', `Component not found: navigationDerivedSceneBtn0170`);
        throw new Error('Component not found: navigationDerivedSceneBtn0170');
      }
      await navigationDerivedSceneBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"DerivedNavPathStack pushPath pageOne STANDARD"按钮
      let derivedPushPathPageOneStandardBtn = await driver.waitForComponent(ON.id('derivedPushPathPageOneStandardBtn0170'), 1000);
      Logger.info('TEST', `Found component: derivedPushPathPageOneStandardBtn0170`);
      if (!derivedPushPathPageOneStandardBtn) {
        Logger.error('TEST', `Component not found: derivedPushPathPageOneStandardBtn0170`);
        throw new Error('Component not found: derivedPushPathPageOneStandardBtn0170');
      }
      await derivedPushPathPageOneStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0170_01');
      await Utils.sleep(1000);
      
      // 3.点击"DerivedNavPathStack pushPath pageTwo STANDARD"按钮
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let derivedPushPathPageTwoStandardBtn = await driver.waitForComponent(ON.id('derivedPushPathPageTwoStandardBtn0170'), 1000);
      Logger.info('TEST', `Found component: derivedPushPathPageTwoStandardBtn0170`);
      if (!derivedPushPathPageTwoStandardBtn) {
        Logger.error('TEST', `Component not found: derivedPushPathPageTwoStandardBtn0170`);
        throw new Error('Component not found: derivedPushPathPageTwoStandardBtn0170');
      }
      await derivedPushPathPageTwoStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0170_02');
      await Utils.sleep(1000);
      
      // 4.点击"DerivedNavPathStack pushPath pageOne MOVE_TO_TOP_SINGLETON"按钮（刷新pageOne页面，回调OnNewParam）
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let derivedPushPathPageOneMoveToTopSingletonBtn = await driver.waitForComponent(ON.id('derivedPushPathPageOneMoveToTopSingletonBtn0170'), 1000);
      Logger.info('TEST', `Found component: derivedPushPathPageOneMoveToTopSingletonBtn0170`);
      if (!derivedPushPathPageOneMoveToTopSingletonBtn) {
        Logger.error('TEST', `Component not found: derivedPushPathPageOneMoveToTopSingletonBtn0170`);
        throw new Error('Component not found: derivedPushPathPageOneMoveToTopSingletonBtn0170');
      }
      await derivedPushPathPageOneMoveToTopSingletonBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0170_03');
      await Utils.sleep(1000);
      
      // 5.点击"DerivedNavPathStack pushPath pageTwo POP_TO_SINGLETON"按钮（刷新pageTwo页面，回调OnNewParam）
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let derivedPushPathPageTwoPopToSingletonBtn = await driver.waitForComponent(ON.id('derivedPushPathPageTwoPopToSingletonBtn0170'), 1000);
      Logger.info('TEST', `Found component: derivedPushPathPageTwoPopToSingletonBtn0170`);
      if (!derivedPushPathPageTwoPopToSingletonBtn) {
        Logger.error('TEST', `Component not found: derivedPushPathPageTwoPopToSingletonBtn0170`);
        throw new Error('Component not found: derivedPushPathPageTwoPopToSingletonBtn0170');
      }
      await derivedPushPathPageTwoPopToSingletonBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0170_04');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0170 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0180
     * @tc.name   : Navigation单例跳转支持参数刷新回调OnNewParam(OnReady场景)
     * @tc.desc   : Verify nav navigation onnewparam interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0180 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/onNewParam/0180/navigationOnNewParam0180')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation组件场景"按钮
      let navigationSceneBtn = await driver.waitForComponent(ON.id('navigationSceneBtn0180'), 1000);
      Logger.info('TEST', `Found component: navigationSceneBtn0180`);
      if (!navigationSceneBtn) {
        Logger.error('TEST', `Component not found: navigationSceneBtn0180`);
        throw new Error('Component not found: navigationSceneBtn0180');
      }
      await navigationSceneBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"OnReady pageOne STANDARD"按钮
      let onReadyPageOneStandardBtn = await driver.waitForComponent(ON.id('onReadyPageOneStandardBtn0180'), 1000);
      Logger.info('TEST', `Found component: onReadyPageOneStandardBtn0180`);
      if (!onReadyPageOneStandardBtn) {
        Logger.error('TEST', `Component not found: onReadyPageOneStandardBtn0180`);
        throw new Error('Component not found: onReadyPageOneStandardBtn0180');
      }
      await onReadyPageOneStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0180_01');
      await Utils.sleep(1000);
      
      // 3.点击"OnReady pageTwo STANDARD"按钮
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let onReadyPageTwoStandardBtn = await driver.waitForComponent(ON.id('onReadyPageTwoStandardBtn0180'), 1000);
      Logger.info('TEST', `Found component: onReadyPageTwoStandardBtn0180`);
      if (!onReadyPageTwoStandardBtn) {
        Logger.error('TEST', `Component not found: onReadyPageTwoStandardBtn0180`);
        throw new Error('Component not found: onReadyPageTwoStandardBtn0180');
      }
      await onReadyPageTwoStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0180_02');
      await Utils.sleep(1000);
      
      // 4.点击"OnReady pageOne MOVE_TO_TOP_SINGLETON"按钮（刷新pageOne页面，回调OnNewParam）
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let onReadyPageOneMoveToTopSingletonBtn = await driver.waitForComponent(ON.id('onReadyPageOneMoveToTopSingletonBtn0180'), 1000);
      Logger.info('TEST', `Found component: onReadyPageOneMoveToTopSingletonBtn0180`);
      if (!onReadyPageOneMoveToTopSingletonBtn) {
        Logger.error('TEST', `Component not found: onReadyPageOneMoveToTopSingletonBtn0180`);
        throw new Error('Component not found: onReadyPageOneMoveToTopSingletonBtn0180');
      }
      await onReadyPageOneMoveToTopSingletonBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0180_03');
      await Utils.sleep(1000);
      
      // 5.点击"OnReady pageTwo POP_TO_SINGLETON"按钮（刷新pageTwo页面，回调OnNewParam）
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let onReadyPageTwoPopToSingletonBtn = await driver.waitForComponent(ON.id('onReadyPageTwoPopToSingletonBtn0180'), 1000);
      Logger.info('TEST', `Found component: onReadyPageTwoPopToSingletonBtn0180`);
      if (!onReadyPageTwoPopToSingletonBtn) {
        Logger.error('TEST', `Component not found: onReadyPageTwoPopToSingletonBtn0180`);
        throw new Error('Component not found: onReadyPageTwoPopToSingletonBtn0180');
      }
      await onReadyPageTwoPopToSingletonBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0180_04');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0180 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0190
     * @tc.name   : Navigation单例跳转支持参数刷新回调OnNewParam(aboutToAppear场景)
     * @tc.desc   : Verify nav navigation onnewparam interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0190 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/onNewParam/0190/navigationOnNewParam0190')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation组件场景"按钮
      let navigationSceneBtn = await driver.waitForComponent(ON.id('navigationSceneBtn0190'), 1000);
      Logger.info('TEST', `Found component: navigationSceneBtn0190`);
      if (!navigationSceneBtn) {
        Logger.error('TEST', `Component not found: navigationSceneBtn0190`);
        throw new Error('Component not found: navigationSceneBtn0190');
      }
      await navigationSceneBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 2.点击"pushPath pageOne STANDARD"按钮
      let pushPathPageOneStandardBtn = await driver.waitForComponent(ON.id('pushPathPageOneStandardBtn0190'), 1000);
      Logger.info('TEST', `Found component: pushPathPageOneStandardBtn0190`);
      if (!pushPathPageOneStandardBtn) {
        Logger.error('TEST', `Component not found: pushPathPageOneStandardBtn0190`);
        throw new Error('Component not found: pushPathPageOneStandardBtn0190');
      }
      await pushPathPageOneStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0190_01');
      await Utils.sleep(1000);
      
      // 3.点击"pushPath pageTwo STANDARD"按钮
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let pushPathPageTwoStandardBtn = await driver.waitForComponent(ON.id('pushPathPageTwoStandardBtn0190'), 1000);
      Logger.info('TEST', `Found component: pushPathPageTwoStandardBtn0190`);
      if (!pushPathPageTwoStandardBtn) {
        Logger.error('TEST', `Component not found: pushPathPageTwoStandardBtn0190`);
        throw new Error('Component not found: pushPathPageTwoStandardBtn0190');
      }
      await pushPathPageTwoStandardBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0190_02');
      await Utils.sleep(1000);
      
      // 4.点击"aboutToAppear pageOne MOVE_TO_TOP_SINGLETON"按钮（刷新pageOne页面，回调OnNewParam）
      await driver.pressBack();
      await driver.waitForIdle(500, 2000);
      let aboutToAppearPageOneMoveToTopSingletonBtn = await driver.waitForComponent(ON.id('aboutToAppearPageOneMoveToTopSingletonBtn0190'), 1000);
      Logger.info('TEST', `Found component: aboutToAppearPageOneMoveToTopSingletonBtn0190`);
      if (!aboutToAppearPageOneMoveToTopSingletonBtn) {
        Logger.error('TEST', `Component not found: aboutToAppearPageOneMoveToTopSingletonBtn0190`);
        throw new Error('Component not found: aboutToAppearPageOneMoveToTopSingletonBtn0190');
      }
      await aboutToAppearPageOneMoveToTopSingletonBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0190_03');
      await Utils.sleep(1000);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ONNEWPARAM_0190 finish.`);
      done();
    })
  })
}
