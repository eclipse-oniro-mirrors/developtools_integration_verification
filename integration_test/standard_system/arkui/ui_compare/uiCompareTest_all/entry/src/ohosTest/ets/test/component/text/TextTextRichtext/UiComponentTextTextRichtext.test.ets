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

import { afterEach, describe, it, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import Utils from '../../../model/Utils'
import { Driver, ON } from '@kit.TestKit'
import { uiAppearance } from '@kit.ArkUI'
import windowSnap from '../../../model/snapShot'
import TestHelper from '../../../model/TestHelper'

export default function uiComponentTextTextRichtext() {
  describe('uiComponentTextTextRichtext', () => {

    afterEach(async (done: Function) => {

      await TestHelper.destroyWindow()

      done()

    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0050
     * @tc.name   : Horizontal alignment of Text when the child component type is plain text
     * @tc.desc   : Verify text richtext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0050', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextTextRichtext/UiComponentTextTextRichtext0050')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 设置为浅色模式
      uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT)
      await Utils.sleep(500)

      // 1、查找各种对齐方式的Text组件
      let text_single_default_0050 = await driver.waitForComponent(ON.id('text_single_default_0050'), 500)
      let text_multi_end_0050 = await driver.waitForComponent(ON.id('text_multi_end_0050'), 500)
      await Utils.sleep(500)

      // 2、截图验证不同对齐方式的效果
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0050_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0080
     * @tc.name   : Indentation of Text component (plain text)
     * @tc.desc   : Verify text richtext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0080', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextTextRichtext/UiComponentTextTextRichtext0080')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 设置为浅色模式
      uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT)
      await Utils.sleep(500)

      // 1、查找缩进测试组件
      let text_dynamic_indent_0080 = await driver.waitForComponent(ON.id('text_dynamic_indent_0080'), 500)
      await Utils.sleep(500)

      // 2、截图验证缩进量50的效果
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0080_01')
      await Utils.sleep(1000)

      // 3、点击按钮设置缩进为0
      let button_indent_zero_0080 = await driver.waitForComponent(ON.id('button_indent_zero_0080'), 500)
      await button_indent_zero_0080.click()
      await Utils.sleep(500)

      // 4、截图验证缩进为0的效果
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0080_02')
      await Utils.sleep(1000)

      // 5、点击按钮设置缩进为负数
      let button_indent_negative_0080 = await driver.waitForComponent(ON.id('button_indent_negative_0080'), 500)
      await button_indent_negative_0080.click()
      await Utils.sleep(500)

      // 6、截图验证负数缩进的效果
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0080_03')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0060
     * @tc.name   : Indentation of Text component (image-text mixed)
     * @tc.desc   : Verify text richtext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0060', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextTextRichtext/UiComponentTextTextRichtext0060')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 设置为浅色模式
      uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT)
      await Utils.sleep(500)

      // 1、查找图文混排缩进测试组件
      let text_dynamic_indent_0060 = await driver.waitForComponent(ON.id('text_dynamic_indent_0060'), 500)
      await Utils.sleep(500)

      // 2、截图验证缩进量4的效果
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0060_01')
      await Utils.sleep(1000)

      // 3、点击按钮设置缩进为0
      let button_indent_zero_0060 = await driver.waitForComponent(ON.id('button_indent_zero_0060'), 500)
      await button_indent_zero_0060.click()
      await Utils.sleep(500)

      // 4、截图验证缩进为0的效果
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0060_02')
      await Utils.sleep(1000)

      // 5、点击按钮设置缩进为负数
      let button_indent_negative_0060 = await driver.waitForComponent(ON.id('button_indent_negative_0060'), 500)
      await button_indent_negative_0060.click()
      await Utils.sleep(500)

      // 6、截图验证负数缩进的效果
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0060_03')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0010
     * @tc.name   : ImageSpan construction parameter value is null/undefined/empty string/not an image
     * @tc.desc   : Verify text richtext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0010', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextTextRichtext/UiComponentTextTextRichtext0010')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 设置为浅色模式
      uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT)
      await Utils.sleep(500)

      // 1、查找测试组件
      let text_imagespan_null_0010 = await driver.waitForComponent(ON.id('text_imagespan_null_0010'), 500)
      let text_imagespan_invalid_0010 = await driver.waitForComponent(ON.id('text_imagespan_invalid_0010'), 500)
      await Utils.sleep(500)

      // 2、截图验证无效参数时不显示图片的效果
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0010_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0070
     * @tc.name   : Indentation of Text component (pure images)
     * @tc.desc   : Verify text richtext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0070', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextTextRichtext/UiComponentTextTextRichtext0070')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 设置为浅色模式
      uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT)
      await Utils.sleep(500)

      // 1、查找纯图片缩进测试组件
      let text_dynamic_indent_0070 = await driver.waitForComponent(ON.id('text_dynamic_indent_0070'), 500)
      await Utils.sleep(500)

      // 2、截图验证缩进量4的效果
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0070_01')
      await Utils.sleep(1000)

      // 3、点击按钮设置缩进为0
      let button_indent_zero_0070 = await driver.waitForComponent(ON.id('button_indent_zero_0070'), 500)
      await button_indent_zero_0070.click()
      await Utils.sleep(500)

      // 4、截图验证缩进为0的效果
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0070_02')
      await Utils.sleep(1000)

      // 5、点击按钮设置缩进为负数
      let button_indent_negative_0070 = await driver.waitForComponent(ON.id('button_indent_negative_0070'), 500)
      await button_indent_negative_0070.click()
      await Utils.sleep(500)

      // 6、截图验证负数缩进的效果
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0070_03')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0100
     * @tc.name   : Vertical alignment of images (image-text mixed, multi-line single image)
     * @tc.desc   : Verify text richtext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0100', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextTextRichtext/UiComponentTextTextRichtext0100')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 设置为浅色模式
      uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT)
      await Utils.sleep(500)

      // 1、查找各种垂直对齐方式的组件
      let text_image_line1_start_default_0100 = await driver.waitForComponent(ON.id('text_image_line1_start_default_0100'), 500)
      let text_image_line2_end_top_0100 = await driver.waitForComponent(ON.id('text_image_line2_end_top_0100'), 500)
      await Utils.sleep(500)

      // 2、截图验证不同垂直对齐方式的效果
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0100_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0030
     * @tc.name   : Horizontal alignment when Text child component type is image and text mixed (single line)
     * @tc.desc   : Verify text richtext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0030', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextTextRichtext/UiComponentTextTextRichtext0030')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 设置为浅色模式
      uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT)
      await Utils.sleep(500)

      // 1、查找各种水平对齐方式的图文混排组件
      let text_image_start_default_0030 = await driver.waitForComponent(ON.id('text_image_start_default_0030'), 500)
      let text_image_end_end_0030 = await driver.waitForComponent(ON.id('text_image_end_end_0030'), 500)
      await Utils.sleep(500)

      // 2、截图验证不同水平对齐方式的效果
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0030_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0020
     * @tc.name   : Horizontal alignment when Text child component type is image and text mixed (two lines)
     * @tc.desc   : Verify text richtext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0020', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextTextRichtext/UiComponentTextTextRichtext0020')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 设置为浅色模式
      uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT)
      await Utils.sleep(500)

      // 1、查找各种水平对齐方式的两行图文混排组件
      let text_image_start_default_0020 = await driver.waitForComponent(ON.id('text_image_start_default_0020'), 500)
      let text_image_end_end_0020 = await driver.waitForComponent(ON.id('text_image_end_end_0020'), 500)
      await Utils.sleep(500)

      // 2、截图验证不同水平对齐方式的效果
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0020_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0130
     * @tc.name   : Image scaling (ImageSpan width/height greater than image width/height)
     * @tc.desc   : Verify text richtext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0130', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextTextRichtext/UiComponentTextTextRichtext0130')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 设置为浅色模式
      uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT)
      await Utils.sleep(500)

      // 1、查找图片缩放测试组件
      let text_image_scale_0130 = await driver.waitForComponent(ON.id('text_image_scale_0130'), 500)
      await Utils.sleep(500)

      // 2、点击按钮设置宽高大于图片大小
      let button_size_large_0130 = await driver.waitForComponent(ON.id('button_size_large_0130'), 500)
      await button_size_large_0130.click()
      await Utils.sleep(500)

      // 3、截图验证默认缩放效果
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0130_01')
      await Utils.sleep(1000)

      // 4、测试Contain缩放
      let button_fit_contain_0130 = await driver.waitForComponent(ON.id('button_fit_contain_0130'), 500)
      await button_fit_contain_0130.click()
      await Utils.sleep(500)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0130_02')
      await Utils.sleep(1000)

      // 5、测试Cover缩放
      let button_fit_cover_0130 = await driver.waitForComponent(ON.id('button_fit_cover_0130'), 500)
      await button_fit_cover_0130.click()
      await Utils.sleep(500)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0130_03')
      await Utils.sleep(1000)

      // 6、测试Auto缩放
      let button_fit_auto_0130 = await driver.waitForComponent(ON.id('button_fit_auto_0130'), 500)
      await button_fit_auto_0130.click()
      await Utils.sleep(500)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0130_04')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0120
     * @tc.name   : Vertical alignment of images (pure images)
     * @tc.desc   : Verify text richtext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0120', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextTextRichtext/UiComponentTextTextRichtext0120')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 设置为浅色模式
      uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT)
      await Utils.sleep(500)

      // 1、查找各种垂直对齐方式的纯图片组件
      let text_single_image_default_0120 = await driver.waitForComponent(ON.id('text_single_image_default_0120'), 500)
      let text_double_image_center_top_0120 = await driver.waitForComponent(ON.id('text_double_image_center_top_0120'), 500)
      await Utils.sleep(500)

      // 2、截图验证不同垂直对齐方式的效果
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0120_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0140
     * @tc.name   : Image scaling (ImageSpan width/height equal to image width/height)
     * @tc.desc   : Verify text richtext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0140', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextTextRichtext/UiComponentTextTextRichtext0140')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 设置为浅色模式
      uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT)
      await Utils.sleep(500)

      // 1、查找图片缩放测试组件
      let text_image_scale_equal_0140 = await driver.waitForComponent(ON.id('text_image_scale_equal_0140'), 500)
      await Utils.sleep(500)

      // 2、点击按钮设置宽高等于图片大小
      let button_size_equal_0140 = await driver.waitForComponent(ON.id('button_size_equal_0140'), 500)
      await button_size_equal_0140.click()
      await Utils.sleep(500)

      // 3、截图验证默认缩放效果
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0140_01')
      await Utils.sleep(1000)

      // 4、测试Contain缩放
      let button_fit_contain_0140 = await driver.waitForComponent(ON.id('button_fit_contain_0140'), 500)
      await button_fit_contain_0140.click()
      await Utils.sleep(500)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0140_02')
      await Utils.sleep(1000)

      // 5、测试Cover缩放
      let button_fit_cover_0140 = await driver.waitForComponent(ON.id('button_fit_cover_0140'), 500)
      await button_fit_cover_0140.click()
      await Utils.sleep(500)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0140_03')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0150
     * @tc.name   : Default values of interface parameters
     * @tc.desc   : Verify text richtext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0150', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextTextRichtext/UiComponentTextTextRichtext0150')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 设置为浅色模式
      uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT)
      await Utils.sleep(500)

      // 1、查找测试默认值的组件
      let text_verticalalign_null_0150 = await driver.waitForComponent(ON.id('text_verticalalign_null_0150'), 500)
      let text_textindent_undefined_0150 = await driver.waitForComponent(ON.id('text_textindent_undefined_0150'), 500)
      await Utils.sleep(500)

      // 2、截图验证各接口参数默认值的效果
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0150_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0110
     * @tc.name   : Vertical alignment of images (image-text mixed, multi-line multiple images)
     * @tc.desc   : Verify text richtext interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0110', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextTextRichtext/UiComponentTextTextRichtext0110')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 设置为浅色模式
      uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT)
      await Utils.sleep(500)

      // 1、查找多图片垂直对齐测试组件
      let text_multi_images_0110 = await driver.waitForComponent(ON.id('text_multi_images_0110'), 500)
      await Utils.sleep(500)

      // 2、截图验证初始状态：图片正常显示，且按设定的对齐方式对齐
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0110_01')
      await Utils.sleep(1000)

      // 3、动态改变图片对齐方式 - 改变第1张图片为BOTTOM
      let button_change_align1_0110 = await driver.waitForComponent(ON.id('button_change_align1_0110'), 500)
      await button_change_align1_0110.click()
      await Utils.sleep(500)

      // 4、动态改变图片对齐方式 - 改变第2张图片为TOP
      let button_change_align2_0110 = await driver.waitForComponent(ON.id('button_change_align2_0110'), 500)
      await button_change_align2_0110.click()
      await Utils.sleep(500)

      // 5、动态改变图片对齐方式 - 改变第4张图片为CENTER
      let button_change_align4_0110 = await driver.waitForComponent(ON.id('button_change_align4_0110'), 500)
      await button_change_align4_0110.click()
      await Utils.sleep(500)

      // 6、截图验证图片对齐方式改变后的效果
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0110_02')
      await Utils.sleep(1000)

      // 7、动态改变字体大小为20
      let button_change_fontsize_large_0110 = await driver.waitForComponent(ON.id('button_change_fontsize_large_0110'), 500)
      await button_change_fontsize_large_0110.click()
      await Utils.sleep(500)

      // 8、截图验证字体大小改变为20后的效果
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0110_03')
      await Utils.sleep(1000)

      // 9、动态改变字体大小为12
      let button_change_fontsize_small_0110 = await driver.waitForComponent(ON.id('button_change_fontsize_small_0110'), 500)
      await button_change_fontsize_small_0110.click()
      await Utils.sleep(500)

      // 10、截图验证字体大小改变为12后的效果
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0110_04')
      await Utils.sleep(1000)

      done();
    })

  })
}