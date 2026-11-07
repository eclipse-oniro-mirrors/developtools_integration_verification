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
import { Driver, ON, Component, MouseButton } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit'

export default function blurMaterialSeparatedLayerTest() {

  describe('blurMaterialSeparatedLayerTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err:BusinessError) => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0020
     * @tc.name   : AlertDialog设置primaryButton（两个按钮）、backgroundBlurStyle（BACKGROUND_THICK）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0020 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0020')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('twoButtonsBtn0020'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0030
     * @tc.name   : popup设置 popupOption、不设置按钮（纯文本）、backgroundBlurStyle（Thick）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0030 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0030')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let popupOptionsBtn: Component = await driver.waitForComponent(ON.id('popupOptionsBtn0030'), 1000);
      await popupOptionsBtn.click();
      await driver.waitForIdle(500, 2000);
      
      let textOnlyBtn: Component = await driver.waitForComponent(ON.id('textOnlyBtn0030'), 1000);
      await textOnlyBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0060
     * @tc.name   : AlertDialog设置primaryButton（一个按钮）、backgroundBlurStyle（Thin）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0060 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0060')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('oneButtonBtn0060'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0090
     * @tc.name   : Customdialog设置backgroundBlurStyle（COMPONENT_ULTRA_THIN）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0090 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0090')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let customDialogBtn: Component = await driver.waitForComponent(ON.id('customDialogBtn0090'), 1000);
      await customDialogBtn.click();
      await driver.waitForIdle(500, 2000);
      
      let clickMeBtn: Component = await driver.waitForComponent(ON.id('clickMeBtn0090'), 1000);
      await clickMeBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0120
     * @tc.name   : ActionSheet设置backgroundBlurStyle（null）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0120 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0120')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('actionSheetBtn0120'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0130
     * @tc.name   : toast设置SYSTEM_TOP_MOST、backgroundBlurStyle（undefined）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0130 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0130')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('showToastBtn0130'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0080
     * @tc.name   : popup设置 popupOption、设置按钮（primaryButton）、backgroundBlurStyle（BACKGROUND_REGULAR）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0080 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0080')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let popupOptionsBtn: Component = await driver.waitForComponent(ON.id('popupOptionsBtn0080'), 1000);
      await popupOptionsBtn.click();
      await driver.waitForIdle(500, 2000);
      
      let oneButtonBtn: Component = await driver.waitForComponent(ON.id('oneButtonBtn0080'), 1000);
      await oneButtonBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0100
     * @tc.name   : Customdialog设置backgroundBlurStyle（undefined）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0100 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0100')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let customDialogBtn: Component = await driver.waitForComponent(ON.id('customDialogBtn0100'), 1000);
      await customDialogBtn.click();
      await driver.waitForIdle(500, 2000);
      
      let clickMeBtn: Component = await driver.waitForComponent(ON.id('clickMeBtn0100'), 1000);
      await clickMeBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0150
     * @tc.name   : popup设置 popupOption、不设置按钮（纯文本）、backgroundBlurStyle（BACKGROUND_ULTRA_THICK）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0150 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0150')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let popupOptionsBtn: Component = await driver.waitForComponent(ON.id('popupOptionsBtn0150'), 1000);
      await popupOptionsBtn.click();
      await driver.waitForIdle(500, 2000);
      
      let textOnlyBtn: Component = await driver.waitForComponent(ON.id('textOnlyBtn0150'), 1000);
      await textOnlyBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0160
     * @tc.name   : ActionSheet设置backgroundBlurStyle（COMPONENT_ULTRA_THICK）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0160 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0160')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('actionSheetBtn0160'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0240
     * @tc.name   : toast设置DEFAULT、backgroundBlurStyle（COMPONENT_THICK）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0240 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0240')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('showToastBtn0240'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0260
     * @tc.name   : AlertDialog设置primaryButton（两个按钮）、backgroundBlurStyle（BACKGROUND_REGULAR）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0260 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0260')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('twoButtonsBtn0260'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0170
     * @tc.name   : ActionSheet设置backgroundBlurStyle（COMPONENT_THIN）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0170 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0170')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('actionSheetBtn0170'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0180
     * @tc.name   : ActionSheet设置backgroundBlurStyle（COMPONENT_THICK）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0180 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0180')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('actionSheetBtn0180'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0190
     * @tc.name   : popup设置 popupOption、不设置按钮（纯文本）、backgroundBlurStyle（COMPONENT_REGULAR）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0190 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0190')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let popupOptionsBtn: Component = await driver.waitForComponent(ON.id('popupOptionsBtn0190'), 1000);
      await popupOptionsBtn.click();
      await driver.waitForIdle(500, 2000);
      
      let textOnlyBtn: Component = await driver.waitForComponent(ON.id('textOnlyBtn0190'), 1000);
      await textOnlyBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0200
     * @tc.name   : ActionSheet设置backgroundBlurStyle（COMPONENT_REGULAR）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0200 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0200')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('actionSheetBtn0200'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0210
     * @tc.name   : ActionSheet设置backgroundBlurStyle（BACKGROUND_THIN）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0210 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0210')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('actionSheetBtn0210'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0220
     * @tc.name   : ActionSheet设置backgroundBlurStyle（BACKGROUND_REGULAR）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0220 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0220')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('actionSheetBtn0220'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0250
     * @tc.name   : CustomDialog设置backgroundBlurStyle（COMPONENT_REGULAR）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0250 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0250')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('customDialogBtn0250'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0270
     * @tc.name   : CustomDialog设置backgroundBlurStyle（COMPONENT_ULTRA_THICK）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0270 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0270')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('customDialogBtn0270'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0280
     * @tc.name   : Popup设置backgroundBlurStyle（纯文本，COMPONENT_REGULAR）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0280 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0280')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('popupOptionsBtn0280'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0290
     * @tc.name   : Popup设置backgroundBlurStyle（一个按钮，COMPONENT_THIN）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0290 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0290')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('popupOptionsBtn0290'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0290 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0300
     * @tc.name   : ActionSheet设置backgroundBlurStyle（BACKGROUND_THIN）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0300 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0300')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('actionSheetBtn0300'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0310
     * @tc.name   : Popup设置CustomPopupOption、backgroundBlurStyle（COMPONENT_ULTRA_THICK）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0310 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0310')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('customPopupOptionsBtn0310'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0320
     * @tc.name   : Popup设置backgroundBlurStyle（一个按钮，NONE）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0320 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0320')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('popupOptionsBtn0320'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0330
     * @tc.name   : Popup设置backgroundBlurStyle（一个按钮，BACKGROUND_THICK）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0330 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0330')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('popupOptionsBtn0330'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0340
     * @tc.name   : ActionSheet设置backgroundBlurStyle（COMPONENT_REGULAR）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0340 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0340')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('actionSheetBtn0340'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0350
     * @tc.name   : Toast设置TOP_MOST、backgroundBlurStyle（COMPONENT_ULTRA_THIN）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0350 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0350')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('showToastBtn0350'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0350 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0360
     * @tc.name   : CustomDialog设置backgroundBlurStyle（BACKGROUND_THIN）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0360 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0360')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('customDialogBtn0360'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0360 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0370
     * @tc.name   : CustomDialog设置backgroundBlurStyle（COMPONENT_THIN）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0370 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0370')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('customDialogBtn0370'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0370 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0380
     * @tc.name   : Popup设置backgroundBlurStyle（一个按钮，NONE）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0380 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0380')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('popupOptionsBtn0380'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0380 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0390
     * @tc.name   : AlertDialog设置primaryButton（两个按钮）、backgroundBlurStyle（BACKGROUND_THIN）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0390', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0390 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0390')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('twoButtonsBtn0390'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0390 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0400
     * @tc.name   : ActionSheet设置backgroundBlurStyle（COMPONENT_ULTRA_THICK）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0400', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0400 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0400')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('actionSheetBtn0400'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0400 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0410
     * @tc.name   : CustomDialog设置backgroundBlurStyle（BACKGROUND_ULTRA_THICK）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0410 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0410')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('customDialogBtn0410'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0410 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0420
     * @tc.name   : Toast设置DEFAULT、backgroundBlurStyle（BACKGROUND_REGULAR）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0420', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0420 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0420')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('showToastBtn0420'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0420 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0430
     * @tc.name   : CustomDialog设置backgroundBlurStyle（COMPONENT_THICK）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0430', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0430 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0430')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('customDialogBtn0430'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0430 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0440
     * @tc.name   : AlertDialog设置primaryButton（两个按钮）、backgroundBlurStyle（BACKGROUND_REGULAR）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0440 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0440')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('twoButtonsBtn0440'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0440 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0450
     * @tc.name   : AlertDialog设置primaryButton（一个按钮）、backgroundBlurStyle（Regular）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0450', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0450 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0450')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('oneButtonBtn0450'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0450 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0460
     * @tc.name   : Popup设置backgroundBlurStyle（纯文本，Thin）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0460', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0460 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0460')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('popupOptionsBtn0460'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0460 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0470
     * @tc.name   : ActionSheet设置backgroundBlurStyle（BACKGROUND_THICK）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0470', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0470 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0470')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('actionSheetBtn0470'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0470 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0480
     * @tc.name   : Popup设置backgroundBlurStyle（一个按钮，BACKGROUND_ULTRA_THICK）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0480', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0480 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0480')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('popupOptionsBtn0480'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0480 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0490
     * @tc.name   : ActionSheet设置backgroundBlurStyle（COMPONENT_THICK）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0490 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0490')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('actionSheetBtn0490'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0490 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0500
     * @tc.name   : Toast设置TOP_MOST、backgroundBlurStyle（COMPONENT_THIN）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0500 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0500')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('showToastBtn0500'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0500 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0510
     * @tc.name   : Popup设置CustomPopupOption、backgroundBlurStyle（COMPONENT_ULTRA_THICK）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0510', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0510 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0510')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('customPopupOptionsBtn0510'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0510 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0520
     * @tc.name   : AlertDialog设置primaryButton（三个按钮）、backgroundBlurStyle（null）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0520', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0520 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0520')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('threeButtonsBtn0520'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0520 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0530
     * @tc.name   : AlertDialog设置primaryButton（三个按钮）、backgroundBlurStyle（COMPONENT_REGULAR）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0530', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0530 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0530')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('threeButtonsBtn0530'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0530 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0540
     * @tc.name   : Toast设置DEFAULT、backgroundBlurStyle（Thick）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0540', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0540 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0540')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('showToastBtn0540'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0540 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0550
     * @tc.name   : Popup设置backgroundBlurStyle（两个按钮，COMPONENT_THICK）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0550', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0550 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0550')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('popupOptionsBtn0550'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0550 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0570
     * @tc.name   : AlertDialog设置primaryButton（一个按钮）、backgroundBlurStyle（Thick）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0570', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0570 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0570')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('oneButtonBtn0570'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0570 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0580
     * @tc.name   : AlertDialog设置primaryButton（两个按钮）、backgroundBlurStyle（BACKGROUND_ULTRA_THICK）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0580', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0580 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0580')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('twoButtonsBtn0580'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0580 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0590
     * @tc.name   : AlertDialog设置primaryButton（三个按钮）、backgroundBlurStyle（COMPONENT_ULTRA_THICK）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0590', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0590 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0590')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('threeButtonsBtn0590'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0590 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0600
     * @tc.name   : Toast设置SYSTEM_TOP_MOST、backgroundBlurStyle（COMPONENT_ULTRA_THICK）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0600', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0600 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0600')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('showToastBtn0600'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0600 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0610
     * @tc.name   : ActionSheet设置backgroundBlurStyle（BACKGROUND_REGULAR）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0610', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0610 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0610')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('actionSheetBtn0610'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0610 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0620
     * @tc.name   : ActionSheet设置backgroundBlurStyle（NONE）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0620', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0620 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0620')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('actionSheetBtn0620'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0620 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0630
     * @tc.name   : ActionSheet设置backgroundBlurStyle（Thin）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0630', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0630 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0630')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('actionSheetBtn0630'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0630 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0640
     * @tc.name   : ActionSheet设置backgroundBlurStyle（COMPONENT_THIN）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0640', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0640 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0640')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('actionSheetBtn0640'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0640 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0650
     * @tc.name   : Toast设置DEFAULT、backgroundBlurStyle（BACKGROUND_REGULAR）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0650', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0650 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0650')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('showToastBtn0650'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0650 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0660
     * @tc.name   : Toast设置TOP_MOST、backgroundBlurStyle（BACKGROUND_THICK）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0660', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0660 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0660')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('showToastBtn0660'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0660 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0670
     * @tc.name   : Toast设置TOP_MOST、backgroundBlurStyle（BACKGROUND_ULTRA_THICK）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0670', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0670 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0670')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('showToastBtn0670'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0670 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0680
     * @tc.name   : Popup设置CustomPopupOption、backgroundBlurStyle（undefined）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0680', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0680 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0680')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('customPopupOptionsBtn0680'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0680 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0690
     * @tc.name   : AlertDialog设置primaryButton（三个按钮）、backgroundBlurStyle（COMPONENT_THICK）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0690', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0690 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0690')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('threeButtonsBtn0690'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0690 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0700
     * @tc.name   : Toast设置TOP_MOST、backgroundBlurStyle（BACKGROUND_ULTRA_THICK）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0700', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0700 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0700')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('showToastBtn0700'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0700 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0710
     * @tc.name   : Popup设置CustomPopupOption、backgroundBlurStyle（null）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0710', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0710 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0710')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('customPopupOptionsBtn0710'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0710 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0720
     * @tc.name   : AlertDialog设置primaryButton（两个按钮）、backgroundBlurStyle（NONE）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0720', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0720 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0720')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('twoButtonsBtn0720'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0720 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0730
     * @tc.name   : CustomDialog设置backgroundBlurStyle（BACKGROUND_THICK）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0730', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0730 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0730')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('customDialogBtn0730'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0730 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0740
     * @tc.name   : ActionSheet设置backgroundBlurStyle（Thick）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0740', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0740 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0740')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('actionSheetBtn0740'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0740 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0750
     * @tc.name   : ActionSheet设置backgroundBlurStyle（undefined）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0750', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0750 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0750')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('actionSheetBtn0750'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0750 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0760
     * @tc.name   : AlertDialog设置primaryButton（三个按钮）、backgroundBlurStyle（COMPONENT_ULTRA_THIN）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0760', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0760 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0760')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('threeButtonsBtn0760'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0760 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0770
     * @tc.name   : Toast设置SYSTEM_TOP_MOST、backgroundBlurStyle（COMPONENT_REGULAR）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0770', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0770 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0770')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('showToastBtn0770'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0770 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0780
     * @tc.name   : Toast设置DEFAULT、backgroundBlurStyle（BACKGROUND_THIN）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0780', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0780 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0780')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('showToastBtn0780'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0780 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0790
     * @tc.name   : CustomDialog设置backgroundBlurStyle（Thin）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0790', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0790 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0790')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('customDialogBtn0790'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0790 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0810
     * @tc.name   : ActionSheet设置backgroundBlurStyle（Regular）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0810', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0810 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0810')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('actionSheetBtn0810'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0810 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0820
     * @tc.name   : CustomDialog设置backgroundBlurStyle（COMPONENT_REGULAR）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0820', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0820 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0820')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('customDialogBtn0820'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0820 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0840
     * @tc.name   : Popup设置backgroundBlurStyle（两个按钮，COMPONENT_ULTRA_THIN）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0840', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0840 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0840')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('popupOptionsBtn0840'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0840 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0850
     * @tc.name   : Toast设置SYSTEM_TOP_MOST、backgroundBlurStyle（null）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0850', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0850 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0850')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('showToastBtn0850'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0850 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0870
     * @tc.name   : CustomDialog设置backgroundBlurStyle（NONE）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0870', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0870 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0870')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('customDialogBtn0870'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0870 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0880
     * @tc.name   : AlertDialog设置primaryButton（三个按钮）、backgroundBlurStyle（undefined）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0880', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0880 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0880')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('threeButtonsBtn0880'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0880 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0900
     * @tc.name   : Popup设置backgroundBlurStyle（纯文本，BACKGROUND_THIN）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0900', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0900 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0900')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('popupOptionsBtn0900'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0900 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0910
     * @tc.name   : CustomDialog设置backgroundBlurStyle（Thick）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0910', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0910 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0910')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('customDialogBtn0910'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0910 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0920
     * @tc.name   : Toast设置DEFAULT、backgroundBlurStyle（Regular）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0920', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0920 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0920')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('showToastBtn0920'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0920 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0940
     * @tc.name   : Toast设置SYSTEM_TOP_MOST、backgroundBlurStyle（COMPONENT_THICK）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0940', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0940 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0940')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('showToastBtn0940'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0940 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0950
     * @tc.name   : Toast设置TOP_MOST、backgroundBlurStyle（NONE）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0950', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0950 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0950')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('showToastBtn0950'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0950 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0960
     * @tc.name   : ActionSheet设置backgroundBlurStyle（BACKGROUND_THIN）的显示效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0960', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0960 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0960')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('actionSheetBtn0960'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0960 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0970
     * @tc.name   : bindContextMenu不设置isShown，content（CustomBuilder有MenuItemGroup包含的1个MenuItem菜单），responseType（LongPress），enableArrow（true），preview（IMAGE），backgroundBlurStyle（COMPONENT_ULTRA_THIN）的效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0970', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0970 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0970')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('menuBtn0970'), 1000);
      let point = await button.getBoundsCenter();
      await driver.mouseClick({x: point.x, y: point.y}, MouseButton.MOUSE_BUTTON_LEFT, 1500);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0970 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0980
     * @tc.name   : bindContextMenu不设置isShown，content（CustomBuilder有MenuItemGroup包含的1个MenuItem菜单），responseType（LongPress），enableArrow（true），preview（CustomBuilder），backgroundBlurStyle（COMPONENT_ULTRA_THICK）的效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0980', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0980 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0980')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('menuBtn0980'), 1000);
      let point = await button.getBoundsCenter();
      await driver.mouseClick({x: point.x, y: point.y}, MouseButton.MOUSE_BUTTON_LEFT, 1500);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0980 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0990
     * @tc.name   : bindContextMenu设置isShown，content（CustomBuilder有MenuItemGroup包含的1个MenuItem菜单），enableArrow（true），二级菜单设置为STACK_EXPAND，backgroundBlurStyle（NONE）的效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0990', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0990 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer0990')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let bindBtn: Component = await driver.waitForComponent(ON.id('bindContextMenu02Btn0990'), 1000);
      await bindBtn.click();
      await driver.waitForIdle(500, 2000);
      
      // 等待菜单显示（isShown为true时菜单会自动显示）
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_0990 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1000
     * @tc.name   : bindContextMenu不设置isShown，content（CustomBuilder有MenuItemGroup包含的1个MenuItem菜单），responseType（LongPress），enableArrow（true），preview（CustomBuilder），backgroundBlurStyle（COMPONENT_THICK）的效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1000', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1000 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer1000')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('menuBtn1000'), 1000);
      let point = await button.getBoundsCenter();
      await driver.mouseClick({x: point.x, y: point.y}, MouseButton.MOUSE_BUTTON_LEFT, 1500);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1000 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1010
     * @tc.name   : bindMenu不设置isShown，content（MenuElement[]有3个菜单），enableArrow（true），backgroundBlurStyle（Regular）的效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1010 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer1010')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('menuBtn1010'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1020
     * @tc.name   : bindContextMenu不设置isShown，content（CustomBuilder有MenuItemGroup包含的1个MenuItem菜单），responseType（LongPress），enableArrow（true），preview（CustomBuilder），backgroundBlurStyle（undefined）的效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1020 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer1020')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('menuBtn1020'), 1000);
      let point = await button.getBoundsCenter();
      await driver.mouseClick({x: point.x, y: point.y}, MouseButton.MOUSE_BUTTON_LEFT, 1500);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1030
     * @tc.name   : bindContextMenu不设置isShown，content（CustomBuilder有MenuItemGroup包含的1个MenuItem菜单），responseType（RightClick），enableArrow（true），二级菜单设置为EMBEDDED_EXPAND，backgroundBlurStyle（BACKGROUND_ULTRA_THICK）的效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1030 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer1030')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('menuBtn1030'), 1000);
      let point = await button.getBoundsCenter();
      await driver.mouseClick({x: point.x, y: point.y}, MouseButton.MOUSE_BUTTON_RIGHT);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1040
     * @tc.name   : bindContextMenu不设置isShown，content（CustomBuilder有MenuItemGroup包含的1个MenuItem菜单），responseType（LongPress），enableArrow（true），preview（IMAGE），backgroundBlurStyle（COMPONENT_REGULAR）的效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1040 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer1040')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('menuBtn1040'), 1000);
      let point = await button.getBoundsCenter();
      await driver.mouseClick({x: point.x, y: point.y}, MouseButton.MOUSE_BUTTON_LEFT, 1500);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1050
     * @tc.name   : bindMenu不设置isShown，content（MenuElement[]有3个菜单），enableArrow（false），backgroundBlurStyle（Thin）的效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1050 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer1050')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('menuBtn1050'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1060
     * @tc.name   : bindContextMenu不设置isShown，content（CustomBuilder有MenuItemGroup包含的1个MenuItem菜单），responseType（LongPress），enableArrow（true），二级菜单设置为SIDE_EXPAND，backgroundBlurStyle（BACKGROUND_THICK）的效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1060 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer1060')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('menuBtn1060'), 1000);
      let point = await button.getBoundsCenter();
      await driver.mouseClick({x: point.x, y: point.y}, MouseButton.MOUSE_BUTTON_LEFT, 1500);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1070
     * @tc.name   : bindMenu设置isShown，content（CustomBuilder有MenuItemGroup包含的1个MenuItem菜单），title(HelloWorld)，showInSubWindow（false），enableArrow（true），二级菜单设置为SIDE_EXPAND，backgroundBlurStyle（Thick）的效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1070 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer1070')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let bindBtn: Component = await driver.waitForComponent(ON.id('bindMenu01Btn1070'), 1000);
      await bindBtn.click();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('menuBtn1070'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1080
     * @tc.name   : bindMenu设置isShown，content（CustomBuilder有MenuItemGroup包含的1个MenuItem菜单），title(HelloWorld)，showInSubWindow（true），enableArrow（true），二级菜单设置为EMBEDDED_EXPAND，backgroundBlurStyle（BACKGROUND_THIN）的效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1080 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer1080')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let bindBtn: Component = await driver.waitForComponent(ON.id('bindMenu01Btn1080'), 1000);
      await bindBtn.click();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('menuBtn1080'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1090
     * @tc.name   : bindMenu设置isShown，content（CustomBuilder有3个菜单），showInSubWindow（true），enableArrow（true），二级菜单设置为STACK_EXPAND，backgroundBlurStyle（BACKGROUND_REGULAR）的效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1090 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer1090')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let bindBtn: Component = await driver.waitForComponent(ON.id('bindMenu01Btn1090'), 1000);
      await bindBtn.click();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('menuBtn1090'), 1000);
      await button.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1100
     * @tc.name   : bindContextMenu不设置isShown，content（CustomBuilder有MenuItemGroup包含的1个MenuItem菜单），responseType（LongPress），enableArrow（true），preview（IMAGE），backgroundBlurStyle（COMPONENT_THIN）的效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1100 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer1100')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('menuBtn1100'), 1000);
      let point = await button.getBoundsCenter();
      await driver.mouseClick({x: point.x, y: point.y}, MouseButton.MOUSE_BUTTON_LEFT, 1500);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1110
     * @tc.name   : bindContextMenu不设置isShown，content（CustomBuilder有MenuItemGroup包含的1个MenuItem菜单），responseType（LongPress），enableArrow（true），preview（CustomBuilder），backgroundBlurStyle（null）的效果
     * @tc.desc   : Verify popupbox blurmaterialseparatedlayer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1110 start.`);
      Settings.createWindow('testability/pages/component/popup/popupbox_blurMaterialSeparatedLayer/blurMaterialSeparatedLayer1110')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      
      let button: Component = await driver.waitForComponent(ON.id('menuBtn1110'), 1000);
      let point = await button.getBoundsCenter();
      await driver.mouseClick({x: point.x, y: point.y}, MouseButton.MOUSE_BUTTON_LEFT, 1500);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BLURMATERIALSEPARATEDLAYER_1110 finish.`);
      done()
    })
  })
}