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
import I18n from '@ohos.i18n';
import { BusinessError } from '@kit.BasicServicesKit';

export default function counterMirrorImage() {

  describe('counterMirrorImage', () => {
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
     * @tc.number : SUB_ACE_UI_ARKUI_COUNTER-MIRROR-IMAGE_0030
     * @tc.name   : ArkUI counter-mirror-image
     * @tc.desc   : Verify ArkUI counter-mirror-image interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_ARKUI_COUNTER_MIRROR_IMAGE_0030', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_COUNTER_MIRROR_IMAGE_0030 start.`);
      Settings.createWindow('testability/pages/component/form/CounterMirrorImage/CounterMirrorImage30')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('Counter_01'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      let button_1 = await driver.waitForComponent(ON.id('Button_01'),1000);
      await button_1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.screenShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_COUNTER_MIRROR_IMAGE_0030 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_COUNTER-MIRROR-IMAGE_0070
     * @tc.name   : ArkUI counter-mirror-image
     * @tc.desc   : Verify ArkUI counter-mirror-image interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_ARKUI_COUNTER_MIRROR_IMAGE_0070', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_COUNTER_MIRROR_IMAGE_0070 start.`);
      try {
        I18n.System.setSystemLanguage('gu');
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`call System.setSystemLanguage failed, error code: ${err.code}, message: ${err.message}.`);
      }
      Settings.createWindow('testability/pages/component/form/CounterMirrorImage/CounterMirrorImage30')
      let driver:Driver = Driver.create();
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('Counter_01'), 1000);  // 显式等待组件出现[6](@ref)
      await component.click();
      let button_1 = await driver.waitForComponent(ON.id('Button_01'),1000);
      await button_1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.screenShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_COUNTER_MIRROR_IMAGE_0030 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_BADGE-MIRROR-IMAGE_0010
     * @tc.name   : ArkUI badge-mirror-image
     * @tc.desc   : Verify ArkUI badge-mirror-image interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_ARKUI_COUNTER_MIRROR_IMAGE_0010', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_COUNTER_MIRROR_IMAGE_0010 start.`);
      // 设置系统语言
      try {
        I18n.System.setSystemLanguage('zh'); // 设置系统当前语言为 "zh"
      } catch(error) {
        let err: BusinessError = error as BusinessError;
        console.error(`call System.setSystemLanguage failed, error code: ${err.code}, message: ${err.message}.`);
      }
      Settings.createWindow('testability/pages/component/form/CounterMirrorImage/CounterMirrorImage10')
      windowSnap.screenShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_COUNTER_MIRROR_IMAGE_0010 finish.`);
      done();
    })


    /*
     * @tc.number : SUB_ACE_UI_ARKUI_BADGE-MIRROR-IMAGE_0050
     * @tc.name   : ArkUI badge-mirror-image
     * @tc.desc   : Verify ArkUI badge-mirror-image interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_ARKUI_COUNTER_MIRROR_IMAGE_0050', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_COUNTER_MIRROR_IMAGE_0050 start.`);
      // 设置系统当前语言为'zh-Hans'
      try {
        I18n.System.setSystemLanguage('en');
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`call System.setSystemLanguage failed, error code: ${err.code}, message: ${err.message}.`);
      }
      Settings.createWindow('testability/pages/component/form/CounterMirrorImage/CounterMirrorImage50')
      windowSnap.screenShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_COUNTER_MIRROR_IMAGE_0050 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_BADGE-MIRROR-IMAGE_0090
     * @tc.name   : ArkUI badge-mirror-image
     * @tc.desc   : Verify ArkUI badge-mirror-image interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_ARKUI_COUNTER_MIRROR_IMAGE_0090', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_COUNTER_MIRROR_IMAGE_0090 start.`);
      // 设置系统当前语言为'zh-Hans'
      try {
        I18n.System.setSystemLanguage('gu');
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`call System.setSystemLanguage failed, error code: ${err.code}, message: ${err.message}.`);
      }
      Settings.createWindow('testability/pages/component/form/CounterMirrorImage/CounterMirrorImage50')
      windowSnap.screenShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_COUNTER_MIRROR_IMAGE_0090 finish.`);
      done();
    })

  })
}