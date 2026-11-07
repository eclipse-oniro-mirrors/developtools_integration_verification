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

export default function uiComponentMediaTextPickerColumnWidths() {

  describe('uiComponentMediaTextPickerColumnWidths', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0036
     * @tc.name   : When range consists of n (n > 1) columns of data, of type string[][], set the length of columnWidths to n. If all columns are set to percent, the display effect when the percentages sum to 100.
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0036', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0036 start.`);
      Settings.createWindow('testability/pages/component/text_picker/MediaTextPickerColumnWidthsAlt/UiComponentMediaTextPickerColumnWidths01')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0036 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0037
     * @tc.name   : TextPicker columnWidths percent sum greater than 100
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0037', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0037 start.`);
      Settings.createWindow('testability/pages/component/text_picker/MediaTextPickerColumnWidthsAlt/UiComponentMediaTextPickerColumnWidths02')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0037 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0038
     * @tc.name   : TextPicker columnWidths percent sum less than 100
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0038', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0038 start.`);
      Settings.createWindow('testability/pages/component/text_picker/MediaTextPickerColumnWidthsAlt/UiComponentMediaTextPickerColumnWidths03')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0038 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0039
     * @tc.name   : TextPicker columnWidths all vp with different values
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0039', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0039 start.`);
      Settings.createWindow('testability/pages/component/text_picker/MediaTextPickerColumnWidthsAlt/UiComponentMediaTextPickerColumnWidths04')
      let driver:Driver=Driver.create();
      let button = await driver.waitForComponent(ON.id('UiComponentMediaTextPickerColumnWidths04_01'),1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0039 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0040
     * @tc.name   : TextPicker columnWidths all px with different values
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0040', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0040 start.`);
      Settings.createWindow('testability/pages/component/text_picker/MediaTextPickerColumnWidthsAlt/UiComponentMediaTextPickerColumnWidths05')
      let driver:Driver=Driver.create();
      let button = await driver.waitForComponent(ON.id('UiComponentMediaTextPickerColumnWidths05_01'),1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0041
     * @tc.name   : TextPicker columnWidths mixed vp px percent
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0041', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0041 start.`);
      Settings.createWindow('testability/pages/component/text_picker/MediaTextPickerColumnWidthsAlt/UiComponentMediaTextPickerColumnWidths06')
      let driver:Driver=Driver.create();
      let button = await driver.waitForComponent(ON.id('UiComponentMediaTextPickerColumnWidths06_01'),1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0041 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0052
     * @tc.name   : When range is n (n > 1) columns of data and of type TextCascadePickerRangeContent[], set the length of columnWidths to n
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0052', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0052 start.`);
      Settings.createWindow('testability/pages/component/text_picker/MediaTextPickerColumnWidthsAlt/UiComponentMediaTextPickerColumnWidths07')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0052 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0053
     * @tc.name   : When range is n (n > 1) columns of data and of type TextCascadePickerRangeContent[], set the length of columnWidths to n, all columns are percent, and the sum of percentages is greater than 100
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0053', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0053 start.`);
      Settings.createWindow('testability/pages/component/text_picker/MediaTextPickerColumnWidthsAlt/UiComponentMediaTextPickerColumnWidths08')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0053 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0054
     * @tc.name   : When range is n (n > 1) columns of data and of type TextCascadePickerRangeContent[], set the length of columnWidths to n, and the sum of percentages is less than 100
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0054', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0054 start.`);
      Settings.createWindow('testability/pages/component/text_picker/MediaTextPickerColumnWidthsAlt/UiComponentMediaTextPickerColumnWidths09')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0054 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0055
     * @tc.name   : When range is n (n > 1) columns of data and of type TextCascadePickerRangeContent[], set the length of columnWidths to n, all columns are vp with different values
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0055', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0055 start.`);
      Settings.createWindow('testability/pages/component/text_picker/MediaTextPickerColumnWidthsAlt/UiComponentMediaTextPickerColumnWidths10')
      let driver:Driver=Driver.create();
      let button = await driver.waitForComponent(ON.id('UiComponentMediaTextPickerColumnWidths10_01'),1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0055 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0056
     * @tc.name   : When range is n (n > 1) columns of data and of type TextCascadePickerRangeContent[], set the length of columnWidths to n, all columns are px with different values
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0056', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0056 start.`);
      Settings.createWindow('testability/pages/component/text_picker/MediaTextPickerColumnWidthsAlt/UiComponentMediaTextPickerColumnWidths11')
      let driver:Driver=Driver.create();
      let button = await driver.waitForComponent(ON.id('UiComponentMediaTextPickerColumnWidths11_01'),1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0056 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0057
     * @tc.name   : When range is n (n > 1) columns of data and of type TextCascadePickerRangeContent[], set the length of columnWidths to n, mixed vp, px, percent
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0057', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0057 start.`);
      Settings.createWindow('testability/pages/component/text_picker/MediaTextPickerColumnWidthsAlt/UiComponentMediaTextPickerColumnWidths12')
      let driver:Driver=Driver.create();
      let button = await driver.waitForComponent(ON.id('UiComponentMediaTextPickerColumnWidths12_01'),1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0057 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0058
     * @tc.name   : When range is n (n > 1) columns of data and of type TextCascadePickerRangeContent[], set the length of columnWidths to n, all columns are empty array
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0058', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0058 start.`);
      Settings.createWindow('testability/pages/component/text_picker/MediaTextPickerColumnWidthsAlt/UiComponentMediaTextPickerColumnWidths13')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0058 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0064
     * @tc.name   : When range is n (n > 1) columns of data and of type TextCascadePickerRangeContent[], set the length of columnWidths > n
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0064', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0064 start.`);
      Settings.createWindow('testability/pages/component/text_picker/MediaTextPickerColumnWidthsAlt/UiComponentMediaTextPickerColumnWidths14')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0064 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0065
     * @tc.name   : When range is n (n > 1) columns of data and of type TextCascadePickerRangeContent[], set the length of columnWidths < n
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0065', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0065 start.`);
      Settings.createWindow('testability/pages/component/text_picker/MediaTextPickerColumnWidthsAlt/UiComponentMediaTextPickerColumnWidths15')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0065 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0066
     * @tc.name   : When range is n (n > 1) columns of data and of type TextCascadePickerRangeContent[], dynamically modify columnWidths value
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0066', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0066 start.`);
      Settings.createWindow('testability/pages/component/text_picker/MediaTextPickerColumnWidthsAlt/UiComponentMediaTextPickerColumnWidths16')
      let driver:Driver=Driver.create();
      let button = await driver.waitForComponent(ON.id('UiComponentMediaTextPickerColumnWidths16_01'),1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0066 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0012
     * @tc.name   : When range is single column data of type string[], set columnWidths length > 1
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0012', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0012 start.`);
      Settings.createWindow('testability/pages/component/text_picker/MediaTextPickerColumnWidthsAlt/UiComponentMediaTextPickerColumnWidths17')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0012 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0021
     * @tc.name   : When range is single column data of type string[], set columnWidths length < 1 (empty array)
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0021', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0021 start.`);
      Settings.createWindow('testability/pages/component/text_picker/MediaTextPickerColumnWidthsAlt/UiComponentMediaTextPickerColumnWidths18')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0021 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0022
     * @tc.name   : When range is single column data of type string[], set columnWidths width > TextPicker component width
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0022', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0022 start.`);
      Settings.createWindow('testability/pages/component/text_picker/MediaTextPickerColumnWidthsAlt/UiComponentMediaTextPickerColumnWidths19')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0022 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0023
     * @tc.name   : When range is single column data of type string[], dynamically switch columnWidths
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0023', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0023 start.`);
      Settings.createWindow('testability/pages/component/text_picker/MediaTextPickerColumnWidthsAlt/UiComponentMediaTextPickerColumnWidths20')
      let driver:Driver=Driver.create();
      let button = await driver.waitForComponent(ON.id('UiComponentMediaTextPickerColumnWidths20_01'),1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0023 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0024
     * @tc.name   : When range is single column data of type string[], dynamically switch columnWidths with divider margin
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0024', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0024 start.`);
      Settings.createWindow('testability/pages/component/text_picker/MediaTextPickerColumnWidthsAlt/UiComponentMediaTextPickerColumnWidths21')
      let driver:Driver=Driver.create();
      let button = await driver.waitForComponent(ON.id('UiComponentMediaTextPickerColumnWidths21_01'),1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0024 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0025
     * @tc.name   : When range is single column data of type string[], switch entire columnWidths array
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0025', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0025 start.`);
      Settings.createWindow('testability/pages/component/text_picker/MediaTextPickerColumnWidthsAlt/UiComponentMediaTextPickerColumnWidths22')
      let driver:Driver=Driver.create();
      let button = await driver.waitForComponent(ON.id('UiComponentMediaTextPickerColumnWidths22_01'),1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0025 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0032
     * @tc.name   : When range is single column data of type TextPickerRangeContent[], set columnWidths value > TextPicker component width
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0032', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0032 start.`);
      Settings.createWindow('testability/pages/component/text_picker/MediaTextPickerColumnWidthsAlt/UiComponentMediaTextPickerColumnWidths23')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0032 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0033
     * @tc.name   : When range is single column data of type TextPickerRangeContent[], set columnWidths length > 1
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0033', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0033 start.`);
      Settings.createWindow('testability/pages/component/text_picker/MediaTextPickerColumnWidthsAlt/UiComponentMediaTextPickerColumnWidths24')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0033 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0034
     * @tc.name   : When range is single column data of type TextPickerRangeContent[], set columnWidths length < 1 (empty array)
     * @tc.desc   : Verify media TextPicker columnwidths interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0034', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0034 start.`);
      Settings.createWindow('testability/pages/component/text_picker/MediaTextPickerColumnWidthsAlt/UiComponentMediaTextPickerColumnWidths25')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0034 finish.`);
      done()
    })

  })
}