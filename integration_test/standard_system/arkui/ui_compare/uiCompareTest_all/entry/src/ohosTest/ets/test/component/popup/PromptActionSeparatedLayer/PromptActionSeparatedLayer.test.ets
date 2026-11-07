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

export default function promptActionSeparatedLayer() {

  describe('promptActionSeparatedLayer', () => {
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
      await Utils.sleep(2000);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0010
     * @tc.name   : Set the toast's showMode to DEFAULT and its shadow to OUTER_DEFAULT_MD.
     * @tc.desc   : Verify popupbox promptaction separatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0010 start.`);
      Settings.createWindow('testability/pages/component/popup/PromptActionSeparatedLayer/PromptActionSeparatedLayer0010')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤1：点击按钮，弹出toast框
      let toastbutton1 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0010_001'), 500)
      await toastbutton1.click()
      await Utils.sleep(2000)
      // 步骤2：点击第二个按钮，弹出toast框
      let toastbutton2 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0010_002'), 500)
      await toastbutton2.click()
      await Utils.sleep(2000)
      // 步骤4：点击Test02按钮，切换颜色模式
      let toastbutton4 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0010_004'), 500)
      await toastbutton4.click()
      await Utils.sleep(2000)
      let toastbutton5 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0010_005'), 500)
      await toastbutton5.click()
      await Utils.sleep(2000)
      await windowSnap.snapShot()
      await Utils.sleep(2000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0010 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0020
     * @tc.name   : Set the toast's showMode to SYSTEM_TOP_MOST without setting shadow.
     * @tc.desc   : Verify popupbox promptaction separatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0020 start.`);
      Settings.createWindow('testability/pages/component/popup/PromptActionSeparatedLayer/PromptActionSeparatedLayer0020')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤1：点击按钮，弹出toast框
      let toastbutton1 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0020_001'), 500)
      await toastbutton1.click()
      await Utils.sleep(2000)
      // 步骤2：点击第二个按钮，弹出toast框
      let toastbutton2 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0020_002'), 500)
      await toastbutton2.click()
      await Utils.sleep(2000)
      // 步骤4：点击Test02按钮，切换颜色模式
      let toastbutton4 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0020_004'), 500)
      await toastbutton4.click()
      await Utils.sleep(2000)
      let toastbutton5 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0020_005'), 500)
      await toastbutton5.click()
      await Utils.sleep(2000)
      await windowSnap.snapShot()
      await Utils.sleep(2000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0020 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0030
     * @tc.name   : Set the toast's showMode to TOP_MOST and its shadow to OUTER_DEFAULT_MD.
     * @tc.desc   : Verify popupbox promptaction separatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0030 start.`);
      Settings.createWindow('testability/pages/component/popup/PromptActionSeparatedLayer/PromptActionSeparatedLayer0030')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤1：点击按钮，弹出toast框
      let toastbutton1 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0030_001'), 500)
      await toastbutton1.click()
      await Utils.sleep(2000)
      // 步骤2：点击第二个按钮，弹出toast框
      let toastbutton2 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0030_002'), 500)
      await toastbutton2.click()
      await Utils.sleep(2000)
      // 步骤4：点击Test02按钮，切换颜色模式
      let toastbutton4 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0030_004'), 500)
      await toastbutton4.click()
      await Utils.sleep(2000)
      let toastbutton5 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0030_005'), 500)
      await toastbutton5.click()
      await Utils.sleep(2000)
      await windowSnap.snapShot()
      await Utils.sleep(2000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0030 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0040
     * @tc.name   : Set the toast's showMode to TOP_MOST without setting shadow.
     * @tc.desc   : Verify popupbox promptaction separatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0040 start.`);
      Settings.createWindow('testability/pages/component/popup/PromptActionSeparatedLayer/PromptActionSeparatedLayer0040')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤1：点击按钮，弹出toast框
      let toastbutton1 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0040_001'), 500)
      await toastbutton1.click()
      await Utils.sleep(2000)
      // 步骤2：点击第二个按钮，弹出toast框
      let toastbutton2 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0040_002'), 500)
      await toastbutton2.click()
      await Utils.sleep(2000)
      // 步骤4：点击Test02按钮，切换颜色模式
      let toastbutton4 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0040_004'), 500)
      await toastbutton4.click()
      await Utils.sleep(2000)
      let toastbutton5 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0040_005'), 500)
      await toastbutton5.click()
      await Utils.sleep(2000)
      await windowSnap.snapShot()
      await Utils.sleep(2000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0040 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0050
     * @tc.name   : Set the toast's showMode to DEFAULT without setting shadow.
     * @tc.desc   : Verify popupbox promptaction separatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0050 start.`);
      Settings.createWindow('testability/pages/component/popup/PromptActionSeparatedLayer/PromptActionSeparatedLayer0050')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤1：点击按钮，弹出toast框
      let toastbutton1 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0050_001'), 500)
      await toastbutton1.click()
      await Utils.sleep(2000)
      // 步骤2：点击第二个按钮，弹出toast框
      let toastbutton2 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0050_002'), 500)
      await toastbutton2.click()
      await Utils.sleep(2000)
      // 步骤4：点击Test02按钮，切换颜色模式
      let toastbutton4 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0050_004'), 500)
      await toastbutton4.click()
      await Utils.sleep(2000)
      let toastbutton5 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0050_005'), 500)
      await toastbutton5.click()
      await Utils.sleep(2000)
      await windowSnap.snapShot()
      await Utils.sleep(2000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0050 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0060
     * @tc.name   : Set the toast's showMode to DEFAULT and its shadow to null.
     * @tc.desc   : Verify popupbox promptaction separatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0060 start.`);
      Settings.createWindow('testability/pages/component/popup/PromptActionSeparatedLayer/PromptActionSeparatedLayer0060')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤1：点击按钮，弹出toast框
      let toastbutton1 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0060_001'), 500)
      await toastbutton1.click()
      await Utils.sleep(2000)
      // 步骤2：点击第二个按钮，弹出toast框
      let toastbutton2 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0060_002'), 500)
      await toastbutton2.click()
      await Utils.sleep(2000)
      // 步骤4：点击Test02按钮，切换颜色模式
      let toastbutton4 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0060_004'), 500)
      await toastbutton4.click()
      await Utils.sleep(2000)
      let toastbutton5 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0060_005'), 500)
      await toastbutton5.click()
      await Utils.sleep(2000)
      await windowSnap.snapShot()
      await Utils.sleep(2000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0060 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0070
     * @tc.name   : Set the toast's showMode to TOP_MOST and its shadow to null.
     * @tc.desc   : Verify popupbox promptaction separatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0070 start.`);
      Settings.createWindow('testability/pages/component/popup/PromptActionSeparatedLayer/PromptActionSeparatedLayer0070')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤1：点击按钮，弹出toast框
      let toastbutton1 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0070_001'), 500)
      await toastbutton1.click()
      await Utils.sleep(2000)
      // 步骤2：点击第二个按钮，弹出toast框
      let toastbutton2 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0070_002'), 500)
      await toastbutton2.click()
      await Utils.sleep(2000)
      // 步骤4：点击Test02按钮，切换颜色模式
      let toastbutton4 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0070_004'), 500)
      await toastbutton4.click()
      await Utils.sleep(2000)
      let toastbutton5 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0070_005'), 500)
      await toastbutton5.click()
      await Utils.sleep(2000)
      await windowSnap.snapShot()
      await Utils.sleep(2000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0070 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0080
     * @tc.name   : Set the toast's showMode to SYSTEM_TOP_MOST and its shadow to undefined.
     * @tc.desc   : Verify popupbox promptaction separatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0080 start.`);
      Settings.createWindow('testability/pages/component/popup/PromptActionSeparatedLayer/PromptActionSeparatedLayer0080')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤1：点击按钮，弹出toast框
      let toastbutton1 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0080_001'), 500)
      await toastbutton1.click()
      await Utils.sleep(2000)
      // 步骤2：点击第二个按钮，弹出toast框
      let toastbutton2 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0080_002'), 500)
      await toastbutton2.click()
      await Utils.sleep(2000)
      // 步骤4：点击Test02按钮，切换颜色模式
      let toastbutton4 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0080_004'), 500)
      await toastbutton4.click()
      await Utils.sleep(2000)
      let toastbutton5 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0080_005'), 500)
      await toastbutton5.click()
      await Utils.sleep(2000)
      await windowSnap.snapShot()
      await Utils.sleep(2000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0080 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0090
     * @tc.name   : Set the toast's showMode to SYSTEM_TOP_MOST and its shadow to OUTER_DEFAULT_MD.
     * @tc.desc   : Verify popupbox promptaction separatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0090 start.`);
      Settings.createWindow('testability/pages/component/popup/PromptActionSeparatedLayer/PromptActionSeparatedLayer0090')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤1：点击按钮，弹出toast框
      let toastbutton1 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0090_001'), 500)
      await toastbutton1.click()
      await Utils.sleep(2000)
      // 步骤2：点击第二个按钮，弹出toast框
      let toastbutton2 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0090_002'), 500)
      await toastbutton2.click()
      await Utils.sleep(2000)
      // 步骤4：点击Test02按钮，切换颜色模式
      let toastbutton4 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0090_004'), 500)
      await toastbutton4.click()
      await Utils.sleep(2000)
      let toastbutton5 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0090_005'), 500)
      await toastbutton5.click()
      await Utils.sleep(2000)
      await windowSnap.snapShot()
      await Utils.sleep(2000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0090 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0100
     * @tc.name   : Set the toast's showMode to SYSTEM_TOP_MOST and its shadow to null.
     * @tc.desc   : Verify popupbox promptaction separatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0100 start.`);
      Settings.createWindow('testability/pages/component/popup/PromptActionSeparatedLayer/PromptActionSeparatedLayer0100')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤1：点击按钮，弹出toast框
      let toastbutton1 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0100_001'), 500)
      await toastbutton1.click()
      await Utils.sleep(2000)
      // 步骤2：点击第二个按钮，弹出toast框
      let toastbutton2 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0100_002'), 500)
      await toastbutton2.click()
      await Utils.sleep(2000)
      // 步骤4：点击Test02按钮，切换颜色模式
      let toastbutton4 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0100_004'), 500)
      await toastbutton4.click()
      await Utils.sleep(2000)
      let toastbutton5 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0100_005'), 500)
      await toastbutton5.click()
      await Utils.sleep(2000)
      await windowSnap.snapShot()
      await Utils.sleep(2000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0100 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0110
     * @tc.name   : Set the toast's showMode to DEFAULT and its shadow to undefined.
     * @tc.desc   : Verify popupbox promptaction separatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0110 start.`);
      Settings.createWindow('testability/pages/component/popup/PromptActionSeparatedLayer/PromptActionSeparatedLayer0110')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤1：点击按钮，弹出toast框
      let toastbutton1 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0110_001'), 500)
      await toastbutton1.click()
      await Utils.sleep(2000)
      // 步骤2：点击第二个按钮，弹出toast框
      let toastbutton2 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0110_002'), 500)
      await toastbutton2.click()
      await Utils.sleep(2000)
      // 步骤4：点击Test02按钮，切换颜色模式
      let toastbutton4 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0110_004'), 500)
      await toastbutton4.click()
      await Utils.sleep(2000)
      let toastbutton5 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0110_005'), 500)
      await toastbutton5.click()
      await Utils.sleep(2000)
      await windowSnap.snapShot()
      await Utils.sleep(2000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0110 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0120
     * @tc.name   : Set the toast's showMode to TOP_MOST and its shadow to undefined.
     * @tc.desc   : Verify popupbox promptaction separatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0120 start.`);
      Settings.createWindow('testability/pages/component/popup/PromptActionSeparatedLayer/PromptActionSeparatedLayer0120')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤1：点击按钮，弹出toast框
      let toastbutton1 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0120_001'), 500)
      await toastbutton1.click()
      await Utils.sleep(2000)
      // 步骤2：点击第二个按钮，弹出toast框
      let toastbutton2 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0120_002'), 500)
      await toastbutton2.click()
      await Utils.sleep(2000)
      // 步骤4：点击Test02按钮，切换颜色模式
      let toastbutton4 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0120_004'), 500)
      await toastbutton4.click()
      await Utils.sleep(2000)
      let toastbutton5 = await driver.waitForComponent(ON.id('PromptActionSeparatedLayer0120_005'), 500)
      await toastbutton5.click()
      await Utils.sleep(2000)
      await windowSnap.snapShot()
      await Utils.sleep(2000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_PROMPTACTION_SEPARATEDLAYER_0120 finish.`);
      done()
    })


  })
}