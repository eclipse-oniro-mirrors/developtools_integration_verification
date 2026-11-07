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
struct UiComponentTextTextRichtext0100 {
  build() {
    Scroll() {
      Column() {
        // 页面描述
        Text('测试编号：SUB_ACE_UI_COMPONENT_TEXT_TEXT_RICHTEXT_0100')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })
        Text('测试名称：图片的垂直对齐(图文混排，多行单个图片)')
          .fontSize(12)
          .fontColor(Color.Gray)
          .margin({ bottom: 10 })

        // 图片位于第一行行首，对齐方式未设定，第二行没有图片
        Text() {
          ImageSpan($r('sys.media.ohos_app_icon')).width(50).height(50)
          Span('第一行文本内容比较长需要换行\n第二行文本内容没有图片')
        }
        .width(280)
        .fontSize(16)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_image_line1_start_default_0100')

        // 图片位于第一行中间，对齐方式BASELINE，第二行没有图片
        Text() {
          Span('第一行')
          ImageSpan($r('sys.media.ohos_app_icon')).width(50).height(50).verticalAlign(ImageSpanAlignment.BASELINE)
          Span('文本内容比较长需要换行\n第二行文本内容没有图片')
        }
        .width(280)
        .fontSize(16)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_image_line1_middle_baseline_0100')

        // 图片位于第一行行尾，对齐方式CENTER，第二行没有图片
        Text() {
          Span('第一行文本内容比较长需要换行')
          ImageSpan($r('sys.media.ohos_app_icon')).width(50).height(50).verticalAlign(ImageSpanAlignment.CENTER)
          Span('\n第二行文本内容没有图片')
        }
        .width(280)
        .fontSize(16)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_image_line1_end_center_0100')

        // 图片位于第一行行尾，对齐方式TOP，第二行没有图片
        Text() {
          Span('第一行文本内容比较长需要换行')
          ImageSpan($r('sys.media.ohos_app_icon')).width(50).height(50).verticalAlign(ImageSpanAlignment.TOP)
          Span('\n第二行文本内容没有图片')
        }
        .width(280)
        .fontSize(16)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_image_line1_end_top_0100')

        // 图片位于第二行行首，对齐方式未设定，第一行没有图片
        Text() {
          Span('第一行文本内容没有图片\n')
          ImageSpan($r('sys.media.ohos_app_icon')).width(50).height(50)
          Span('第二行文本内容')
        }
        .width(280)
        .fontSize(16)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_image_line2_start_default_0100')

        // 图片位于第二行中间，对齐方式BASELINE，第一行没有图片
        Text() {
          Span('第一行文本内容没有图片\n第二行')
          ImageSpan($r('sys.media.ohos_app_icon')).width(50).height(50).verticalAlign(ImageSpanAlignment.BASELINE)
          Span('文本内容')
        }
        .width(280)
        .fontSize(16)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_image_line2_middle_baseline_0100')

        // 图片位于第二行行尾，对齐方式CENTER，第一行没有图片
        Text() {
          Span('第一行文本内容没有图片\n第二行文本内容')
          ImageSpan($r('sys.media.ohos_app_icon')).width(50).height(50).verticalAlign(ImageSpanAlignment.CENTER)
        }
        .width(280)
        .fontSize(16)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_image_line2_end_center_0100')

        // 图片位于第二行行尾，对齐方式TOP，第一行没有图片
        Text() {
          Span('第一行文本内容没有图片\n第二行文本内容')
          ImageSpan($r('sys.media.ohos_app_icon')).width(50).height(50).verticalAlign(ImageSpanAlignment.TOP)
        }
        .width(280)
        .fontSize(16)
        .border({ width: 1, color: Color.Gray })
        .padding(10)
        .margin(10)
        .id('text_image_line2_end_top_0100')
      }
      .width('100%')
      .padding(20)
    }
  }
}

