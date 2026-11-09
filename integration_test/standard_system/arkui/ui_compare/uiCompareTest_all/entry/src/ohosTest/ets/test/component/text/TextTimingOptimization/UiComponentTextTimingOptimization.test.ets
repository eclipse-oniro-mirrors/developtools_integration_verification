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

export default function uiComponentTextTimingOptimization() {

  describe('uiComponentTextTimingOptimization', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0060
     * @tc.name   : Bind the LINE_HEIGHT type attribute string in the attribute string aboutToAppear
     * @tc.desc   : Verify text timing optimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0060 start.`);
      Settings.createWindow('testability/pages/component/text/TextTimingOptimization/UiComponentTextTimingOptimization01')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0080
     * @tc.name   : Bind the URL type attribute string in the attribute string aboutToAppear
     * @tc.desc   : Verify text timing optimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0080 start.`);
      Settings.createWindow('testability/pages/component/text/TextTimingOptimization/UiComponentTextTimingOptimization02')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let text: Component = await driver.waitForComponent(ON.id('UiComponentTextTimingOptimization02'),1000);
      let point=await text.getBoundsCenter()
      await driver.click(point.x,point.y)
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0010
     * @tc.name   : Bind the FONT type attribute string in the attribute string aboutToAppear
     * @tc.desc   : Verify text timing optimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0010 start.`);
      Settings.createWindow('testability/pages/component/text/TextTimingOptimization/UiComponentTextTimingOptimization03')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0030
     * @tc.name   : Bind the BASELINE_OFFSET type attribute string in the attribute string aboutToAppear
     * @tc.desc   : Verify text timing optimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0030 start.`);
      Settings.createWindow('testability/pages/component/text/TextTimingOptimization/UiComponentTextTimingOptimization04')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0040
     * @tc.name   : Bind the LETTER_SPACING type attribute string in the attribute string aboutToAppear
     * @tc.desc   : Verify text timing optimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0040 start.`);
      Settings.createWindow('testability/pages/component/text/TextTimingOptimization/UiComponentTextTimingOptimization05')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0070
     * @tc.name   : Bind the BACKGROUND_COLOR type attribute string in the attribute string aboutToAppear
     * @tc.desc   : Verify text timing optimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0070 start.`);
      Settings.createWindow('testability/pages/component/text/TextTimingOptimization/UiComponentTextTimingOptimization06')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0020
     * @tc.name   : Bind the DECORATION type attribute string in the attribute string aboutToAppear
     * @tc.desc   : Verify text timing optimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0020 start.`);
      Settings.createWindow('testability/pages/component/text/TextTimingOptimization/UiComponentTextTimingOptimization07')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0090
     * @tc.name   : Bind the GESTURE type attribute string in the attribute string aboutToAppear
     * @tc.desc   : Verify text timing optimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0090 start.`);
      Settings.createWindow('testability/pages/component/text/TextTimingOptimization/UiComponentTextTimingOptimization08')
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000);
      let text: Component = await driver.waitForComponent(ON.id('UiComponentTextTimingOptimization08'),1000);
      let point=await text.getBoundsCenter()
      await driver.click(point.x,point.y)
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0110
     * @tc.name   : Bind the IMAGE type attribute string in the attribute string aboutToAppear
     * @tc.desc   : Verify text timing optimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0110 start.`);
      Settings.createWindow('testability/pages/component/text/TextTimingOptimization/UiComponentTextTimingOptimization09')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0050
     * @tc.name   : Bind the TEXT_SHADOW type attribute string in the attribute string aboutToAppear
     * @tc.desc   : Verify text timing optimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0050 start.`);
      Settings.createWindow('testability/pages/component/text/TextTimingOptimization/UiComponentTextTimingOptimization10')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0100
     * @tc.name   : Bind the PARAGRAPH_STYLE type attribute string in the attribute string aboutToAppear
     * @tc.desc   : Verify text timing optimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0100 start.`);
      Settings.createWindow('testability/pages/component/text/TextTimingOptimization/UiComponentTextTimingOptimization11')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0130
     * @tc.name   : Multiple text components are displayed simultaneously
     * @tc.desc   : Verify text timing optimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0130 start.`);
      Settings.createWindow('testability/pages/component/text/TextTimingOptimization/UiComponentTextTimingOptimization12')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TIMING_OPTIMIZATION_0130 finish.`);
      done()
    })
  })
}