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

export default function textFadingEdgeTV() {

  describe('textFadingEdgeTV', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0030
     * @tc.name   : Text fadingedge tv
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : The text of the search is too long, textAlign enumeration
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0030', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0030 start.`);
      Settings.createWindow('testability/pages/component/text/TextFadingEdgeTV/TextFadingEdgeTV0030')
      let driver: Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('TextFadingEdgeTV0030_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('TextFadingEdgeTV0030_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('TextFadingEdgeTV0030_003'),1000);
      await Button3.click();
      await driver.waitForIdle(500,2000)
      let Button4: Component = await driver.waitForComponent(ON.id('TextFadingEdgeTV0030_004'),1000);
      await Button4.click();
      await driver.waitForIdle(500,2000)
      let Button5: Component = await driver.waitForComponent(ON.id('TextFadingEdgeTV0030_005'),1000);
      await Button5.click();
      await driver.waitForIdle(500,2000)
      let Button6: Component = await driver.waitForComponent(ON.id('TextFadingEdgeTV0030_006'),1000);
      await Button6.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0030 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0060
     * @tc.name   : Text fadingedge tv
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : The text of Search is too long, clear and re-enter the long text.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0060', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0060 start.`);
      Settings.createWindow('testability/pages/component/text/TextFadingEdgeTV/TextFadingEdgeTV0060')
      let driver: Driver = Driver.create();
      // cancelButton 是一个 Image 类型的组件
      let cancelButton: Component = await driver.waitForComponent(ON.type('Image'),1000);
      // 点击 cancelButton 图标
      await cancelButton.click();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('TextFadingEdgeTV0060_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0060 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0070
     * @tc.name   : Text fadingedge tv
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : The text of Search is too long, edit the text content.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0070', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0070 start.`);
      Settings.createWindow('testability/pages/component/text/TextFadingEdgeTV/TextFadingEdgeTV0070')
      let driver: Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('TextFadingEdgeTV0070_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let copybutton: Component = await driver.waitForComponent(ON.text('复制'),1000);
      await copybutton.click();
      await driver.waitForIdle(500,2000)
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let cutbutton: Component = await driver.waitForComponent(ON.text('剪切'),1000);
      await cutbutton.click();
      await driver.waitForIdle(500,2000)
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let pastebutton: Component = await driver.waitForComponent(ON.text('粘贴'),1000);
      await pastebutton.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0070 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0050
     * @tc.name   : Text fadingedge tv
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : The search text is too long, and there is a search button.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0050', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0050 start.`);
      Settings.createWindow('testability/pages/component/text/TextFadingEdgeTV/TextFadingEdgeTV0050')
      let driver: Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('TextFadingEdgeTV0050_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0050 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0020
     * @tc.name   : Text fadingedge tv
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : The disabled state is too long.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0020', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0020 start.`);
      Settings.createWindow('testability/pages/component/text/TextFadingEdgeTV/TextFadingEdgeTV0020')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0020 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0040
     * @tc.name   : Text fadingedge tv
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : The search text is too long, modify the font properties.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0040', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0040 start.`);
      Settings.createWindow('testability/pages/component/text/TextFadingEdgeTV/TextFadingEdgeTV0040')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('TextFadingEdgeTV0040_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('TextFadingEdgeTV0040_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0040 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0210
     * @tc.name   : Text fadingedge tv
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : No input, the search text is not too long.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0210', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0210 start.`);
      Settings.createWindow('testability/pages/component/text/TextFadingEdgeTV/TextFadingEdgeTV0210')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0210 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0260
     * @tc.name   : Text fadingedge tv
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : After clearing the oversized text, the placeholder text for no input is displayed correctly.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0260', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0260 start.`);
      Settings.createWindow('testability/pages/component/text/TextFadingEdgeTV/TextFadingEdgeTV0260')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('TextFadingEdgeTV0260_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      // cancelButton 是一个 Image 类型的组件
      let cancelButton: Component = await driver.waitForComponent(ON.type('Image'),1000);
      // 点击 cancelButton 图标
      await cancelButton.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0260 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0390
     * @tc.name   : Text fadingedge tv
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : The input status is that the Search text is not oversized.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0390', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0390 start.`);
      Settings.createWindow('testability/pages/component/text/TextFadingEdgeTV/TextFadingEdgeTV0390')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0390 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0420
     * @tc.name   : Text fadingedge tv
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : The input text is too long, and it remains too long after deletion.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0420', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0420 start.`);
      Settings.createWindow('testability/pages/component/text/TextFadingEdgeTV/TextFadingEdgeTV0420')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2055);
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2055);
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2055);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0420 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0430
     * @tc.name   : Text fadingedge tv
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : The input text is too long, and it remains too long after deletion.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0430', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0430 start.`);
      Settings.createWindow('testability/pages/component/text/TextFadingEdgeTV/TextFadingEdgeTV0430')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2055);
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2055);
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2055);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0430 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0440
     * @tc.name   : Text fadingedge tv
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : Limit the maximum length; the text is too long.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0440', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0440 start.`);
      Settings.createWindow('testability/pages/component/text/TextFadingEdgeTV/TextFadingEdgeTV0440')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('TextFadingEdgeTV0440_006'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0440 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0480
     * @tc.name   : Text fadingedge tv
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : Search text is too long, set the position of the input cursor.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0480', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0480 start.`);
      Settings.createWindow('testability/pages/component/text/TextFadingEdgeTV/TextFadingEdgeTV0480')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('TextFadingEdgeTV0480_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('TextFadingEdgeTV0480_006'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0480 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0570
     * @tc.name   : Text fadingedge tv
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : TextInput text is too long, textAlign enum.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0570', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0570 start.`);
      Settings.createWindow('testability/pages/component/text/TextFadingEdgeTV/TextFadingEdgeTV0570')
      let driver: Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('TextFadingEdgeTV0570_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('TextFadingEdgeTV0570_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('TextFadingEdgeTV0570_003'),1000);
      await Button3.click();
      await driver.waitForIdle(500,2000)
      let Button4: Component = await driver.waitForComponent(ON.id('TextFadingEdgeTV0570_004'),1000);
      await Button4.click();
      await driver.waitForIdle(500,2000)
      let Button5: Component = await driver.waitForComponent(ON.id('TextFadingEdgeTV0570_005'),1000);
      await Button5.click();
      await driver.waitForIdle(500,2000)
      let Button6: Component = await driver.waitForComponent(ON.id('TextFadingEdgeTV0570_006'),1000);
      await Button6.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0570 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0530
     * @tc.name   : Text fadingedge tv
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : showError is too long, no fade-out, no marquee
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0530', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0530 start.`);
      Settings.createWindow('testability/pages/component/text/TextFadingEdgeTV/TextFadingEdgeTV0530')
      let driver: Driver = Driver.create();
      let Button1: Component = await driver.waitForComponent(ON.id('TextFadingEdgeTV0530_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('TextFadingEdgeTV0530_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      let Button3: Component = await driver.waitForComponent(ON.id('TextFadingEdgeTV0530_003'),1000);
      await Button3.click();
      await driver.waitForIdle(500,2000)
      let Button4: Component = await driver.waitForComponent(ON.id('TextFadingEdgeTV0530_004'),1000);
      await Button4.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0530 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0520
     * @tc.name   : Text fadingedge tv
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : The disabled state is too long.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0520', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0520 start.`);
      Settings.createWindow('testability/pages/component/text/TextFadingEdgeTV/TextFadingEdgeTV0520')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0520 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0620
     * @tc.name   : Text fadingedge tv
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : Limit the maximum length; the text is too long.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0620', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0620 start.`);
      Settings.createWindow('testability/pages/component/text/TextFadingEdgeTV/TextFadingEdgeTV0620')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('TextFadingEdgeTV0620_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0620 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0560
     * @tc.name   : Text fadingedge tv
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : TextInput text is too long, InputType enum.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0560', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0560 start.`);
      Settings.createWindow('testability/pages/component/text/TextFadingEdgeTV/TextFadingEdgeTV0560')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('TextFadingEdgeTV0560_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('TextFadingEdgeTV0560_006'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0560 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0610
     * @tc.name   : Text fadingedge tv
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : Adjust the padding of the TextInput component to observe the fade-out effect.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0610', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0610 start.`);
      Settings.createWindow('testability/pages/component/text/TextFadingEdgeTV/TextFadingEdgeTV0610')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('TextFadingEdgeTV0610_001'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      let Button2: Component = await driver.waitForComponent(ON.id('TextFadingEdgeTV0610_002'),1000);
      await Button2.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0610 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0630
     * @tc.name   : Text fadingedge tv
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : Inline input style, TextInput text is too long.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0630', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0630 start.`);
      Settings.createWindow('testability/pages/component/text/TextFadingEdgeTV/TextFadingEdgeTV0630')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0630 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0710
     * @tc.name   : Text fadingedge tv
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : Not entered state, TextInput text is not too long.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0710', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0710 start.`);
      Settings.createWindow('testability/pages/component/text/TextFadingEdgeTV/TextFadingEdgeTV0710')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0710 finish.`);
      done()
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0760
     * @tc.name   : Text fadingedge tv
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : After clearing the overly long text, the placeholder text in the empty state is still too long.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0760', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0760 start.`);
      Settings.createWindow('testability/pages/component/text/TextFadingEdgeTV/TextFadingEdgeTV0760')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      // cancelButton 是一个 Image 类型的组件
      let cancelButton: Component = await driver.waitForComponent(ON.type('Image'),1000);
      // 点击 cancelButton 图标
      await cancelButton.click();
      await driver.waitForIdle(500,2000)
      let Button1: Component = await driver.waitForComponent(ON.id('TextFadingEdgeTV0760_006'),1000);
      await Button1.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0760 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0860
     * @tc.name   : Text fadingedge tv
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : Input state, TextInput text is not too long.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0860', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0860 start.`);
      Settings.createWindow('testability/pages/component/text/TextFadingEdgeTV/TextFadingEdgeTV0860')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0860 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0900
     * @tc.name   : Text fadingedge tv
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : Entering a long text, after deleting the text, it is no longer too long.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0900', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0900 start.`);
      Settings.createWindow('testability/pages/component/text/TextFadingEdgeTV/TextFadingEdgeTV0900')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2055);
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2055);
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2055);
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2055);
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2055);
      await driver.waitForIdle(500,2000)
      await driver.triggerKey(2055);
      await driver.waitForIdle(500,2000)
      // windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0900 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0910
     * @tc.name   : Text fadingedge tv
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : Configure showUnderline to observe the fade-out marquee effect.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0910', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0910 start.`);
      Settings.createWindow('testability/pages/component/text/TextFadingEdgeTV/TextFadingEdgeTV0910')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0910 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0920
     * @tc.name   : Text fadingedge tv
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : Set a maximum length limit; the text exceeds the allowed length.
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0920', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0920 start.`);
      Settings.createWindow('testability/pages/component/text/TextFadingEdgeTV/TextFadingEdgeTV0920')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0920 finish.`);
      done()
    })



  })
}