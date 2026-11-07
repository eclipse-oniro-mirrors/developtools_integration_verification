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

export default function navigationInterfaceFalseTest() {

  describe('navigationInterfaceFalseTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0010
     * @tc.name   : Navigation栈操作异常值测试（pushPath为null、undefined）
     * @tc.desc   : Verify nav navigation interfacefalsle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0010 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navInterfaceFalse01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      // 1.点击"Navigation组件栈异常值操作"按钮
      let openBtn = await driver.findComponent(ON.id('openBtn_01'));
      await openBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0010_01');
      await Utils.sleep(500);
      
      // 2.点击"pushPath 为null"按钮
      let pushPathNullBtn = await driver.findComponent(ON.id('pushPathNullBtn_01'));
      await pushPathNullBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0010_02');
      await Utils.sleep(500);
      
      // 3.点击"pushPath 为undefined"按钮
      let pushPathUndefinedBtn = await driver.findComponent(ON.id('pushPathUndefinedBtn_01'));
      await pushPathUndefinedBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0010_03');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0070
     * @tc.name   : Navigation栈操作异常值测试（pushPathByName name为undefined、null、空值）
     * @tc.desc   : Verify nav navigation interfacefalsle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0070 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navInterfaceFalse07')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let openBtn = await driver.findComponent(ON.id('openBtn_07'));
      await openBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0070_01');
      await Utils.sleep(500);
      
      let pushPathByNameNameUndefinedBtn = await driver.findComponent(ON.id('pushPathByNameNameUndefinedBtn_07'));
      await pushPathByNameNameUndefinedBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0070_02');
      await Utils.sleep(500);
      
      let pushPathByNameNameNullBtn = await driver.findComponent(ON.id('pushPathByNameNameNullBtn_07'));
      await pushPathByNameNameNullBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0070_03');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0110
     * @tc.name   : Navigation栈操作异常值测试（pushDestination为null、undefined）
     * @tc.desc   : Verify nav navigation interfacefalsle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0110 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navInterfaceFalse11')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let openBtn = await driver.findComponent(ON.id('openBtn_11'));
      await openBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0110_01');
      await Utils.sleep(500);
      
      let pushDestinationNullBtn = await driver.findComponent(ON.id('pushDestinationNullBtn_11'));
      await pushDestinationNullBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0110_02');
      await Utils.sleep(500);
      
      let pushDestinationUndefinedBtn = await driver.findComponent(ON.id('pushDestinationUndefinedBtn_11'));
      await pushDestinationUndefinedBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0110_03');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0170
     * @tc.name   : Navigation栈操作异常值测试（pushDestinationByName name为undefined、null、空值）
     * @tc.desc   : Verify nav navigation interfacefalsle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0170 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navInterfaceFalse17')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let openBtn = await driver.findComponent(ON.id('openBtn_17'));
      await openBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0170_01');
      await Utils.sleep(500);
      
      let pushDestinationByNameNameUndefinedBtn = await driver.findComponent(ON.id('pushDestinationByNameNameUndefinedBtn_17'));
      await pushDestinationByNameNameUndefinedBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0170_02');
      await Utils.sleep(500);
      
      let pushDestinationByNameNameNullBtn = await driver.findComponent(ON.id('pushDestinationByNameNameNullBtn_17'));
      await pushDestinationByNameNameNullBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0170_03');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0210
     * @tc.name   : Navigation栈操作异常值测试（replacePath为null、undefined）
     * @tc.desc   : Verify nav navigation interfacefalsle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0210 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navInterfaceFalse21')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let openBtn = await driver.findComponent(ON.id('openBtn_21'));
      await openBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0210_01');
      await Utils.sleep(500);
      
      let replacePathNullBtn = await driver.findComponent(ON.id('replacePathNullBtn_21'));
      await replacePathNullBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0210_02');
      await Utils.sleep(500);
      
      let replacePathUndefinedBtn = await driver.findComponent(ON.id('replacePathUndefinedBtn_21'));
      await replacePathUndefinedBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0210_03');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0270
     * @tc.name   : Navigation栈操作异常值测试（replacePathByName name为undefined、null、空值）
     * @tc.desc   : Verify nav navigation interfacefalsle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0270 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navInterfaceFalse27')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let openBtn = await driver.findComponent(ON.id('openBtn_27'));
      await openBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0270_01');
      await Utils.sleep(500);
      
      let replacePathByNameNameEmptyBtn = await driver.findComponent(ON.id('replacePathByNameNameEmptyBtn_27'));
      await replacePathByNameNameEmptyBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0270_02');
      await Utils.sleep(500);
      
      let replacePathByNameNameUndefinedBtn = await driver.findComponent(ON.id('replacePathByNameNameUndefinedBtn_27'));
      await replacePathByNameNameUndefinedBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0270_03');
      await Utils.sleep(500);
      
      let replacePathByNameNameNullBtn = await driver.findComponent(ON.id('replacePathByNameNameNullBtn_27'));
      await replacePathByNameNameNullBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0270_04');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0300
     * @tc.name   : Navigation栈操作异常值测试（replaceDestination 为 undefined）
     * @tc.desc   : Verify nav navigation interfacefalsle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0300 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navInterfaceFalse30')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let openBtn = await driver.findComponent(ON.id('openBtn_30'));
      await openBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0300_01');
      await Utils.sleep(500);
      
      let replaceDestinationUndefinedBtn = await driver.findComponent(ON.id('replaceDestinationUndefinedBtn_30'));
      await replaceDestinationUndefinedBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0300_02');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0310
     * @tc.name   : Navigation栈操作异常值测试（removeByIndexes 为undefined、null、空数组、内部参数为null）
     * @tc.desc   : Verify nav navigation interfacefalsle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0310 start.`);
      Settings.createWindow('testability/pages/component/navigation/navigation_interface/navInterfaceFalse31')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let openBtn = await driver.findComponent(ON.id('openBtn_31'));
      await openBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0310_01');
      await Utils.sleep(500);
      
      let removeByIndexesNullBtn = await driver.findComponent(ON.id('removeByIndexesNullBtn_31'));
      await removeByIndexesNullBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0310_02');
      await Utils.sleep(500);
      
      let removeByIndexesUndefinedBtn = await driver.findComponent(ON.id('removeByIndexesUndefinedBtn_31'));
      await removeByIndexesUndefinedBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0310_03');
      await Utils.sleep(500);
      
      let removeByIndexesEmptyArrayBtn = await driver.findComponent(ON.id('removeByIndexesEmptyArrayBtn_31'));
      await removeByIndexesEmptyArrayBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0310_04');
      await Utils.sleep(500);
      
      let removeByIndexesInnerNullBtn = await driver.findComponent(ON.id('removeByIndexesInnerNullBtn_31'));
      await removeByIndexesInnerNullBtn.click();
      await driver.waitForIdle(300, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0310_05');
      await Utils.sleep(500);
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_INTERFACEFALSLE_0310 finish.`);
      done()
    })

  })
}
