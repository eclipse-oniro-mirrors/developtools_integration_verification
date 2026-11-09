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

export default function uiComponentMediaTimepickerStartEndTime() {

  describe('uiComponentMediaTimepickerStartEndTime', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0015
     * @tc.name   : ComponentCotent's dispose method test
     * @tc.desc   : Verify media TimePicker startendtime interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0015', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0015 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerStartEndTimeAlt/UiComponentMediaTimepickerStartEndTime01')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnableCascade01_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnableCascade01_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnableCascade01_03'),1000);
      let text: Component = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnableCascade01'),1000);
      await button01.click()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await text.click();
      await driver.waitForIdle(500,2000)
      await button02.click()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await text.click();
      await driver.waitForIdle(500,2000)
      await button03.click()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await text.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0015 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0021
     * @tc.name   : TimePicker 12h start/end exception test
     * @tc.desc   : Verify media TimePicker startendtime interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0021', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0021 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerStartEndTimeAlt/UiComponentMediaTimepickerStartEndTime02')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnableCascade02_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnableCascade02_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnableCascade02_03'),1000);
      let text: Component = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnableCascade02'),1000);
      await button01.click()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await text.click();
      await driver.waitForIdle(500,2000)
      await button02.click()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await text.click();
      await driver.waitForIdle(500,2000)
      await button03.click()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await text.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0021 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0022
     * @tc.name   : TimePicker start after end test
     * @tc.desc   : Verify media TimePicker startendtime interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0022', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0022 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerStartEndTimeAlt/UiComponentMediaTimepickerStartEndTime03')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnableCascade03_01'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0022 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0024
     * @tc.name   : TimePicker selected before start test
     * @tc.desc   : Verify media TimePicker startendtime interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0024', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0024 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerStartEndTimeAlt/UiComponentMediaTimepickerStartEndTime04')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnableCascade04_01'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button01.click()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0024 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0025
     * @tc.name   : TimePicker selected after end test
     * @tc.desc   : Verify media TimePicker startendtime interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0025', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0025 start.`);
      Settings.createWindow('testability/pages/component/picker/MediaTimepickerStartEndTimeAlt/UiComponentMediaTimepickerStartEndTime05')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentMediaTimepickerEnableCascade05_01'),1000);
      await button01.click()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0025 finish.`);
      done()
    })


  })
}