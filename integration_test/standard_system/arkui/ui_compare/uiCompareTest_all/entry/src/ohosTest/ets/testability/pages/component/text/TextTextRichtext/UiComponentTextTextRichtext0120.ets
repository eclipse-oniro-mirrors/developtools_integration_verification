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

@Entry
@Component
struct UiComponentTextTextRichtext0120 {
  build() {
    Scroll() {
      Column() {
        // 页面描述
        Text('测试编号：SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0120')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })
        Text('测试名称：图片的垂直对齐(纯图片)')
          .fontSize(12)
          .fontColor(Color.Gray)
          .margin({ bottom: 10 })

        // 一个图片，垂直对齐方式未设定
        Text('一个图片，垂直对齐未设定：') {
          ImageSpan($r('sys.media.ohos_app_icon')).width(50).height(50)
        }
        .width('90%')
        .fontSize(16)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_single_image_default_0120')

        // 一个图片，垂直对齐方式BASELINE
        Text('一个图片，BASELINE对齐：') {
          ImageSpan($r('sys.media.ohos_app_icon')).width(50).height(50).verticalAlign(ImageSpanAlignment.BASELINE)
        }
        .width('90%')
        .fontSize(16)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_single_image_baseline_0120')

        // 一个图片，垂直对齐方式BOTTOM
        Text('一个图片，BOTTOM对齐：') {
          ImageSpan($r('sys.media.ohos_app_icon')).width(50).height(50).verticalAlign(ImageSpanAlignment.BOTTOM)
        }
        .width('90%')
        .fontSize(16)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_single_image_bottom_0120')

        // 一个图片，垂直对齐方式CENTER
        Text('一个图片，CENTER对齐：') {
          ImageSpan($r('sys.media.ohos_app_icon')).width(50).height(50).verticalAlign(ImageSpanAlignment.CENTER)
        }
        .width('90%')
        .fontSize(16)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_single_image_center_0120')

        // 一个图片，垂直对齐方式TOP
        Text('一个图片，TOP对齐：') {
          ImageSpan($r('sys.media.ohos_app_icon')).width(50).height(50).verticalAlign(ImageSpanAlignment.TOP)
        }
        .width('90%')
        .fontSize(16)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_single_image_top_0120')

        // 两个图片，垂直对齐方式分别为BASELINE和BOTTOM
        Text('两个图片BASELINE和BOTTOM：') {
          ImageSpan($r('sys.media.ohos_app_icon')).width(50).height(50).verticalAlign(ImageSpanAlignment.BASELINE)
          ImageSpan($r('sys.media.ohos_app_icon')).width(60).height(60).verticalAlign(ImageSpanAlignment.BOTTOM)
        }
        .width('90%')
        .fontSize(16)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_double_image_baseline_bottom_0120')

        // 两个图片，垂直对齐方式分别为CENTER和TOP
        Text('两个图片CENTER和TOP：') {
          ImageSpan($r('sys.media.ohos_app_icon')).width(50).height(50).verticalAlign(ImageSpanAlignment.CENTER)
          ImageSpan($r('sys.media.ohos_app_icon')).width(60).height(60).verticalAlign(ImageSpanAlignment.TOP)
        }
        .width('90%')
        .fontSize(16)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_double_image_center_top_0120')
      }
      .width('100%')
      .padding(20)
    }
  }
}

