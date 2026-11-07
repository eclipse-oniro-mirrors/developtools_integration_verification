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

export default function uiComponentCanvasModifier() {

  describe('uiComponentCanvasModifier', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_1330
     * @tc.name   : Sets the radial gradient
     * @tc.desc   : Verify canvas modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_1330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_1330 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasModifier/UiComponentCanvasModifier01')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_1330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0870
     * @tc.name   : setTransform translate is 50
     * @tc.desc   : Verify canvas modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0870', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0870 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasModifier/UiComponentCanvasModifier02')
      let driver:Driver = Driver.create();
      windowSnap.snapShot();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentCanvasModifier02'),1000);
      await button.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0870 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0760
     * @tc.name   : setTransform scaleX is 40
     * @tc.desc   : Verify canvas modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0760', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0760 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasModifier/UiComponentCanvasModifier03')
      let driver:Driver = Driver.create();
      windowSnap.snapShot();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentCanvasModifier03'),1000);
      await button.click();
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0760 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0770
     * @tc.name   : setTransform scaleY is 1.5
     * @tc.desc   : Verify canvas modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0770', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0770 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasModifier/UiComponentCanvasModifier04')
      let driver:Driver = Driver.create();
      windowSnap.snapShot();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentCanvasModifier04'),1000);
      await button.click();
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0770 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0840
     * @tc.name   : setTransform rotateX is 0.5 rotateY is 0.5
     * @tc.desc   : Verify canvas modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0840', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0840 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasModifier/UiComponentCanvasModifier05')
      let driver:Driver = Driver.create();
      windowSnap.snapShot();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentCanvasModifier05'),1000);
      await button.click();
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0840 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0730
     * @tc.name   : setTransform scaleX is 1
     * @tc.desc   : Verify canvas modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0730', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0730 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasModifier/UiComponentCanvasModifier06')
      let driver:Driver = Driver.create();
      windowSnap.snapShot();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentCanvasModifier06'),1000);
      await button.click();
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0730 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0860
     * @tc.name   : setTransform scaleX is 1
     * @tc.desc   : Verify canvas modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0860', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0860 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasModifier/UiComponentCanvasModifier07')
      let driver:Driver = Driver.create();
      windowSnap.snapShot();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentCanvasModifier07'),1000);
      await button.click();
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0860 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0780
     * @tc.name   : setTransform scaleY is -1
     * @tc.desc   : Verify canvas modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0780', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0780 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasModifier/UiComponentCanvasModifier08')
      let driver:Driver = Driver.create();
      windowSnap.snapShot();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentCanvasModifier08'),1000);
      await button.click();
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0780 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0740
     * @tc.name   : setTransform scaleY is -1
     * @tc.desc   : Verify canvas modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0740', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0740 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasModifier/UiComponentCanvasModifier09')
      let driver:Driver = Driver.create();
      windowSnap.snapShot();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentCanvasModifier09'),1000);
      await button.click();
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0740 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0790
     * @tc.name   : setTransform rotateX is 0.5
     * @tc.desc   : Verify canvas modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0790', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0790 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasModifier/UiComponentCanvasModifier10')
      let driver:Driver = Driver.create();
      windowSnap.snapShot();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentCanvasModifier10'),1000);
      await button.click();
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0790 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0810
     * @tc.name   : setTransform rotateY is 0.5
     * @tc.desc   : Verify canvas modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0810', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0810 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasModifier/UiComponentCanvasModifier11')
      let driver:Driver = Driver.create();
      windowSnap.snapShot();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentCanvasModifier11'),1000);
      await button.click();
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0810 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0800
     * @tc.name   : setTransform rotateX is -0.5
     * @tc.desc   : Verify canvas modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0800', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0800 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasModifier/UiComponentCanvasModifier12')
      let driver:Driver = Driver.create();
      windowSnap.snapShot();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentCanvasModifier12'),1000);
      await button.click();
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0800 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0750
     * @tc.name   : setTransform scaleX is -1
     * @tc.desc   : Verify canvas modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0750', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0750 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasModifier/UiComponentCanvasModifier13')
      let driver:Driver = Driver.create();
      windowSnap.snapShot();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentCanvasModifier13'),1000);
      await button.click();
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0750 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0850
     * @tc.name   : setTransform scaleX=1.5 scaleY=1.5
     * @tc.desc   : Verify canvas modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0850', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0850 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasModifier/UiComponentCanvasModifier14')
      let driver:Driver = Driver.create();
      windowSnap.snapShot();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentCanvasModifier14'),1000);
      await button.click();
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0850 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0920
     * @tc.name   : setTransform translateY=-50
     * @tc.desc   : Verify canvas modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0920', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0920 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasModifier/UiComponentCanvasModifier15')
      let driver:Driver = Driver.create();
      windowSnap.snapShot();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentCanvasModifier15'),1000);
      await button.click();
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0920 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0900
     * @tc.name   : setTransform translateY=50
     * @tc.desc   : Verify canvas modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0900', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0900 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasModifier/UiComponentCanvasModifier16')
      let driver:Driver = Driver.create();
      windowSnap.snapShot();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentCanvasModifier16'),1000);
      await button.click();
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0900 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0890
     * @tc.name   : setTransform translateX=1000
     * @tc.desc   : Verify canvas modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0890', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0890 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasModifier/UiComponentCanvasModifier17')
      let driver:Driver = Driver.create();
      windowSnap.snapShot();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentCanvasModifier17'),1000);
      await button.click();
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0890 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0820
     * @tc.name   : setTransform rotateY=-0.5
     * @tc.desc   : Verify canvas modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0820', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0820 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasModifier/UiComponentCanvasModifier18')
      let driver:Driver = Driver.create();
      windowSnap.snapShot();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentCanvasModifier18'),1000);
      await button.click();
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0820 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0830
     * @tc.name   : setTransform translateY=50 translateX=50
     * @tc.desc   : Verify canvas modifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0830', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0830 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/CanvasModifier/UiComponentCanvasModifier19')
      let driver:Driver = Driver.create();
      windowSnap.snapShot();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentCanvasModifier19'),1000);
      await button.click();
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_CANVAS_MODIFIER_0830 finish.`);
      done()
    })

  })
}