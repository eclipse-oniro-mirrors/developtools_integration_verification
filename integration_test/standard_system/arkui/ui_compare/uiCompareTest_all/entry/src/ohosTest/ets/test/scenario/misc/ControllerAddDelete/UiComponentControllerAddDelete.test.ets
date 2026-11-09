/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

export default function uiComponentControllerAddDelete() {

  describe('uiComponentControllerAddDelete', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0040
     * @tc.name   : TextInput/TextArea/Search,set addText,and set textOperationOptions to be greater than the text length
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0040', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0040 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete01');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0040_01');
      let button: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete01'),1000);
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0040_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0040 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0030
     * @tc.name   : TextInput/TextArea/Search,set addText,and set textOperationOptions offset is 5
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0030', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0030 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete02');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0030_01');
      let button: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete02'),1000);
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0030_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0030 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0050
     * @tc.name   : TextInput/TextArea/Search,set addText,and set textOperationOptions offset is null/undefined
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0050', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0050 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete03');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0050_01');
      let button: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete03'),1000);
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0050_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0050 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0020
     * @tc.name   : TextInput/TextArea/Search,set addText,and set textOperationOptions offset is -1
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0020', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0020 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete04');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0020_01');
      let button: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete04'),1000);
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0020_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0020 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0240
     * @tc.name   : TextInput/TextArea/Search component, set maxLength, and add addText
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0240', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0240 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete05');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0240_01');
      let button: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete05'),1000);
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0240_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0240 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0100
     * @tc.name   : TextInput/TextArea/Search component, set deleteText,set start only,and set undefined/null
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0100', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0100 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete06');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0100_01');
      let button: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete06'),1000);
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0100_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0100_02 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0010
     * @tc.name   : TextInput/TextArea/Search component, set addText,and leave textOperationOptions unspecified
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0010 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete07');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0010_01');
      let button: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete07'),1000);
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0010_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0010 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0060
     * @tc.name   : TextInput/TextArea/Search component,set addText,set textOperationOptions,add it in the middle of the emoji
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0060', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0060 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete08');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0060_01');
      let button: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete08'),1000);
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0060_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0060 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0160
     * @tc.name   : set deleteText,set start and end, greater than 0 and less than the text length,and end greater than start
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0160', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0160 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete09');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0160_01');
      let button: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete09'),1000);
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0160_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0160 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0070
     * @tc.name   : TextInput/TextArea/Search component, set deleteText, but not TextRange
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0070', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0070 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete10');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0070_01');
      let button: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete10'),1000);
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0070_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0070 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0150
     * @tc.name   : TextInput/TextArea/Search component, set deleteText,set only end,set greater than the text length
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0150', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0150 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete11');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0150_01');
      let button: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete11'),1000);
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0150_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0150 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0080
     * @tc.name   : TextInput/TextArea/Search component, set deleteText, and set start only
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0080', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0080 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete12');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0080_01');
      let button: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete12'),1000);
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0080_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0080 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0140
     * @tc.name   : TextInput/TextArea/Search component, set deleteText,set only end,and set undefined/null
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0140', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0140 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete13');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0140_01');
      let button: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete13'),1000);
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0140_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0140 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0090
     * @tc.name   : TextInput/TextArea/Search component, set deleteText, set only start, less than 0
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0090', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0090 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete14');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0090_01');
      let button: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete14'),1000);
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0090_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0090 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0110
     * @tc.name   : TextInput/TextArea/Search component,set deleteText, set start only,and set greater than the text length
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0110', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0110 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete15');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0110_01');
      let button: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete15'),1000);
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0110_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0110 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0130
     * @tc.name   : TextInput/TextArea/Search component, set deleteText, set only end, less than 0
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0130', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0130 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete16');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0130_01');
      let button: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete16'),1000);
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0130_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0130 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0120
     * @tc.name   : TextInput/TextArea/Search component,set deleteText,set only end,greater than 0 and less than the text length
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0120', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0120 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete17');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0120_01');
      let button: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete17'),1000);
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0120_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0120 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0170
     * @tc.name   : set deleteText, set start and end, greater than 0 and less than the text length, and end less than start
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0170', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0170 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete18');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0170_01');
      let button: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete18'),1000);
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0170_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0170 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0190
     * @tc.name   : set deleteText, set start and end, and set the text length to be greater than the text length
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0190', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0190 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete19');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0190_01');
      let button: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete19'),1000);
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0190_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0190 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0180
     * @tc.name   : TextInput/TextArea/Search component, set deleteText, set start and end, less than 0
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0180', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0180 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete20');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0180_01');
      let button: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete20'),1000);
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0180_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0180 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0260
     * @tc.name   : TextInput/TextArea/Search component, set inputFilter, and set addText
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0260', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0260 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete21');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0260_01');
      let button: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete21'),1000);
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0260_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0260 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0270
     * @tc.name   : TextInput/TextArea/Search component, set type, and set addText
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0270', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0270 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete22');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0270_01');
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete22_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete22_02'),1000);
      await button01.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0270_02');
      await driver.waitForIdle(500,2000);
      await button02.click();
      await button01.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0270_03');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0270 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0280
     * @tc.name   : TextInput/TextArea/Search component, set type, and set deleteText
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0280', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0280 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete23');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0280_01');
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete23_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete23_02'),1000);
      await button01.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0280_02');
      await driver.waitForIdle(500,2000);
      await button02.click();
      await button01.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0280_03');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0280 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0310
     * @tc.name   : TextInput/TextArea component, set style, set deleteText
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0310', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0310 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete24');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0310_01');
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete24_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete24_02'),1000);
      await button01.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0310_02');
      await driver.waitForIdle(500,2000);
      await button02.click();
      await button01.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0310_03');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0310 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0340
     * @tc.name   : TextArea and TextInput components are in inline mode,set maxLines, and set addText
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0340', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0340 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete25');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0340_01');
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete25_01'),1000);
      let textinput: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete25_02'),1000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete25_03'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete25_04'),1000);
      await button01.click();
      await button02.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0340_02');
      await driver.waitForIdle(500,2000);
      await textarea.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0340_03');
      await driver.waitForIdle(500,2000);
      await textinput.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0340_04');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0340 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0330
     * @tc.name   : TextInput/TextArea/Search component, set the style,and set textAlign
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0330', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0330 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete26');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0330_01');
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete26_1'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete26_2'),1000);
      await button01.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0330_02');
      await driver.waitForIdle(500,2000);
      await button02.click();
      await button01.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0330_03');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0330 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0350
     * @tc.name   : The TextArea and TextInput components are in inline mode, and textOverflow is set to Ellipsis
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0350', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0350 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete27');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0350_01');
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete27_01'),1000);
      let textinput: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete27_02'),1000);
      let button: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete27_03'),1000);
      await textarea.click();
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0350_02');
      await driver.waitForIdle(500,2000);
      await textinput.click();
      await button.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0350_03');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0350 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0370
     * @tc.name   : TextInput/TextArea/Search component and set setTextSelection
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0370', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0370 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete28');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0370_01');
      let textarea: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete28_01'),1000);
      let textinput: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete28_02'),1000);
      let search: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete28_03'),1000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete28_04'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete28_05'),1000);
      await textarea.click();
      await button01.click();
      await button02.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0370_02');
      await driver.waitForIdle(500,2000);
      await textinput.click();
      await button01.click();
      await button02.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0370_03');
      await driver.waitForIdle(500,2000);
      await search.click();
      await search.inputText('hello world')
      await button01.click();
      await button02.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0370_04');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0370 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0380
     * @tc.name   : TextInput/TextArea/Search component and set onChange
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0380', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0380 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete29');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0380_01');
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete29_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete29_02'),1000);
      await button01.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0380_02');
      await driver.waitForIdle(500,2000);
      await button02.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0380_03');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0380 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0390
     * @tc.name   : TextInput/TextArea/Search component and set onwillChange
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0390', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0390 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete30');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0390_01');
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete30_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete30_02'),1000);
      await button01.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0390_02');
      await driver.waitForIdle(500,2000);
      await button02.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0390_03');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0390 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0400
     * @tc.name   : TextInput/TextArea/Search component, set onWillInsert, onDidInsert, onWillDelete, and onDidDelete
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0400', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0400 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete31');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0400_01');
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete31_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete31_02'),1000);
      await button01.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0400_02');
      await driver.waitForIdle(500,2000);
      await button02.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0400_03');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0400 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0450
     * @tc.name   : TextInput/TextArea/Search component, which returns the addText location
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0450', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0450 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete32');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0450_01');
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete32_01'),1000);
      await button01.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0450_02');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0450 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0410
     * @tc.name   : TextInput/TextArea/Search component, Image testing
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0410', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0410 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete33');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0410_01');
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete33_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete33_02'),1000);
      await button01.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0410_02');
      await driver.waitForIdle(500,2000);
      await button02.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0410_03');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0450 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0200
     * @tc.name   : TextInput/TextArea/Search component, set getSelection, and select part of the text
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0200', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0200 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete34');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0200_01');
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete34_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete34_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete34_03'),1000);
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete34_04'),1000);
      let button05: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete34_05'),1000);
      await button03.click();
      await button01.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0200_02');
      await driver.waitForIdle(500,2000);
      await button04.click();
      await button01.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0200_03');
      await driver.waitForIdle(500,2000);
      await button05.inputText('aaaaa');
      await button02.click();
      await button01.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0200_04');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0200 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0220
     * @tc.name   : TextInput/TextArea/Search component, set getSelection, and select part of the text
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0220', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0220 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete35');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0220_01');
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete35_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete35_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete35_03'),1000);
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete35_04'),1000);
      let button05: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete35_05'),1000);
      await button03.click();
      await button02.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0220_02');
      await driver.waitForIdle(500,2000);
      await button04.click();
      await button02.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0220_03');
      await driver.waitForIdle(500,2000);
      await button05.inputText('aaaaa');
      await button02.click();
      await driver.triggerKey(9);
      await button01.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0220_04');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0220 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0440
     * @tc.name   : TextInput/TextArea/Search component, add text if the text is very long
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0440', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0440 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete36');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0440_01');
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete36_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete36_02'),1000);
      await button02.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0440_02');
      await driver.waitForIdle(500,2000);
      await button01.click();
      await button02.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0440_03');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0440 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0250
     * @tc.name   : TextInput/TextArea/Search component, set getSelection, and select part of the text
     * @tc.desc   : Verify controller add delete interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0250', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0250 start.`);
      Settings.createWindow('testability/pages/scenario/misc/ControllerAddDelete/UiComponentControllerAddDelete37');
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0250_01');
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete37_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete37_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete37_03'),1000);
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentControllerAddDelete37_04'),1000);
      await button01.click();
      await button04.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0250_02');
      await driver.waitForIdle(500,2000);
      await button02.click();
      await button04.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0250_03');
      await driver.waitForIdle(500,2000);
      await button03.inputText('aaaaaaaaaaaaa');
      await driver.doubleClick(200, 450);
      await driver.mouseClick({x:200, y:400}, MouseButton.MOUSE_BUTTON_LEFT, 2072);
      await button04.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0250_04');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CONTROLLER_ADD_DELETE_0220 finish.`);
      done();
    })
  })
}