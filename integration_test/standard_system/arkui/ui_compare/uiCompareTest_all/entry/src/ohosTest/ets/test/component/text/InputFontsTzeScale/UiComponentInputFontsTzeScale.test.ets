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
import { uiAppearance } from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit'

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

export default function uiComponentInputFontsTzeScale() {

  describe('uiComponentInputFontsTzeScale', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0230
     * @tc.name   : In the input box, set minFontScale to be equal to maxFontScale
     * @tc.desc   : Verify input fontstzescale interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0230', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0230 start.`);
      Settings.createWindow('testability/pages/component/text/InputFontsTzeScale/UiComponentInputFontsTzeScale01')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentInputFontsTzeScale01'),1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0230_01');
      for(let i=0;i<4;++i) {
        await button01.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0230_0'+i+2);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0220
     * @tc.name   : Set the minFontScale parameter in the input box to be greater than maxFontScale
     * @tc.desc   : Verify input fontstzescale interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0220', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0220 start.`);
      Settings.createWindow('testability/pages/component/text/InputFontsTzeScale/UiComponentInputFontsTzeScale02')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentInputFontsTzeScale02'),1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0220_01');
      for(let i=0;i<4;++i) {
        await button01.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0220_0'+i+2);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0200
     * @tc.name   : Set maxFontScale to less than 1 in the input box
     * @tc.desc   : Verify input fontstzescale interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0200', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0200 start.`);
      Settings.createWindow('testability/pages/component/text/InputFontsTzeScale/UiComponentInputFontsTzeScale03')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentInputFontsTzeScale03'),1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0200_01');
      for(let i=0;i<4;++i) {
        await button01.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0200_0'+i+2);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0120
     * @tc.name   : TextInput password mode, set the small eye icon
     * @tc.desc   : Verify input fontstzescale interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0120', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0120 start.`);
      Settings.createWindow('testability/pages/component/text/InputFontsTzeScale/UiComponentInputFontsTzeScale04')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentInputFontsTzeScale04'),1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0120_01');
      for(let i=0;i<4;++i) {
        await button01.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0120_0'+i+2);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0010
     * @tc.name   : Set minFontScale and maxFontScale in the input box, and only set the prompt text
     * @tc.desc   : Verify input fontstzescale interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0010 start.`);
      Settings.createWindow('testability/pages/component/text/InputFontsTzeScale/UiComponentInputFontsTzeScale05')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentInputFontsTzeScale05'),1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0010_01');
      for(let i=0;i<4;++i) {
        await button01.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0010_0'+i+2);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0150
     * @tc.name   : The input box does not set maxFontScale, and the fontSizeMaxScale is set to the application
     * @tc.desc   : Verify input fontstzescale interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0150', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0150 start.`);
      Settings.createWindow('testability/pages/component/text/InputFontsTzeScale/UiComponentInputFontsTzeScale06')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentInputFontsTzeScale06'),1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0150_01');
      for(let i=0;i<4;++i) {
        await button01.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0150_0'+i+2);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0140
     * @tc.name   : In the input field, only maxFontScale is set, not minFontScale
     * @tc.desc   : Verify input fontstzescale interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0140', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0140 start.`);
      Settings.createWindow('testability/pages/component/text/InputFontsTzeScale/UiComponentInputFontsTzeScale07')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentInputFontsTzeScale07'),1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0140_01');
      for(let i=0;i<4;++i) {
        await button01.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0140_0'+i+2);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0210
     * @tc.name   : Set maxFontScale in the input box to undifined/null
     * @tc.desc   : Verify input fontstzescale interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0210', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0210 start.`);
      Settings.createWindow('testability/pages/component/text/InputFontsTzeScale/UiComponentInputFontsTzeScale08')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentInputFontsTzeScale08'),1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0210_01');
      for(let i=0;i<4;++i) {
        await button01.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0210_0'+i+2);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0190
     * @tc.name   : Set minFontScale in the input box to undifined/null
     * @tc.desc   : Verify input fontstzescale interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0190', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0190 start.`);
      Settings.createWindow('testability/pages/component/text/InputFontsTzeScale/UiComponentInputFontsTzeScale09')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentInputFontsTzeScale09'),1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0190_01');
      for(let i=0;i<4;++i) {
        await button01.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0190_0'+i+2);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0170
     * @tc.name   : Set the minFontScale parameter in the input box to be less than 0
     * @tc.desc   : Verify input fontstzescale interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0170', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0170 start.`);
      Settings.createWindow('testability/pages/component/text/InputFontsTzeScale/UiComponentInputFontsTzeScale10')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentInputFontsTzeScale10'),1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0170_01');
      for(let i=0;i<4;++i) {
        await button01.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0170_0'+i+2);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0160
     * @tc.name   : Set maxFontScale in the input box and set fontSizeMaxScale in the application box
     * @tc.desc   : Verify input fontstzescale interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0160', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0160 start.`);
      Settings.createWindow('testability/pages/component/text/InputFontsTzeScale/UiComponentInputFontsTzeScale11')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentInputFontsTzeScale11'),1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0160_01');
      for(let i=0;i<4;++i) {
        await button01.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0160_0'+i+2);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0180
     * @tc.name   : In the input box, set the minFontScale to be greater than 1
     * @tc.desc   : Verify input fontstzescale interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0180', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0180 start.`);
      Settings.createWindow('testability/pages/component/text/InputFontsTzeScale/UiComponentInputFontsTzeScale12')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentInputFontsTzeScale12'),1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0180_01');
      for(let i=0;i<4;++i) {
        await button01.click();
        await driver.waitForIdle(500,2000);
        windowSnap.snapShot('SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0180_0'+i+2);
      }
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_INPUT_FONTSTZESCALE_0180 finish.`);
      done()
    })
  })
}