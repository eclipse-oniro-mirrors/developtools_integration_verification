/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
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
import { Driver, ON, Component, MouseButton } from '@kit.TestKit'
/*
 * SUB_ACE_UI_ATTRIBUTES_FONT_INTERFACE_0010:设置文本颜色
 *
 * Settings.createWindow(config.url)：
 *  创建窗口，更改窗口基本配置，更改方式详见model/Settings createWindow方法
 *
 * windowSnap.snapShot(globalThis.context)：
 *  窗口截屏&图片文件保存，存储在设备端
 *  存储文件固定，单挑用例执行后覆盖，用于自动化UI对比
 *  支持调试更改文件名为时间戳格式，更改model/snapShot createAndGetFile方法 注释L35，放开L32，L33
 *
 * Logger日志使用方法：
 *  import Logger form './model/Logger'
 *  Logger.info(TAG,`config = ${config}, err = ${JSON.stringify(exception)}`)
 * */

export default function uiComponentFormInteractionFrameNode() {

  describe('uiComponentFormInteractionFrameNode', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0060
     * @tc.name   : (FrameNode capability) 065: Select component selectedOptionBgColor as Color.Green
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0060 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode01')
      let driver:Driver=Driver.create();
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode01_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode01_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await select1.click();
      await Utils.sleep(1000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0590
     * @tc.name   : (FrameNode capability)066: Select component divider is divider({strokeWidth: "10px" ,color: Color.Orange })
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0590', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0590 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode02')
      let driver:Driver=Driver.create();
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode02_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode02_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await select1.click();
      await Utils.sleep(1000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0590 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0580
     * @tc.name   : (FrameNode capability) 064: Select component fontColor is Color.Blue
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0580', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0580 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode03')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0580 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0520
     * @tc.name   : (FrameNode capability) 073: Select the component arrowPosition as END
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0520', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0520 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode04')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0520 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0620
     * @tc.name   : (FrameNode capability) 073: Select the component space as 10
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0620', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0620 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode05')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0620 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0510
     * @tc.name   : (FrameNode capability) 068: Select component selectedOptionFontColor is Color.Pink
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0510', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0510 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode06')
      let driver:Driver=Driver.create();
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode06_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode06_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await select1.click();
      await Utils.sleep(1000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0510 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0200
     * @tc.name   : (FrameNode capability) 070: Select the component optionFont as weight: FontWeight.Bolder
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0200 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode07')
      let driver:Driver=Driver.create();
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode07_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode07_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await select1.click();
      await Utils.sleep(1000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0270
     * @tc.name   : (FrameNode capability) 063: Select component font to size:20
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0270 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode08')
      let driver:Driver=Driver.create();
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode08_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode08_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await select1.click();
      await Utils.sleep(1000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0680
     * @tc.name   : (FrameNode capability) 061: The value of the Select component is Content Select
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0680', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0680 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode09')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0680 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0740
     * @tc.name   : (FrameNode capability) 071: Select the component optionFontColor as Color.Red
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0740', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0740 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode10')
      let driver:Driver=Driver.create();
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode10_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode10_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await select1.click();
      await Utils.sleep(1000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0740 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0760
     * @tc.name   : (FrameNode capability) 071: Select the component selected as 2
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0760', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0760 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode11')
      let driver:Driver=Driver.create();
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode11_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode11_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await select1.click();
      await Utils.sleep(1000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0760 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0800
     * @tc.name   : (FrameNode capability) 062: Select the component controlSize to SMALL
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0800', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0800 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode12')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0800 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0370
     * @tc.name   : (FrameNode capability) 067: Select component selectedOptionFontr as style:FontStyle.Italic
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0370 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode13')
      let driver:Driver=Driver.create();
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode13_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode13_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await select1.click();
      await Utils.sleep(1000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0370 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0460
     * @tc.name   : (FrameNode capability) 075: Select component optionFontColor as Color.Brown
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0460', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0460 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode14')
      let driver:Driver=Driver.create();
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode14_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode14_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await select1.click();
      await Utils.sleep(1000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0460 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0900
     * @tc.name   : (FrameNode)074: Select component menuAlign to MenuAlignType.CENTER, {dx: 0, dy: 0}
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0900', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0900 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode15')
      let driver:Driver=Driver.create();
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode15_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode15_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await select1.click();
      await Utils.sleep(1000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0900 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0980
     * @tc.name   : (FrameNode capability) 076: Select the component menuBackgroundBlurStyle to COMPONENT_ULTRA_THICK
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0980', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0980 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode16')
      let driver:Driver=Driver.create();
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode16_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode16_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await select1.click();
      await Utils.sleep(1000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0980 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0660
     * @tc.name   : (FrameNode capability) 076: Select the component optionBgColor to Color.Transparent
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0660', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0660 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode17')
      let driver:Driver=Driver.create();
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode17_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode17_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await select1.click();
      await Utils.sleep(1000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0660 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0080
     * @tc.name   : (FrameNode capability) 097: Toggle component selectedColor is #FF00FF (type:Switch)
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0080 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode18')
      let driver:Driver=Driver.create();
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode18_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode18_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0160
     * @tc.name   : (FrameNode capability) 092: Toggle component selectedColor is #FF00FF (type:Button)
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0160 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode19')
      let driver:Driver=Driver.create();
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode19_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode19_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0550
     * @tc.name   : (FrameNode capability)098: Toggle component selectedColor is 0xffff00 (type:Checkbox)
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0550', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0550 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode20')
      let driver:Driver=Driver.create();
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode20_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode20_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0550 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0210
     * @tc.name   : (FrameNode capability) 095: Toggle component selectedColor is undefined (type:Button)
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0210 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode21')
      let driver:Driver=Driver.create();
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode21_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode21_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0260
     * @tc.name   : (FrameNode capability) 091: Toggle component selectedColor is Color.Green (type:Button)
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0260 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode22')
      let driver:Driver=Driver.create();
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode22_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode22_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0700
     * @tc.name   : (FrameNode capability) 100: Toggle component selectedColor is undefined (type:Switch)
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0700', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0700 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode23')
      let driver:Driver=Driver.create();
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode23_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode23_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0700 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0690
     * @tc.name   : (FrameNode capability) 099: Toggle component selectedColor is null (type:Switch)
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0690', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0690 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode24')
      let driver:Driver=Driver.create();
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode24_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode24_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0690 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0390
     * @tc.name   : (FrameNode capability) 098: Toggle component selectedColor is 0xffff00 (type:Switch)
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0390', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0390 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode25')
      let driver:Driver=Driver.create();
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode25_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode25_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0390 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0490
     * @tc.name   : (FrameNode capability) 096: Toggle component selectedColor is Color.green (type:Switch)
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0490 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode26')
      let driver:Driver=Driver.create();
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode26_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode26_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0490 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0280
     * @tc.name   : (FrameNode capability) 097: Toggle component selectedColor is #FF00FF (type:Checkbox)
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0280 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode27')
      let driver:Driver=Driver.create();
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode27_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode27_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0670
     * @tc.name   : (FrameNode capability) 100: Toggle component selectedColor is undefined (type:Checkbox)
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0670', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0670 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode28')
      let driver:Driver=Driver.create();
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode28_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode28_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0670 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0780
     * @tc.name   : (FrameNode capability) 096: Toggle component selectedColor is Color.Green (type:Checkbox)
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0780', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0780 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode29')
      let driver:Driver=Driver.create();
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode29_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode29_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0780 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0830
     * @tc.name   : (FrameNode capability) 099: Toggle component selectedColor is null (type:Checkbox)
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0830', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0830 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode30')
      let driver:Driver=Driver.create();
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode30_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode30_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0830 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0380
     * @tc.name   : (FrameNode capability) 094: Toggle component selectedColor is null (type:Button)
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0830 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode31')
      let driver:Driver=Driver.create();
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode31_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode31_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0380 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0810
     * @tc.name   : (FrameNode capability) 093: Toggle component selectedColor is 0xffff00 (type:Button)
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0810', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0810 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode32')
      let driver:Driver=Driver.create();
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode32_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode32_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0810 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0240
     * @tc.name   : (FrameNode capability) 106: Toggle component contentModifier customizes the Toggle content area
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0240 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode33')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode33_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode33_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode33_03'),1000);
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode33_04'),1000);
      await button02.click();
      await button04.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button01.click();
      await button03.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0040
     * @tc.name   : (FrameNode capability) 047: Rating component rating is 5
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0040 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode34')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0100
     * @tc.name   : (FrameNode capability) 045: Rating component rating is 0.5
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0100 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode35')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0110
     * @tc.name   : (FrameNode capability) 046: Rating component rating is -1
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0110 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode36')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0930
     * @tc.name   : (FrameNode capability) 048: Rating component rating is null
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0930', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0930 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode37')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0930 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0150
     * @tc.name   : (FrameNode capability) 043: Rating component rating is 0
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0150 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode38')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0410
     * @tc.name   : (FrameNode capability) 044: Rating component rating is 1
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0410 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode39')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0410 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0840
     * @tc.name   : (FrameNode capability) 049: Rating component rating is undefined
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0840', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0840 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode40')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0840 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0050
     * @tc.name   : (FrameNode capability) 053: Rating component stars is null
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0050 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode41')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0300
     * @tc.name   : (FrameNode capability) 052: Rating component stars is -1
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0300 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode42')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0420
     * @tc.name   : (FrameNode capability) 050: Rating component stars is 0
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0420', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0420 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode43')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0420 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0870
     * @tc.name   : (FrameNode capability) 054: Rating component stars is undefined
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0870', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0870 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode44')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0870 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0500
     * @tc.name   : (FrameNode capability) 051: Rating component stars is 5
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0500 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode45')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0500 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0120
     * @tc.name   : (FrameNode capability) 056: The Rating component indicator is false
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0120 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode46')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let rating1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode46_01'),1000);
      let rating2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode46_02'),1000);
      await driver.waitForIdle(500,2000)
      let point = await rating1.getBoundsCenter();
      let point2 = await rating2.getBoundsCenter();
      await driver.click(point.x,point.y)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await driver.click(point2.x,point2.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0540
     * @tc.name   : (FrameNode capability) 055: The Rating component indicator is true
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0540', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0540 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode47')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let rating1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode47_01'),1000);
      let rating2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode47_02'),1000);
      await driver.waitForIdle(500,2000)
      let point = await rating1.getBoundsCenter();
      let point2 = await rating2.getBoundsCenter();
      await driver.click(point.x,point.y)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await driver.click(point2.x,point2.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0540 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0360
     * @tc.name   : (FrameNode capability) 057: The Rating component indicator is null
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0360 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode48')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let rating1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode48_01'),1000);
      let rating2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode48_02'),1000);
      await driver.waitForIdle(500,2000)
      let point = await rating1.getBoundsCenter();
      let point2 = await rating2.getBoundsCenter();
      await driver.click(point.x,point.y)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await driver.click(point2.x,point2.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0360 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0970
     * @tc.name   : (FrameNode capability) 058: The Rating component indicator is undefined
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0970', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0970 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode49')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let rating1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode49_01'),1000);
      let rating2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode49_02'),1000);
      await driver.waitForIdle(500,2000)
      let point = await rating1.getBoundsCenter();
      let point2 = await rating2.getBoundsCenter();
      await driver.click(point.x,point.y)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await driver.click(point2.x,point2.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0970 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0730
     * @tc.name   : (FrameNode capability) 059: Rating component contentModifier custom scoring component
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0730', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0730 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode50')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let rating1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode50_01'),1000);
      let rating2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode50_02'),1000);
      await driver.waitForIdle(500,2000)
      let point = await rating1.getBoundsCenter();
      let point2 = await rating2.getBoundsCenter();
      await driver.click(point.x,point.y-10)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await driver.mouseClick({x:point2.x,y:point2.y-10},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0730 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0020
     * @tc.name   : (FrameNode capability) 010: The Checkbox component is selected as null
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0020 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode51')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode51_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode51_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0180
     * @tc.name   : (FrameNode capability) 011: The Checkbox component is selected as undefined
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0180 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode52')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode52_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode52_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_1010
     * @tc.name   : (FrameNode capability) 008: The Checkbox component is selected as true
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_1010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_1010 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode53')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode53_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode53_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_1010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0850
     * @tc.name   : (FrameNode capability) 009: The Checkbox component is selected as false
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0850', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0850 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode54')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode54_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode54_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0850 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0600
     * @tc.name   : (FrameNode capability) 013: The selectedColor of the Checkbox component is #FF00FF
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0600', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0600 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode55')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode55_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode55_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0600 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_1020
     * @tc.name   : (FrameNode capability) 015: The selectedColor of the Checkbox component is null
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_1020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_1020 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode56')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode56_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode56_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_1020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0290
     * @tc.name   : (FrameNode capability) 016: The selectedColor of the Checkbox component is undefined
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0290 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode57')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode57_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode57_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0290 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0720
     * @tc.name   : (FrameNode capability) 014: The selectedColor of the Checkbox component is 0xffff00
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0720', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0720 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode58')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode58_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode58_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0720 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0880
     * @tc.name   : (FrameNode capability) 012: The selectedColor of the Checkbox component is Color.Green
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0880', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0880 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode59')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode59_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode59_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0880 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0650
     * @tc.name   : (FrameNode capability) 020: The shape of the Checkbox component is undefined
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0650', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0650 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode60')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode60_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode60_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0650 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_1030
     * @tc.name   : (FrameNode capability) 030: The checkbox component checkboxShape is ROUNDED_SQUARE
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_1030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_1030 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode61')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode61_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode61_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_1030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0320
     * @tc.name   : (FrameNode capability) 032: Checkbox component checkboxShape is undefined
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0320 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode62')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode62_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode62_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0450
     * @tc.name   : (FrameNode capability) 031: Checkbox component checkboxShape is null
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0450', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0450 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode63')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode63_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode63_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0450 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0960
     * @tc.name   : (FrameNode capability) 029: Checkbox component checkboxShape is CIRCLE
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0960', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0960 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode64')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode64_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode64_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0960 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0140
     * @tc.name   : (FrameNode) 005: Checkbox component group is string type checkboxgroup
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0140 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode65')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode65_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode65_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0010
     * @tc.name   : (FrameNode) 006: Checkbox component group is null
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0010 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode66')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode66_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode66_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_1000
     * @tc.name   : (FrameNode) 007: Checkbox component group is undefined
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_1000', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_1000 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode67')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode67_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode67_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_1000 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0170
     * @tc.name   : (FrameNode capability) 002: Checkbox component name is string type "check"
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0170 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode68')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode68_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode68_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0340
     * @tc.name   : (FrameNode capability) 004: The name of the Checkbox component is undefined
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0340 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode69')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode69_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode69_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0910
     * @tc.name   : (FrameNode capability) 003: The name of the Checkbox component is null
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0910', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0910 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode70')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      let select1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode70_01'),1000);
      let select2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode70_02'),1000);
      await select1.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await select2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0910 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0030
     * @tc.name   : (FrameNode capability) 038: The Radio component checked is true
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0030 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode71')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0630
     * @tc.name   : (FrameNode capability) 040: The Radio component checked is null
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0630', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0630 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode72')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0630 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0230
     * @tc.name   : (FrameNode capability) 039: The Radio component checked is false
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0230 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode73')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0350
     * @tc.name   : (FrameNode capability) 041: The Radio component checked is undefined
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0350 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode74')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0350 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0530
     * @tc.name   : (FrameNode capability) 035: The indicatorType of the radio component is DOT
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0530', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0530 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode75')
      let driver:Driver=Driver.create();
      windowSnap.snapShot();
      let radio1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode75_01'),1000);
      let radio2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode75_02'),1000);
      await driver.waitForIdle(500,2000);
      await radio1.click();
      await radio2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0530 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0890
     * @tc.name   : (FrameNode capability) 034: The indicatorType of the radio component is TICK
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0890', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0890 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode76')
      let driver:Driver=Driver.create();
      windowSnap.snapShot();
      let radio1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode76_01'),1000);
      let radio2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode76_02'),1000);
      await driver.waitForIdle(500,2000)
      await radio1.click();
      await radio2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0890 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0220
     * @tc.name   : (FrameNode capability) 036: The indicatorType of the radio component is null
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0220 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode77')
      let driver:Driver=Driver.create();
      windowSnap.snapShot();
      let radio1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode77_01'),1000);
      let radio2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode77_02'),1000);
      await driver.waitForIdle(500,2000)
      await radio1.click();
      await radio2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0330
     * @tc.name   : (FrameNode capability) 037: The indicatorType of the radio component is undefined
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0330 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode78')
      let driver:Driver=Driver.create();
      windowSnap.snapShot();
      let radio1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode78_01'),1000);
      let radio2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode78_02'),1000);
      await driver.waitForIdle(500,2000)
      await radio1.click();
      await radio2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0570
     * @tc.name   : (FrameNode capability) 042: Radio component contentModifier customizes radiobox styles
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0570', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0570 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode79')
      let driver:Driver=Driver.create();
      windowSnap.snapShot();
      let radio1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode79_01'),1000);
      let radio2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode79_02'),1000);
      await driver.waitForIdle(500,2000)
      await radio1.click();
      await radio2.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0570 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0750
     * @tc.name   : (FrameNode capability) 078: The blockColor of the Slider component is Color.Green
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0750', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0750 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode80')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0750 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_1050
     * @tc.name   : (FrameNode capability) 079: The blockColor of the Slider component is #FF00FF
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_1050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_1050 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode81')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_1050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0640
     * @tc.name   : (FrameNode capability) 080: The blockColor of the Slider component is 0xffff00
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0640', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0640 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode82')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0640 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_1060
     * @tc.name   : (FrameNode capability) 081: The blockColor of the Slider component is null
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_1060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_1060 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode83')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_1060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0480
     * @tc.name   : (FrameNode capability) 082: The blockColor of the Slider component is undefined
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0480', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0480 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode84')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0480 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0990
     * @tc.name   : (FrameNode capability) 083: Slider component showTips is true
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0990', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0990 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode85')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let slider1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode85_01'),1000);
      let slider2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode85_02'),1000);
      await driver.waitForIdle(500,2000)
      await slider1.click();
      await slider2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0990 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0610
     * @tc.name   : (FrameNode capability) 084: Slider component showTips is false
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0610', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0610 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode86')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let slider1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode86_01'),1000);
      let slider2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode86_02'),1000);
      await driver.waitForIdle(500,2000)
      await slider1.click();
      await slider2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0610 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0130
     * @tc.name   : (FrameNode capability) 086: Slider component showTips is undefined
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0130 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode87')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let slider1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode87_01'),1000);
      let slider2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode87_02'),1000);
      await driver.waitForIdle(500,2000)
      await slider1.click();
      await slider2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0250
     * @tc.name   : (FrameNode capability) 085: Slider component showTips is null
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0250 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode88')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let slider1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode88_01'),1000);
      let slider2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode88_02'),1000);
      await driver.waitForIdle(500,2000)
      await slider1.click();
      await slider2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0070
     * @tc.name   : (FrameNode capability) 089: Slider component SliderOptions parameter correctness 3 (undefined)
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0070 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode89')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0770
     * @tc.name   : (FrameNode capability) 088: Slider component SliderOptions parameter correctness 2 (null)
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0770', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0770 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode90')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0770 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0710
     * @tc.name   : (FrameNode capability) 087: Slider component SliderOptions parameter correctness 1
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0710', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0710 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode91')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0710 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0820
     * @tc.name   : (FrameNode capability) 090: Slider component contentModifier customizes the Slider content area
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0820', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0820 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode92')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let button1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode92_01'),1000);
      let button2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode92_02'),1000);
      let button3: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode92_03'),1000);
      let button4: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode92_04'),1000);
      await driver.waitForIdle(500,2000)
      await button1.click();
      await button3.click();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button2.click();
      await button4.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0090
     * @tc.name   : (FrameNode capability) 028: The CheckboxGroup component selectedColor is undefined
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0090 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode93')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let slider1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode93_01'),1000);
      let slider2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode93_02'),1000);
      await driver.waitForIdle(500,2000)
      await slider1.click();
      await slider2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0560
     * @tc.name   : (FrameNode capability) 024: The CheckboxGroup component selectedColor is Color.Green
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0560', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0560 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode94')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let slider1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode94_01'),1000);
      let slider2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode94_02'),1000);
      await driver.waitForIdle(500,2000)
      await slider1.click();
      await slider2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0560 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0190
     * @tc.name   : (FrameNode capability) 025: The CheckboxGroup component selectedColor is #FF00FF
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0190 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode95')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let slider1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode95_01'),1000);
      let slider2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode95_02'),1000);
      await driver.waitForIdle(500,2000)
      await slider1.click();
      await slider2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0310
     * @tc.name   : (FrameNode capability) 026: The CheckboxGroup component selectedColor is 0xffff00
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0310 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode96')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let slider1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode96_01'),1000);
      let slider2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode96_02'),1000);
      await driver.waitForIdle(500,2000)
      await slider1.click();
      await slider2.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0400
     * @tc.name   : (FrameNode capability) 027: The CheckboxGroup component selectedColor is null
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0400', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0400 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode97')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let slider1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode97_01'),1000);
      let slider2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode97_02'),1000);
      await driver.waitForIdle(500,2000)
      await slider1.click();
      await slider2.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0400 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0920
     * @tc.name   : (FrameNode capability) 023: The CheckboxGroup component group is of string type "checkboxgroup1" and "checkboxgroup2"
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0920', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0920 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode98')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let slider1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode98_01'),1000);
      let slider2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode98_02'),1000);
      let slider3: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode98_03'),1000);
      let slider4: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode98_04'),1000);
      await driver.waitForIdle(500,2000)
      await slider1.click();
      await slider2.click();
      await driver.waitForIdle(500,2000)
      await slider1.click();
      await slider2.click();
      await slider3.click();
      await slider4.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0920 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0440
     * @tc.name   : (FrameNode capability) 022: Checkbox component contentModifier custom selectedColor to Color.RED
     * @tc.desc   : Verify popupbox forminteraction framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0440 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/FormInteractionFrameNode/UiComponentFormInteractionFrameNode99')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let checkbox1: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode99_01'),1000);
      let checkbox2: Component = await driver.waitForComponent(ON.id('UiComponentFormInteractionFrameNode99_02'),1000);
      await driver.waitForIdle(500,2000)
      let point1 = await checkbox1.getBoundsCenter()
      let point2 = await checkbox2.getBoundsCenter()
      await driver.mouseClick({x:point1.x-70,y:point1.y+100},MouseButton.MOUSE_BUTTON_LEFT)
      await driver.mouseClick({x:point2.x-70,y:point2.y+100},MouseButton.MOUSE_BUTTON_LEFT)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_FORMINTERACTION_FRAMENODE_0440 finish.`);
      done()
    })
  })
}