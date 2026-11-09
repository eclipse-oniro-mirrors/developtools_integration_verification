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

export default function uIComponentScrollSwiperGet() {

  describe('uIComponentScrollSwiperGet', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0750
     * @tc.name   : Function Test: Obtaining without setting the Swiper component's swipe switching function
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0750', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0750 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet01')
      let driver:Driver=Driver.create();
      let swiper: Component = await driver.waitForComponent(ON.id('UIComponentScrollSwiperGet01_1'),1000);
      let point = await swiper.getBoundsCenter()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.swipe(point.x+200,point.y,point.x-300,point.y,600);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0750 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0440
     * @tc.name   : Function Test: Setting Swiper curve FastOutSlowIn
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0440 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet02')
      let driver:Driver=Driver.create();
      let swiper: Component = await driver.waitForComponent(ON.id('UIComponentScrollSwiperGet02_1'),1000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0440 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0370
     * @tc.name   : Function Test: Setting Swiper duration 400.5
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0370 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet03')
      let driver:Driver=Driver.create();
      let swiper: Component = await driver.waitForComponent(ON.id('UIComponentScrollSwiperGet03_1'),1000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0370 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0510
     * @tc.name   : Function Test: Setting Swiper curve Friction
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0510', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0510 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet04')
      let driver:Driver=Driver.create();
      let swiper: Component = await driver.waitForComponent(ON.id('UIComponentScrollSwiperGet04_1'),1000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0510 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0320
     * @tc.name   : Function Test: Setting Swiper vertical false
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0320 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet05')
      let driver:Driver=Driver.create();
      let swiper: Component = await driver.waitForComponent(ON.id('UIComponentScrollSwiperGet05_1'),1000);
      let point = await swiper.getBoundsCenter()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.swipe(point.x+200,point.y,point.x-300,point.y,600);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0050
     * @tc.name   : Function Test: Setting Swiper loop true
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0050 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet06')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0520
     * @tc.name   : Function Test: Not setting Swiper curve
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0520', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0520 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet07')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0520 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0190
     * @tc.name   : Function Test: Setting Swiper indicator true
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0190 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet08')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0240
     * @tc.name   : Function Test: Setting Swiper interval -4000
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0240 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet09')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(4000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0820
     * @tc.name   : Function Test: Setting Swiper displayArrow true
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0820', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0820 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet10')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0820 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0470
     * @tc.name   : Function Test: Setting Swiper curve ExtremeDeceleration
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0470', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0470 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet11')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0470 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0500
     * @tc.name   : Function Test: Setting Swiper curve Smooth
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0500 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet12')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0500 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0490
     * @tc.name   : Function Test: Setting Swiper curve Rhythm
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0490 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet14')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0490 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0260
     * @tc.name   : Function Test: Not setting Swiper interval
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0260 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet15')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(3500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0060
     * @tc.name   : Function Test: Setting Swiper loop false
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0060 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet16')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(3500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0120
     * @tc.name   : Function Test: Setting Swiper autoPlay true
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0120 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet18')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(3500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0530
     * @tc.name   : Function Test: Setting Swiper itemSpace 50
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0530', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0530 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet19')
      let driver:Driver=Driver.create();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0530 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0780
     * @tc.name   : Function Test: Setting Swiper displayArrow hover
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0780', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0780 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet20')
      let driver:Driver=Driver.create();
      let swiper: Component = await driver.waitForComponent(ON.id('UIComponentScrollSwiperGet20_1'),1000);
      let point = await swiper.getBounds()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await driver.mouseMoveTo({x:(point.right-point.left)/2+point.left, y:point.bottom})
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0780 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0250
     * @tc.name   : Function Test: Setting Swiper interval 3000.5
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0250 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet21')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(3500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0140
     * @tc.name   : Function Test: Not setting Swiper autoPlay
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0140 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet22')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0540
     * @tc.name   : Function Test: Setting Swiper itemSpace -50
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0540', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0540 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet23')
      let driver:Driver=Driver.create();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0540 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0550
     * @tc.name   : Function Test: Setting Swiper itemSpace 0
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0550', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0550 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet24')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0550 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0580
     * @tc.name   : Function Test: Setting Swiper index 2
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0580', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0580 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet25')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0580 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0570
     * @tc.name   : Function Test: Not setting Swiper itemSpace
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0570', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0570 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet26')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0570 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0600
     * @tc.name   : Function Test: Setting Swiper index -2
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0600', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0600 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet27')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0600 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0560
     * @tc.name   : Function Test: Setting Swiper itemSpace 0.1
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0560', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0560 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet28')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0560 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0610
     * @tc.name   : Function Test: Setting Swiper index 100
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0610', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0610 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet29')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0610 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0070
     * @tc.name   : Function Test: Not setting Swiper loop
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0070 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet30')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(3000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0620
     * @tc.name   : Function Test: Not setting Swiper index
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0620', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0620 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet31')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0620 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0640
     * @tc.name   : Function Test: Setting Swiper displayCount 1
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0640', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0640 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet32')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0640 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0410
     * @tc.name   : Function Test: Setting Swiper curve EaseIn
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0410 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet33')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0410 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0630
     * @tc.name   : Function Test: Setting Swiper displayCount 2
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0630', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0630 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet34')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0630 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0400
     * @tc.name   : Function Test: Setting Swiper curve Ease
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0400', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0400 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet35')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0400 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0200
     * @tc.name   : Function Test: Setting Swiper showIndicator false
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0200 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet36')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0310
     * @tc.name   : Function Test: Setting Swiper vertical true
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0310 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet37')
      let driver:Driver=Driver.create();
      let swiper: Component = await driver.waitForComponent(ON.id('UIComponentScrollSwiperGet37_1'),1000);
      let point = await swiper.getBoundsCenter()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.mouseDrag({x:point.x+100,y:point.y+150},{x:point.x+100,y:point.y-300},MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0650
     * @tc.name   : Function Test: Setting Swiper displayCount 2.5
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0650', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0650 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet38')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0650 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0450
     * @tc.name   : Function Test: Setting Swiper curve LinearOutSlowIn
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0450', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0450 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet39')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0450 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0460
     * @tc.name   : Function Test: Setting Swiper curve FastOutLinearIn
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0460', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0460 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet40')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0460 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0660
     * @tc.name   : Function Test: Setting Swiper displayCount -2
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0660', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0660 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet41')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0660 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0420
     * @tc.name   : Function Test: Setting Swiper curve EaseOut
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0420', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0420 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet42')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0420 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0480
     * @tc.name   : Function Test: Setting Swiper curve Sharp
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0480', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0480 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet43')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0480 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0680
     * @tc.name   : Function Test: Not setting Swiper displayCount
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0680', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0680 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet44')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0680 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0390
     * @tc.name   : Function Test: Setting Swiper curve Linear
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0390', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0390 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet45')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0390 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0430
     * @tc.name   : Function Test: Setting Swiper curve EaseInOut
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0430', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0430 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet46')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0430 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0340
     * @tc.name   : Function Test: Setting Swiper duration 1000
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0340 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet47')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(2500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0730
     * @tc.name   : Function Test: Setting Swiper disableSwipe true
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0730', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0730 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet48')
      let driver:Driver=Driver.create();
      let swiper: Component = await driver.waitForComponent(ON.id('UIComponentScrollSwiperGet48_1'),1000);
      let point = await swiper.getBoundsCenter()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.swipe(point.x+200,point.y,point.x-300,point.y,600);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0730 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0130
     * @tc.name   : Function Test: Setting Swiper autoPlay false
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0130 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet49')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(3500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0330
     * @tc.name   : Function Test: Not setting Swiper vertical
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0330 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet50')
      let driver:Driver=Driver.create();
      let swiper: Component = await driver.waitForComponent(ON.id('UIComponentScrollSwiperGet50_1'),1000);
      let point = await swiper.getBoundsCenter()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.swipe(point.x+200,point.y,point.x-300,point.y,600);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0210
     * @tc.name   : Function Test: Not setting Swiper showIndicator
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0210 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet51')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0380
     * @tc.name   : Function Test: Not setting Swiper duration
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0380 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet52')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(2500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0380 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0740
     * @tc.name   : Function Test: Setting Swiper disableSwipe false
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0740', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0740 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet53')
      let driver:Driver=Driver.create();
      let swiper: Component = await driver.waitForComponent(ON.id('UIComponentScrollSwiperGet53_1'),1000);
      let point = await swiper.getBoundsCenter()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.swipe(point.x+200,point.y,point.x-300,point.y,600);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0740 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0350
     * @tc.name   : Function Test: Setting Swiper duration -1000
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0350 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet54')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(2500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0350 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0670
     * @tc.name   : Function Test: Setting Swiper displayCount 0
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0670', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0670 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet55')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(2500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0670 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0360
     * @tc.name   : Function Test: Setting Swiper duration 0
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0360 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet56')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(2500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0360 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0220
     * @tc.name   : Function Test: Setting Swiper interval 4000
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0220 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet57')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(5000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0840
     * @tc.name   : Function Test: Not setting Swiper showDisplayArrow
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0840', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0840 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet58')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0840 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0230
     * @tc.name   : Function Test: Setting Swiper interval 0
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0230 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet59')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(3500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0830
     * @tc.name   : Function Test: Setting Swiper showDisplayArrow false
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0830', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0830 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet60')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0830 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0590
     * @tc.name   : Function Test: Setting Swiper index 2.5
     * @tc.desc   : Verify scroll swiper get interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0590', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0590 start.`);
      Settings.createWindow('testability/pages/component/scroll/ScrollSwiperGet/UIComponentScrollSwiperGet61')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_GET_0590 finish.`);
      done()
    })

  })
}