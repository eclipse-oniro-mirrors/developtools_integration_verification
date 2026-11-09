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

export default function uiComponentTextTv() {

  describe('uiComponentTextTv', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0190
     * @tc.name   : marqueeOptions.marqueePolicy
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0190', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0190 start.`);
      Settings.createWindow('testability/pages/component/text/TextTv_02/UiComponentTextTv01')
      let driver:Driver=Driver.create();
      await Utils.sleep(2500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0010
     * @tc.name   : marqueeOptions.start is set to false
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0010 start.`);
      Settings.createWindow('testability/pages/component/text/TextTv_02/UiComponentTextTv02')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0320
     * @tc.name   : set start from true to false
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0320', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0320 start.`);
      Settings.createWindow('testability/pages/component/text/TextTv_02/UiComponentTextTv03')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentTextTv03'),1000);
      windowSnap.snapShot()
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0330
     * @tc.name   : set TextOverflow from MARQUEE to none
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0330', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0330 start.`);
      Settings.createWindow('testability/pages/component/text/TextTv_02/UiComponentTextTv04')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentTextTv04'),1000);
      windowSnap.snapShot()
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0330
     * @tc.name   : Loss of focus Stop marquee triggers callback
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0340', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0340 start.`);
      Settings.createWindow('testability/pages/component/text/TextTv_02/UiComponentTextTv05')
      let driver:Driver=Driver.create();
      let text: Component = await driver.waitForComponent(ON.id('UiComponentTextTv05_01'),1000);
      let button: Component = await driver.waitForComponent(ON.id('UiComponentTextTv05_02'),1000);
      let point = await text.getBoundsCenter();
      let point2 = await button.getBoundsCenter();
      await driver.mouseMoveTo({x:point.x,y:point.y})
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await driver.mouseMoveTo({x:point2.x,y:point2.y})
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0310
     * @tc.name   : Marquee starts, triggering a callback to MarqueeState.START
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0310', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0310 start.`);
      Settings.createWindow('testability/pages/component/text/TextTv_02/UiComponentTextTv06')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentTextTv06_02'),1000);
      windowSnap.snapShot()
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0530
     * @tc.name   : The text text is not too long, and onMarqueeStateChange is invalid
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0530', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0530 start.`);
      Settings.createWindow('testability/pages/component/text/TextTv_02/UiComponentTextTv07')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0530 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0210
     * @tc.name   : 023.marqueeOptions.marqueePolicy is set to ON_FOCUS
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0210', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0210 start.`);
      Settings.createWindow('testability/pages/component/text/TextTv_02/UiComponentTextTv09')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentTextTv09'),1000);
      let text: Component = await driver.waitForComponent(ON.id('UiComponentTextTv09_01'),1000);
      let text2: Component = await driver.waitForComponent(ON.id('UiComponentTextTv09_02'),1000);
      let point = await text.getBoundsCenter();
      let point2 = await text2.getBoundsCenter();
      await button.click();
      await driver.mouseMoveTo({x:point.x,y:point.y});
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await driver.mouseMoveTo({x:point2.x,y:point2.y});
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0390
     * @tc.name   : 001. Marquee setting takes effect, marqueeOptions.fadeout=false, maxlines parameter setting is invalid
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0390', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0390 start.`);
      Settings.createWindow('testability/pages/component/text/TextTv_02/UiComponentTextTv10')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0390 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0400
     * @tc.name   : 002. Marquee setting takes effect, marqueeOptions.fadeout=true, maxlines parameter setting is invalid
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0400', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0400 start.`);
      Settings.createWindow('testability/pages/component/text/TextTv_02/UiComponentTextTv11')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0400 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0420
     * @tc.name   : 004. Marquee setting takes effect, marqueeOptions.start=true, maxlines parameter setting is invalid
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0420', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0420 start.`);
      Settings.createWindow('testability/pages/component/text/TextTv_02/UiComponentTextTv12')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0420 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0410
     * @tc.name   : 003. Marquee setting takes effect, marqueeOptions.start=false, maxlines parameter setting is invalid
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0410', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0410 start.`);
      Settings.createWindow('testability/pages/component/text/TextTv_02/UiComponentTextTv13')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0410 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0480
     * @tc.name   : 010.textoverflowThe marquee value is not set, so the marquee cannot take effect
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0480', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0480 start.`);
      Settings.createWindow('testability/pages/component/text/TextTv_02/UiComponentTextTv14')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentTextTv14_02'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0480 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0470
     * @tc.name   : 009.textoverflow does not set a marquee value, onMarqueeStateChange setting is invalid
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0470', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0470 start.`);
      Settings.createWindow('testability/pages/component/text/TextTv_02/UiComponentTextTv15')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentTextTv15_02'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0470 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0740
     * @tc.name   : 036. Toggle the fadeout switch to see the fades
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0740', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0740 start.`);
      Settings.createWindow('testability/pages/component/text/TextTv_02/UiComponentTextTv16')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentTextTv16_02'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0740 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0540
     * @tc.name   : The text text is not super long, and the textoverflow setting is invalid
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0540', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0540 start.`);
      Settings.createWindow('testability/pages/component/text/TextTv_02/UiComponentTextTv17')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0540 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0520
     * @tc.name   : The text text is not super long, and the marqueeOptions setting is invalid
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0520', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0520 start.`);
      Settings.createWindow('testability/pages/component/text/TextTv_02/UiComponentTextTv18')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0520 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0570
     * @tc.name   : 019.text component to change the padding range to see the fading effect
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0570', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0570 start.`);
      Settings.createWindow('testability/pages/component/text/TextTv_02/UiComponentTextTv19')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentTextTv19_02'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0570 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0160
     * @tc.name   : 017.marqueeOptions.loop is set to -1
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0160', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0160 start.`);
      Settings.createWindow('testability/pages/component/text/TextTv_02/UiComponentTextTv20')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0570 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0170
     * @tc.name   : 020.marqueeOptions.loop is set to 0
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0170', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0170 start.`);
      Settings.createWindow('testability/pages/component/text/TextTv_02/UiComponentTextTv21')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0120
     * @tc.name   : 013.marqueeOptions.fromStart is not set
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0120', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0120 start.`);
      Settings.createWindow('testability/pages/component/text/TextTv_02/UiComponentTextTv22')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0230
     * @tc.name   : 026.marqueeOptions.step not set
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0230', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0230 start.`);
      Settings.createWindow('testability/pages/component/text/TextTv_02/UiComponentTextTv23')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await Utils.sleep(2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0240
     * @tc.name   : 027.marqueeOptions.step set to 0
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0240', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0240 start.`);
      Settings.createWindow('testability/pages/component/text/TextTv_02/UiComponentTextTv24')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await Utils.sleep(2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0260
     * @tc.name   : 030.marqueeOptions.step set to 1.5
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0260', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0260 start.`);
      Settings.createWindow('testability/pages/component/text/TextTv_02/UiComponentTextTv25')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await Utils.sleep(2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0050
     * @tc.name   : 006.marqueeOptions.delay is set to 0
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0050', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0050 start.`);
      Settings.createWindow('testability/pages/component/text/TextTv_02/UiComponentTextTv26')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0080
     * @tc.name   : 006.marqueeOptions.delay is set to -10
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0080', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0080 start.`);
      Settings.createWindow('testability/pages/component/text/TextTv_02/UiComponentTextTv27')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0680
     * @tc.name   : 030. Set the padding attribute and marquee execution range
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0680', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0680 start.`);
      Settings.createWindow('testability/pages/component/text/TextTv_02/UiComponentTextTv28')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0680 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0630
     * @tc.name   : 025.text component setting the symbolspan subcomponent on fading effect
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0630', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0630 start.`);
      Settings.createWindow('testability/pages/component/text/TextTv_02/UiComponentTextTv29')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0630 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0620
     * @tc.name   : 025.text component setting the span subcomponent on fading effect
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0620', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0620 start.`);
      Settings.createWindow('testability/pages/component/text/TextTv_02/UiComponentTextTv30')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0620 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0720
     * @tc.name   : 034.text component, the effect of height on fading
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0720', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0720 start.`);
      Settings.createWindow('testability/pages/component/text/TextTv_02/UiComponentTextTv31')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentTextTv31_02'),1000);
      windowSnap.snapShot()
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0720 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TV_0780
     * @tc.name   : 040. After setting the mirror language, check the marquee and fade away
     * @tc.desc   : Verify text tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TV_0780', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0780 start.`);
      Settings.createWindow('testability/pages/component/text/TextTv_02/UiComponentTextTv32')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentTextTv32_02'),1000);
      windowSnap.snapShot()
      await button.click();
      await Utils.sleep(1000)
      await button.click();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TV_0780 finish.`);
      done()
    })
  })
}