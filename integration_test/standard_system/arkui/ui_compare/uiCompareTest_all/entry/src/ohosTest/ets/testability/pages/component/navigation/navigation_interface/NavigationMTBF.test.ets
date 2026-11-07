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
import Settings from '../../../../../test/model/Settings.ets';
import windowSnap from '../../../../../test/model/snapShot.ets';
import Logger from '../../../../../test/model/Logger.ts';
import Utils from '../../../../../test/model/Utils.ets';
import { Driver, ON, Component } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';

export default function navigationMTBFTest() {

  describe('navigationMTBFTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0010
     * @tc.name   : Navigation组件页面跳转测试（pushPath + pop场景）
     * @tc.desc   : Navigation组件页面跳转测试（pushPath + pop场景）
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0010 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigationMTBF01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.打开demo，进入"页面切换"页面
      // 2.点击"pushPath pageOne"按钮
      let pushPathPageOneBtn = await driver.findComponent(ON.id('pushPathPageOneBtn'));
      await pushPathPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0010_01');
      await Utils.sleep(500);
      
      // 3.点击"pop"按钮
      let popBtn = await driver.findComponent(ON.id('popBtn'));
      await popBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0010_02');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0020
     * @tc.name   : Navigation组件页面跳转测试（pushPath + popToName场景）
     * @tc.desc   : Navigation组件页面跳转测试（pushPath + popToName场景）
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0020 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigationMTBF02')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.打开demo，进入"页面切换"页面
      // 2.点击"pushPath pageOne"按钮
      let pushPathPageOneBtn = await driver.findComponent(ON.id('pushPathPageOneBtn'));
      await pushPathPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0020_01');
      await Utils.sleep(500);
      
      // 3.点击"pushPath pageTwo"按钮
      let pushPathPageTwoBtn = await driver.findComponent(ON.id('pushPathPageTwoBtn'));
      await pushPathPageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0020_02');
      await Utils.sleep(500);
      
      // 4.点击"popToName pageOne"按钮
      let popToNamePageOneBtn = await driver.findComponent(ON.id('popToNamePageOneBtn'));
      await popToNamePageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0020_03');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0030
     * @tc.name   : Navigation组件页面跳转测试（pushPath + popToIndex场景）
     * @tc.desc   : Navigation组件页面跳转测试（pushPath + popToIndex场景）
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0030 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigationMTBF03')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.打开demo，进入"页面切换"页面
      // 2.点击"pushPath pageOne"按钮
      let pushPathPageOneBtn = await driver.findComponent(ON.id('pushPathPageOneBtn'));
      await pushPathPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0030_01');
      await Utils.sleep(500);
      
      // 3.点击"pushPath pageTwo"按钮
      let pushPathPageTwoBtn = await driver.findComponent(ON.id('pushPathPageTwoBtn'));
      await pushPathPageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0030_02');
      await Utils.sleep(500);
      
      // 4.点击"popToIndex 0"按钮
      let popToIndex0Btn = await driver.findComponent(ON.id('popToIndex0Btn'));
      await popToIndex0Btn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0030_03');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0040
     * @tc.name   : Navigation组件页面跳转测试（pushPathByName + pop场景）
     * @tc.desc   : Navigation组件页面跳转测试（pushPathByName + pop场景）
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0040 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigationMTBF04')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.打开demo，进入"页面切换"页面
      // 2.点击"pushPathByName pageOne"按钮
      let pushPathByNamePageOneBtn = await driver.findComponent(ON.id('pushPathByNamePageOneBtn'));
      await pushPathByNamePageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0040_01');
      await Utils.sleep(500);
      
      // 3.点击"pop"按钮
      let popBtn = await driver.findComponent(ON.id('popBtn'));
      await popBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0040_02');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0050
     * @tc.name   : Navigation组件页面跳转测试（pushPathByName + popToName场景）
     * @tc.desc   : Navigation组件页面跳转测试（pushPathByName + popToName场景）
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0050 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigationMTBF05')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.打开demo，进入"页面切换"页面
      // 2.点击"pushPathByName pageOne"按钮
      let pushPathByNamePageOneBtn = await driver.findComponent(ON.id('pushPathByNamePageOneBtn'));
      await pushPathByNamePageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0050_01');
      await Utils.sleep(500);
      
      // 3.点击"pushPathByName pageTwo"按钮
      let pushPathByNamePageTwoBtn = await driver.findComponent(ON.id('pushPathByNamePageTwoBtn'));
      await pushPathByNamePageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0050_02');
      await Utils.sleep(500);
      
      // 4.点击"popToName pageOne"按钮
      let popToNamePageOneBtn = await driver.findComponent(ON.id('popToNamePageOneBtn'));
      await popToNamePageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0050_03');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0060
     * @tc.name   : Navigation组件页面跳转测试（pushPathByName + popToIndex场景）
     * @tc.desc   : Navigation组件页面跳转测试（pushPathByName + popToIndex场景）
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0060 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigationMTBF06')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.打开demo，进入"页面切换"页面
      // 2.点击"pushPathByName pageOne"按钮
      let pushPathByNamePageOneBtn = await driver.findComponent(ON.id('pushPathByNamePageOneBtn'));
      await pushPathByNamePageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0060_01');
      await Utils.sleep(500);
      
      // 3.点击"pushPathByName pageTwo"按钮
      let pushPathByNamePageTwoBtn = await driver.findComponent(ON.id('pushPathByNamePageTwoBtn'));
      await pushPathByNamePageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0060_02');
      await Utils.sleep(500);
      
      // 4.点击"popToIndex 0"按钮
      let popToIndex0Btn = await driver.findComponent(ON.id('popToIndex0Btn'));
      await popToIndex0Btn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0060_03');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0070
     * @tc.name   : Navigation组件页面跳转测试（pushDestination + pop场景）
     * @tc.desc   : Navigation组件页面跳转测试（pushDestination + pop场景）
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0070 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigationMTBF07')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.打开demo，进入"页面切换"页面
      // 2.点击"pushDestination pageOne"按钮
      let pushDestinationPageOneBtn = await driver.findComponent(ON.id('pushDestinationPageOneBtn'));
      await pushDestinationPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0070_01');
      await Utils.sleep(500);
      
      // 3.点击"pop"按钮
      let popBtn = await driver.findComponent(ON.id('popBtn'));
      await popBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0070_02');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0080
     * @tc.name   : Navigation组件页面跳转测试（pushDestination + popToName场景）
     * @tc.desc   : Navigation组件页面跳转测试（pushDestination + popToName场景）
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0080 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigationMTBF08')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.打开demo，进入"页面切换"页面
      // 2.点击"pushDestination pageOne"按钮
      let pushDestinationPageOneBtn = await driver.findComponent(ON.id('pushDestinationPageOneBtn'));
      await pushDestinationPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0080_01');
      await Utils.sleep(500);
      
      // 3.点击"pushDestination pageTwo"按钮
      let pushDestinationPageTwoBtn = await driver.findComponent(ON.id('pushDestinationPageTwoBtn'));
      await pushDestinationPageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0080_02');
      await Utils.sleep(500);
      
      // 4.点击"popToName pageOne"按钮
      let popToNamePageOneBtn = await driver.findComponent(ON.id('popToNamePageOneBtn'));
      await popToNamePageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0080_03');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0090
     * @tc.name   : Navigation组件页面跳转测试（pushDestination + popToIndex场景）
     * @tc.desc   : Navigation组件页面跳转测试（pushDestination + popToIndex场景）
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0090 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigationMTBF09')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.打开demo，进入"页面切换"页面
      // 2.点击"pushDestination pageOne"按钮
      let pushDestinationPageOneBtn = await driver.findComponent(ON.id('pushDestinationPageOneBtn'));
      await pushDestinationPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0090_01');
      await Utils.sleep(500);
      
      // 3.点击"pushDestination pageTwo"按钮
      let pushDestinationPageTwoBtn = await driver.findComponent(ON.id('pushDestinationPageTwoBtn'));
      await pushDestinationPageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0090_02');
      await Utils.sleep(500);
      
      // 4.点击"popToIndex 0"按钮
      let popToIndex0Btn = await driver.findComponent(ON.id('popToIndex0Btn'));
      await popToIndex0Btn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0090_03');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0100
     * @tc.name   : Navigation组件页面跳转测试（pushDestinationByName + pop场景）
     * @tc.desc   : Navigation组件页面跳转测试（pushDestinationByName + pop场景）
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0100 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigationMTBF10')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.打开demo，进入"页面切换"页面
      // 2.点击"pushDestinationByName pageOne"按钮
      let pushDestinationByNamePageOneBtn = await driver.findComponent(ON.id('pushDestinationByNamePageOneBtn'));
      await pushDestinationByNamePageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0100_01');
      await Utils.sleep(500);
      
      // 3.点击"pop"按钮
      let popBtn = await driver.findComponent(ON.id('popBtn'));
      await popBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0100_02');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0110
     * @tc.name   : Navigation组件页面跳转测试（pushDestinationByName + popToName场景）
     * @tc.desc   : Navigation组件页面跳转测试（pushDestinationByName + popToName场景）
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0110 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigationMTBF11')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.打开demo，进入"页面切换"页面
      // 2.点击"pushDestinationByName pageOne"按钮
      let pushDestinationByNamePageOneBtn = await driver.findComponent(ON.id('pushDestinationByNamePageOneBtn'));
      await pushDestinationByNamePageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0110_01');
      await Utils.sleep(500);
      
      // 3.点击"pushDestinationByName pageTwo"按钮
      let pushDestinationByNamePageTwoBtn = await driver.findComponent(ON.id('pushDestinationByNamePageTwoBtn'));
      await pushDestinationByNamePageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0110_02');
      await Utils.sleep(500);
      
      // 4.点击"popToName pageOne"按钮
      let popToNamePageOneBtn = await driver.findComponent(ON.id('popToNamePageOneBtn'));
      await popToNamePageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0110_03');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0120
     * @tc.name   : Navigation组件页面跳转测试（pushDestinationByName + popToIndex场景）
     * @tc.desc   : Navigation组件页面跳转测试（pushDestinationByName + popToIndex场景）
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0120 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigationMTBF12')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.打开demo，进入"页面切换"页面
      // 2.点击"pushDestinationByName pageOne"按钮
      let pushDestinationByNamePageOneBtn = await driver.findComponent(ON.id('pushDestinationByNamePageOneBtn'));
      await pushDestinationByNamePageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0120_01');
      await Utils.sleep(500);
      
      // 3.点击"pushDestinationByName pageTwo"按钮
      let pushDestinationByNamePageTwoBtn = await driver.findComponent(ON.id('pushDestinationByNamePageTwoBtn'));
      await pushDestinationByNamePageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0120_02');
      await Utils.sleep(500);
      
      // 4.点击"popToIndex 0"按钮
      let popToIndex0Btn = await driver.findComponent(ON.id('popToIndex0Btn'));
      await popToIndex0Btn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0120_03');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0130
     * @tc.name   : Navigation组件页面跳转测试（replacePath场景）
     * @tc.desc   : Navigation组件页面跳转测试（replacePath场景）
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0130 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigationMTBF13')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.打开demo，进入"页面切换"页面
      // 2.点击"pushPath pageOne"按钮
      let pushPathPageOneBtn = await driver.findComponent(ON.id('pushPathPageOneBtn'));
      await pushPathPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0130_01');
      await Utils.sleep(500);
      
      // 3.点击"pop"按钮返回主页面
      let popBtn = await driver.findComponent(ON.id('popBtn'));
      await popBtn.click();
      await driver.waitForIdle(500, 2000);
      await Utils.sleep(500);
      
      // 4.点击"pushPath pageTwo"按钮
      let pushPathPageTwoBtn = await driver.findComponent(ON.id('pushPathPageTwoBtn'));
      await pushPathPageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0130_02');
      await Utils.sleep(500);
      
      // 5.点击"replacePath pageOne"按钮
      let replacePathPageOneBtn = await driver.findComponent(ON.id('replacePathPageOneBtn'));
      await replacePathPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0130_03');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0140
     * @tc.name   : Navigation组件页面跳转测试（replacePathByName场景）
     * @tc.desc   : Navigation组件页面跳转测试（replacePathByName场景）
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0140 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigationMTBF14')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.打开demo，进入"页面切换"页面
      // 2.点击"pushPath pageOne"按钮
      let pushPathPageOneBtn = await driver.findComponent(ON.id('pushPathPageOneBtn'));
      await pushPathPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0140_01');
      await Utils.sleep(500);
      
      // 3.点击"pushPath pageTwo"按钮
      let pushPathPageTwoBtn = await driver.findComponent(ON.id('pushPathPageTwoBtn'));
      await pushPathPageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0140_02');
      await Utils.sleep(500);
      
      // 4.点击"replacePathByName pageOne"按钮
      let replacePathByNamePageOneBtn = await driver.findComponent(ON.id('replacePathByNamePageOneBtn'));
      await replacePathByNamePageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0140_03');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0150
     * @tc.name   : Navigation组件页面跳转测试（moveIndexToTop + pushPath场景）
     * @tc.desc   : Navigation组件页面跳转测试（moveIndexToTop + pushPath场景）
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0150 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigationMTBF15')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.打开demo，进入"页面切换"页面
      // 2.点击"pushPath pageOne"按钮
      let pushPathPageOneBtn = await driver.findComponent(ON.id('pushPathPageOneBtn'));
      await pushPathPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0150_01');
      await Utils.sleep(500);
      
      // 3.点击"pushPath pageTwo"按钮
      let pushPathPageTwoBtn = await driver.findComponent(ON.id('pushPathPageTwoBtn'));
      await pushPathPageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0150_02');
      await Utils.sleep(500);
      
      // 4.点击"moveIndexToTop 0"按钮
      let moveIndexToTop0Btn = await driver.findComponent(ON.id('moveIndexToTop0Btn'));
      await moveIndexToTop0Btn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0150_03');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0160
     * @tc.name   : Navigation组件页面跳转测试（moveIndexToTop + pushPathByName场景）
     * @tc.desc   : Navigation组件页面跳转测试（moveIndexToTop + pushPathByName场景）
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0160 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigationMTBF16')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.打开demo，进入"页面切换"页面
      // 2.点击"pushPathByName pageOne"按钮
      let pushPathByNamePageOneBtn = await driver.findComponent(ON.id('pushPathByNamePageOneBtn'));
      await pushPathByNamePageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0160_01');
      await Utils.sleep(500);
      
      // 3.点击"pushPathByName pageTwo"按钮
      let pushPathByNamePageTwoBtn = await driver.findComponent(ON.id('pushPathByNamePageTwoBtn'));
      await pushPathByNamePageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0160_02');
      await Utils.sleep(500);
      
      // 4.点击"moveIndexToTop 0"按钮
      let moveIndexToTop0Btn = await driver.findComponent(ON.id('moveIndexToTop0Btn'));
      await moveIndexToTop0Btn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0160_03');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0170
     * @tc.name   : Navigation组件页面跳转测试（moveIndexToTop + pushDestination场景）
     * @tc.desc   : Navigation组件页面跳转测试（moveIndexToTop + pushDestination场景）
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0170 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigationMTBF17')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.打开demo，进入"页面切换"页面
      // 2.点击"pushDestination pageOne"按钮
      let pushDestinationPageOneBtn = await driver.findComponent(ON.id('pushDestinationPageOneBtn'));
      await pushDestinationPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0170_01');
      await Utils.sleep(500);
      
      // 3.点击"pushDestination pageTwo"按钮
      let pushDestinationPageTwoBtn = await driver.findComponent(ON.id('pushDestinationPageTwoBtn'));
      await pushDestinationPageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0170_02');
      await Utils.sleep(500);
      
      // 4.点击"moveIndexToTop 0"按钮
      let moveIndexToTop0Btn = await driver.findComponent(ON.id('moveIndexToTop0Btn'));
      await moveIndexToTop0Btn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0170_03');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0180
     * @tc.name   : Navigation组件页面跳转测试（moveIndexToTop + pushDestinationByName场景）
     * @tc.desc   : Navigation组件页面跳转测试（moveIndexToTop + pushDestinationByName场景）
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0180 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigationMTBF18')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.打开demo，进入"页面切换"页面
      // 2.点击"pushDestinationByName pageOne"按钮
      let pushDestinationByNamePageOneBtn = await driver.findComponent(ON.id('pushDestinationByNamePageOneBtn'));
      await pushDestinationByNamePageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0180_01');
      await Utils.sleep(500);
      
      // 3.点击"pushDestinationByName pageTwo"按钮
      let pushDestinationByNamePageTwoBtn = await driver.findComponent(ON.id('pushDestinationByNamePageTwoBtn'));
      await pushDestinationByNamePageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0180_02');
      await Utils.sleep(500);
      
      // 4.点击"moveIndexToTop 0"按钮
      let moveIndexToTop0Btn = await driver.findComponent(ON.id('moveIndexToTop0Btn'));
      await moveIndexToTop0Btn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0180_03');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0200
     * @tc.name   : Navigation组件页面跳转测试（moveToTop + pushPathByName场景）
     * @tc.desc   : Navigation组件页面跳转测试（moveToTop + pushPathByName场景）
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0200 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigationMTBF20')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.打开demo，进入"页面切换"页面
      // 2.点击"pushPathByName pageOne"按钮
      let pushPathByNamePageOneBtn = await driver.findComponent(ON.id('pushPathByNamePageOneBtn'));
      await pushPathByNamePageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0200_01');
      await Utils.sleep(500);
      
      // 3.点击"pushPathByName pageTwo"按钮
      let pushPathByNamePageTwoBtn = await driver.findComponent(ON.id('pushPathByNamePageTwoBtn'));
      await pushPathByNamePageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0200_02');
      await Utils.sleep(500);
      
      // 4.点击"moveToTop pageOne"按钮
      let moveToTopPageOneBtn = await driver.findComponent(ON.id('moveToTopPageOneBtn'));
      await moveToTopPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0200_03');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0210
     * @tc.name   : Navigation组件页面跳转测试（moveToTop + pushDestination场景）
     * @tc.desc   : Navigation组件页面跳转测试（moveToTop + pushDestination场景）
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0210 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigationMTBF21')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.打开demo，进入"页面切换"页面
      // 2.点击"pushDestination pageOne"按钮
      let pushDestinationPageOneBtn = await driver.findComponent(ON.id('pushDestinationPageOneBtn'));
      await pushDestinationPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0210_01');
      await Utils.sleep(500);
      
      // 3.点击"pushDestination pageTwo"按钮
      let pushDestinationPageTwoBtn = await driver.findComponent(ON.id('pushDestinationPageTwoBtn'));
      await pushDestinationPageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0210_02');
      await Utils.sleep(500);
      
      // 4.点击"moveToTop pageOne"按钮
      let moveToTopPageOneBtn = await driver.findComponent(ON.id('moveToTopPageOneBtn'));
      await moveToTopPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0210_03');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0220
     * @tc.name   : Navigation组件页面跳转测试（moveToTop + pushDestinationByName场景）
     * @tc.desc   : Navigation组件页面跳转测试（moveToTop + pushDestinationByName场景）
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0220 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigationMTBF22')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.打开demo，进入"页面切换"页面
      // 2.点击"pushDestinationByName pageOne"按钮
      let pushDestinationByNamePageOneBtn = await driver.findComponent(ON.id('pushDestinationByNamePageOneBtn'));
      await pushDestinationByNamePageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0220_01');
      await Utils.sleep(500);
      
      // 3.点击"pushDestinationByName pageTwo"按钮
      let pushDestinationByNamePageTwoBtn = await driver.findComponent(ON.id('pushDestinationByNamePageTwoBtn'));
      await pushDestinationByNamePageTwoBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0220_02');
      await Utils.sleep(500);
      
      // 4.点击"moveToTop pageOne"按钮
      let moveToTopPageOneBtn = await driver.findComponent(ON.id('moveToTopPageOneBtn'));
      await moveToTopPageOneBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0220_03');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0270
     * @tc.name   : Navigation组件页面跳转测试（动效打断场景）
     * @tc.desc   : Navigation组件页面跳转测试（动效打断场景）
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0270 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navigationMTBF27')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.打开demo，进入"页面切换"页面
      // 2.点击"pushPath pageOne"按钮，200ms后点击"pop"按钮
      let pushPathPageOneBtn = await driver.findComponent(ON.id('pushPathPageOneBtn'));
      await pushPathPageOneBtn.click();
      await Utils.sleep(200);
      
      let popBtn = await driver.findComponent(ON.id('popBtn'));
      await popBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0270_01');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_MTBF_0270 finish.`);
      done()
    })

  })
}
