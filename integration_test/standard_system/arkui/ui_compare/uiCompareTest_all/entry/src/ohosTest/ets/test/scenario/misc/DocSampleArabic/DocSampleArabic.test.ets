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

export default function docSampleArabic() {

  describe('docSampleArabic', () => {
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
     * @tc.number : SUB_ACE_DOC_SAMPLE_ARABIC_0020
     * @tc.name   : Doc sample arabic
     * @tc.desc   : Verify doc sample arabic interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DOC_SAMPLE_ARABIC_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DOC_SAMPLE_ARABIC_0020 start.`);
      Settings.createWindow('testability/pages/scenario/misc/DocSampleArabic/DocSampleArabic0020')
      let driver: Driver = Driver.create();
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      // 点击切换到阿拉伯语按钮
      let buttonSwitchToArabic = await driver.waitForComponent(ON.id('button_switch_to_arabic'), 3000)
      if (buttonSwitchToArabic) {
        await buttonSwitchToArabic.click()
        await Utils.sleep(1000)
      }
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      // 点击切换到中文按钮
      let buttonSwitchToChinese = await driver.waitForComponent(ON.id('button_switch_to_chinese'), 3000)
      if (buttonSwitchToChinese) {
        await buttonSwitchToChinese.click()
        await Utils.sleep(1000)
      }
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DOC_SAMPLE_ARABIC_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DOC_SAMPLE_ARABIC_0030
     * @tc.name   : Doc sample arabic
     * @tc.desc   : Verify doc sample arabic interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DOC_SAMPLE_ARABIC_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DOC_SAMPLE_ARABIC_0030 start.`);
      Settings.createWindow('testability/pages/scenario/misc/DocSampleArabic/DocSampleArabic0030')
      let driver: Driver = Driver.create();
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      // 点击切换到阿拉伯语按钮
      let buttonSwitchToArabic = await driver.waitForComponent(ON.id('button_switch_to_arabic'), 3000)
      if (buttonSwitchToArabic) {
        await buttonSwitchToArabic.click()
        await Utils.sleep(1000)
      }
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      // 点击切换到中文按钮
      let buttonSwitchToChinese = await driver.waitForComponent(ON.id('button_switch_to_chinese'), 3000)
      if (buttonSwitchToChinese) {
        await buttonSwitchToChinese.click()
        await Utils.sleep(1000)
      }
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DOC_SAMPLE_ARABIC_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DOC_SAMPLE_ARABIC_0040
     * @tc.name   : Doc sample arabic
     * @tc.desc   : Verify doc sample arabic interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DOC_SAMPLE_ARABIC_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DOC_SAMPLE_ARABIC_0040 start.`);
      Settings.createWindow('testability/pages/scenario/misc/DocSampleArabic/DocSampleArabic0040')
      let driver: Driver = Driver.create();
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      // 点击切换到阿拉伯语按钮
      let buttonSwitchToArabic = await driver.waitForComponent(ON.id('button_switch_to_arabic'), 3000)
      if (buttonSwitchToArabic) {
        await buttonSwitchToArabic.click()
        await Utils.sleep(1000)
      }
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      // 点击切换到中文按钮
      let buttonSwitchToChinese = await driver.waitForComponent(ON.id('button_switch_to_chinese'), 3000)
      if (buttonSwitchToChinese) {
        await buttonSwitchToChinese.click()
        await Utils.sleep(1000)
      }
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DOC_SAMPLE_ARABIC_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DOC_SAMPLE_ARABIC_0050
     * @tc.name   : Doc sample arabic
     * @tc.desc   : Verify doc sample arabic interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DOC_SAMPLE_ARABIC_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DOC_SAMPLE_ARABIC_0050 start.`);
      Settings.createWindow('testability/pages/scenario/misc/DocSampleArabic/DocSampleArabic0050')
      let driver: Driver = Driver.create();
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      // 点击切换到阿拉伯语按钮
      let buttonSwitchToArabic = await driver.waitForComponent(ON.id('button_switch_to_arabic'), 3000)
      if (buttonSwitchToArabic) {
        await buttonSwitchToArabic.click()
        await Utils.sleep(1000)
      }
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      // 点击切换到中文按钮
      let buttonSwitchToChinese = await driver.waitForComponent(ON.id('button_switch_to_chinese'), 3000)
      if (buttonSwitchToChinese) {
        await buttonSwitchToChinese.click()
        await Utils.sleep(1000)
      }
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DOC_SAMPLE_ARABIC_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DOC_SAMPLE_ARABIC_0060
     * @tc.name   : Doc sample arabic
     * @tc.desc   : Verify doc sample arabic interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DOC_SAMPLE_ARABIC_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DOC_SAMPLE_ARABIC_0060 start.`);
      Settings.createWindow('testability/pages/scenario/misc/DocSampleArabic/DocSampleArabic0060')
      let driver: Driver = Driver.create();
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      // 点击切换到阿拉伯语按钮
      let buttonSwitchToArabic = await driver.waitForComponent(ON.id('button_switch_to_arabic'), 3000)
      if (buttonSwitchToArabic) {
        await buttonSwitchToArabic.click()
        await Utils.sleep(1000)
      }
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      // 点击切换到维吾尔语按钮
      let buttonSwitchToUyghur = await driver.waitForComponent(ON.id('button_switch_to_uyghur'), 3000)
      if (buttonSwitchToUyghur) {
        await buttonSwitchToUyghur.click()
        await Utils.sleep(1000)
      }
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DOC_SAMPLE_ARABIC_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DOC_SAMPLE_ARABIC_0070
     * @tc.name   : Doc sample arabic
     * @tc.desc   : Verify doc sample arabic interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_DOC_SAMPLE_ARABIC_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DOC_SAMPLE_ARABIC_0070 start.`);
      Settings.createWindow('testability/pages/scenario/misc/DocSampleArabic/DocSampleArabic0070')
      let driver: Driver = Driver.create();
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      // 点击切换到阿拉伯语按钮
      let buttonSwitchToArabic = await driver.waitForComponent(ON.id('button_switch_to_arabic'), 3000)
      if (buttonSwitchToArabic) {
        await buttonSwitchToArabic.click()
        await Utils.sleep(1000)
      }
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      // 点击切换到中文按钮
      let buttonSwitchToChinese = await driver.waitForComponent(ON.id('button_switch_to_chinese'), 3000)
      if (buttonSwitchToChinese) {
        await buttonSwitchToChinese.click()
        await Utils.sleep(1000)
      }
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      // 反复切换：再次切换到阿拉伯语
      if (buttonSwitchToArabic) {
        await buttonSwitchToArabic.click()
        await Utils.sleep(1000)
      }
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      // 反复切换：再次切换到中文
      if (buttonSwitchToChinese) {
        await buttonSwitchToChinese.click()
        await Utils.sleep(1000)
      }
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DOC_SAMPLE_ARABIC_0070 finish.`);
      done()
    })



  })
}